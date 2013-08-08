package br.com.catalagovpsa.service;

import java.text.MessageFormat;
import java.util.List;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.node.ArrayNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestOperations;

import br.com.catalagovpsa.model.Category;
import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.model.MetaFile;
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.model.TypeMetaFile;
import br.com.catalagovpsa.repository.interfaces.CategoryRepository;
import br.com.catalagovpsa.repository.interfaces.MetaFileRepository;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;
import br.com.catalagovpsa.repository.interfaces.SyncronizeRepository;
import br.com.catalagovpsa.service.interfaces.SynchronizeService;
import br.com.catalagovpsa.utils.ParametrosRest;


@Transactional
@Service("synchronizeService")
public class SynchronizeServiceImpl implements SynchronizeService {	

	@Autowired
	private SyncronizeRepository syncronizeRepository;

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private MetaFileRepository metaFileRepository;

	@Autowired
	private RestOperations synchronizeTemplate;

	private String productsList;
	
	private String categorysList;
	
	private String productPhotos;

	public void update() {
		List<Customer> customers = syncronizeRepository.allCustomers();
		if (customers != null && customers.size() > 0) {
			for (Customer customer : customers) {

				if (!StringUtils.hasText(customer.getToken())) {
					continue;
				}
				loadCategorys(customer,0);
				
				loadPhotos(customer);
			}
		}
	}
	
	private void loadPhotos(Customer customer) {
		
		List<Product> list = productRepository.all(customer.getCnpj());
		
		for(Product product: list){
			
			MetaFile max = metaFileRepository.getMax(customer.getCnpj(), product.getId(), TypeMetaFile.PRODUCT);				
			
			String alteradoApos = "01/01/1990 00:00:00";
			
			if(max != null)
			{			
				alteradoApos = max.getAlteradoApos();
			}					
		
			ArrayNode resultPhotos = synchronizeTemplate.getForObject(MessageFormat.format("{0}/{1}/{2}", productPhotos,customer.getCnpj(),alteradoApos), ArrayNode.class);
			
			if (resultPhotos == null || resultPhotos.size() == 0) {
				continue;
			}
			
			for (JsonNode node : resultPhotos) {
				
				MetaFile metaFile = metaFileRepository.get(customer.getCnpj(), node.get("id").getLongValue());

				if (metaFile == null) {
					metaFile = new MetaFile( node.get("cnpj").getTextValue(), product.getId());
				}
				else
				{
					boolean deletado =  node.get("name") != null ? node.get("name").getBooleanValue() : null;
					
					if(deletado)
					{
						metaFileRepository.delete(customer.getCnpj(), product.getId());
						continue;
					}
				}
				
				metaFile.setDate(node.get("modified") != null ? ParametrosRest.stringToCalendar( node.get("modified").getTextValue()).getTimeInMillis() : null);
				
				metaFile.setFileName( node.get("name") != null ? node.get("name").getTextValue() : null );
				metaFile.setFileSize( node.get("size") != null ? node.get("size").getTextValue() : null );								
				metaFile.setFileURL( node.get("url") != null ? node.get("url").getTextValue() : null );								
				metaFile.setId( node.get("id") != null ? node.get("id").getLongValue() : null );
				
				metaFileRepository.add(metaFile);
								
			}
			
			
		}
		
	}

	public void update(Customer customer) {
		processCustomer(customer);
	}
	
	private void processCustomer(Customer customer) {
		loadCategorys(customer, 0);
	}
	
	private void loadCategorys(Customer customer, Integer begin) throws RestClientException {

		ArrayNode result = synchronizeTemplate.getForObject(MessageFormat.format("{0}?inicio={1}&quantidade={2}&token={3}", categorysList, begin.toString(), MAX_PRODUCTS_LIST_FROM_SERVICE, customer.getToken()), ArrayNode.class);

		if (result == null || result.size() == 0) {
			return;
		}

		for (JsonNode node : result) {
			Category category = categoryRepository.get(customer.getCnpj(), node.get("id").getLongValue());

			if (category == null) {
				category = new Category(node.get("id").getLongValue(), node.get("nome").getTextValue(), customer.getCnpj());
			}

			category.setDescription(node.get("nome").getTextValue());
			category.setFatherId(node.get("categoriaPai") != null ? node.get("categoriaPai").getLongValue() : null);

			categoryRepository.add(category);
			
			loadProducts(customer, category.getId(), 0);
		}

		loadCategorys(customer, begin + MAX_PRODUCTS_LIST_FROM_SERVICE);

	}

	private void loadProducts(Customer customer,Long idCategory, Integer begin) throws RestClientException {

		
		Product max = productRepository.getMax(customer.getCnpj(), idCategory);				
		
		String alteradoApos = "01/01/1990 00:00:00";
		
		if(max != null)
		{			
			alteradoApos = max.getAlteradoApos();
		}
		
		ArrayNode result = synchronizeTemplate.getForObject(MessageFormat.format("{0}?inicio={1}&quantidade={2}&token={3}&categoria={4}&alteradoApos={5}", productsList, begin.toString(), MAX_PRODUCTS_LIST_FROM_SERVICE, customer.getToken(), idCategory,alteradoApos), ArrayNode.class);

		if (result == null || result.size() == 0) {
			return;
		}

		for (JsonNode node : result) {
			Product product = productRepository.getMax(customer.getCnpj(), node.get("id").getLongValue());

			if (product == null) {
				product = new Product(node.get("id").getLongValue(), node.get("descricao").getTextValue(), customer.getCnpj());
			}

			product.setDescription(node.get("descricao").getTextValue());
			product.setBarCode(node.get("codigoBarras") != null ? node.get("codigoBarras").getTextValue() : null);
			product.setSpecification(node.get("especificacao") != null ? node.get("especificacao").getTextValue() : null);
			product.setSystemCode(node.get("codigoSistema") != null ? node.get("codigoSistema").getTextValue() : null);
			product.setInternalCode(node.get("codigoInterno") != null ? node.get("codigoInterno").getTextValue() : null);
			product.setDate(node.get("dataAlteracao") != null ? ParametrosRest.stringToCalendar( node.get("dataAlteracao").getTextValue()).getTimeInMillis() : null);
			product.setSellingPrice(node.get("precoVenda") != null ? node.get("precoVenda").getDecimalValue() : null);
			product.setCategoryId(idCategory);						

			productRepository.add(product);
			
			
		}

		loadProducts(customer,idCategory, begin + MAX_PRODUCTS_LIST_FROM_SERVICE);

	}

	public void addCustomer(Customer customer) {
		long count = productRepository.count(customer.getCnpj());
		if (count == 0) {
			update(customer);
		}
		syncronizeRepository.addCustomer(customer);
	}

	public void setProductsList(String productsList) {
		this.productsList = productsList;
	}

	public String getCategorysList() {
		return categorysList;
	}

	public void setCategorysList(String categorysList) {
		this.categorysList = categorysList;
	}

	public String getProductPhotos() {
		return productPhotos;
	}

	public void setProductPhotos(String productPhotos) {
		this.productPhotos = productPhotos;
	}
	

}