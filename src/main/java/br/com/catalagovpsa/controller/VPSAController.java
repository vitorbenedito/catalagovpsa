package br.com.catalagovpsa.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2RestOperations;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.catalagovpsa.exception.CustomerNotFoundException;
import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;
import br.com.catalagovpsa.service.interfaces.SynchronizeService;


/**
 * @author Ryan Heaton
 * @author Dave Syer
 */
@Controller("vpsaController")
public class VPSAController {

	private OAuth2RestOperations template;

	private String loginDetail;	

	@Autowired
	private SynchronizeService synchronizeService;

	@Autowired
	private ProductRepository productRepository;

	public Customer getLoginDetails() throws CustomerNotFoundException {
		ObjectNode result = template.getForObject(loginDetail, ObjectNode.class);
		if (result != null) {
			OAuth2AccessToken token = template.getOAuth2ClientContext().getAccessToken();
			Customer customer = new Customer(result.get("usuario").get("id").getLongValue(), result.get("usuario").get("login").getTextValue(), result.get("empresa").get("cnpj").getTextValue(), token.getValue());
			synchronizeService.addCustomer(customer);
			return customer;
		}
		throw new CustomerNotFoundException();
	}

	/**
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/")
	public String index(Model model, HttpServletRequest request) throws Exception {
		Customer customer = getLoginDetails();
		List<Product> products = new ArrayList<Product>();
		int numberOfPages = productRepository.numberOfPages(customer.getCnpj());
		return prepareView(customer, products, numberOfPages, 0, model, request);
	}

	/**
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/filter/{filter}")
	public String filter(@PathVariable String filter, @RequestParam(required = false) Integer page, Model model, HttpServletRequest request) throws Exception {
		Customer customer = getLoginDetails();
		page = page == null ? 1 : page;
		List<Product> products = new ArrayList<Product>();
		int numberOfPages = 0;
		if(filter != null && !filter.isEmpty())
		{
			products = productRepository.filter(customer.getCnpj(), filter, page);
			numberOfPages = productRepository.numberOfPages(customer.getCnpj(), filter);
		}		
		return prepareView(customer, products, numberOfPages, page, model, request);
	}

	/**
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail/{id}")
	public String details(@PathVariable Long id, Model model) throws Exception {
		Customer customer = getLoginDetails();
		Product product = productRepository.get(customer.getCnpj(), id);
		model.addAttribute("product", product);		
		return "detail";
	}

	private String prepareView(Customer customer, List<Product> products, Integer numberOfPages, Integer currentPage, Model model, HttpServletRequest request) throws MalformedURLException {

		model.addAttribute("products", products);
		model.addAttribute("numberOfPages", numberOfPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("prevPage", (currentPage > 1 && numberOfPages > 1) ? currentPage - 1 : 1);
		model.addAttribute("nextPage", (currentPage > 1 && numberOfPages > 1) ? currentPage + 1 : 2);

		if (products.size() > 0) {
			model.addAttribute("product", products.get(0));
		}

		return "principal";
	}

	/**
	 * 
	 * Reads uploades file.
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	private File readUploadedFile(MultipartFile file) throws IOException, IllegalStateException {
		String tempPath = System.getProperty("java.io.tmpdir");
		String tempFile = UUID.randomUUID().toString();
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		String fullPath = FilenameUtils.concat(tempPath, MessageFormat.format("{0}.{1}", tempFile, extension));
		File realFile = new File(fullPath);
		file.transferTo(realFile);
		return realFile;
	}

	public void setRestTemplate(OAuth2RestOperations restTemplate) {
		this.template = restTemplate;
	}

	public void setLoginDetail(String loginDetail) {
		this.loginDetail = loginDetail;
	}

}
