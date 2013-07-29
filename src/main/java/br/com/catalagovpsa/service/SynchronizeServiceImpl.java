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
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.repository.interfaces.CategoryRepository;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;
import br.com.catalagovpsa.repository.interfaces.SyncronizeRepository;
import br.com.catalagovpsa.service.interfaces.SynchronizeService;


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
	private RestOperations synchronizeTemplate;

	private String productsList;
	
	private String categorysList;

	public void update() {
		List<Customer> customers = syncronizeRepository.allCustomers();
		if (customers != null && customers.size() > 0) {
			for (Customer customer : customers) {

				if (!StringUtils.hasText(customer.getToken())) {
					continue;
				}
				loadCategorys(customer,0);
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
				category = new Category(node.get("id").getLongValue(), node.get("descricao").getTextValue(), customer.getCnpj());
			}

			category.setDescription(node.get("descricao").getTextValue());
			category.setBarCode(node.get("codigoBarras") != null ? node.get("codigoBarras").getTextValue() : null);
			category.setSpecification(node.get("especificacao") != null ? node.get("especificacao").getTextValue() : null);
			category.setSystemCode(node.get("codigoSistema") != null ? node.get("codigoSistema").getTextValue() : null);
			category.setInternalCode(node.get("codigoInterno") != null ? node.get("codigoInterno").getTextValue() : null);

			categoryRepository.add(category);
		}

		loadCategorys(customer, begin + MAX_PRODUCTS_LIST_FROM_SERVICE);

	}

	private void loadProducts(Customer customer,Integer idCategory, Integer begin) throws RestClientException {

		ArrayNode result = synchronizeTemplate.getForObject(MessageFormat.format("{0}?inicio={1}&quantidade={2}&token={3}", productsList, begin.toString(), MAX_PRODUCTS_LIST_FROM_SERVICE, customer.getToken()), ArrayNode.class);

		if (result == null || result.size() == 0) {
			return;
		}

		for (JsonNode node : result) {
			Product product = productRepository.get(customer.getCnpj(), node.get("id").getLongValue());

			if (product == null) {
				product = new Product(node.get("id").getLongValue(), node.get("descricao").getTextValue(), customer.getCnpj());
			}

			product.setDescription(node.get("descricao").getTextValue());
			product.setBarCode(node.get("codigoBarras") != null ? node.get("codigoBarras").getTextValue() : null);
			product.setSpecification(node.get("especificacao") != null ? node.get("especificacao").getTextValue() : null);
			product.setSystemCode(node.get("codigoSistema") != null ? node.get("codigoSistema").getTextValue() : null);
			product.setInternalCode(node.get("codigoInterno") != null ? node.get("codigoInterno").getTextValue() : null);

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
	

}