package br.com.catalagovpsa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.service.interfaces.CustomerService;

@Controller("homeController")
@RequestMapping("/adm")
public class HomeController {    
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/")
	public String index(Model model, HttpServletRequest request) throws Exception {

    	Customer customer = customerService.getCustomer();        					
		return prepareView(customer, model, request);        
    }			
    	
	private String prepareView(Customer customer, Model model, HttpServletRequest request) throws Exception {
				
		model.addAttribute("customer", customerService.getCustomer());
		
		return "/home";
	}
		
}
