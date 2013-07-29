package br.com.catalagovpsa.controller;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;
import br.com.catalagovpsa.service.interfaces.CustomerService;

@Controller("productController")
public class ProductController {    

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/adm")
	public String index(Model model, HttpServletRequest request) throws Exception {

    	Customer customer = customerService.getCustomer();
    	
		List<Product> products = new ArrayList<Product>();
		int numberOfPages = productRepository.numberOfPages(customer.getCnpj());
		return prepareView(customer, products, numberOfPages, 0, model, request);        
    }	
	
	@RequestMapping(value = "/filter/{filter}")
	public String filter(@PathVariable String filter, @RequestParam(required = false) Integer page, Model model, HttpServletRequest request) throws Exception {
		Customer customer = customerService.getCustomer();
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
		
	@RequestMapping(value = "/detail/{id}")
	public String details(@PathVariable Long id, Model model, HttpServletRequest request) throws Exception {
		Customer customer = customerService.getCustomer();
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

		return "/produtos/list";
	}
		
}
