package br.com.catalagovpsa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2RestOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.service.interfaces.CustomerService;
import br.com.catalagovpsa.service.interfaces.SynchronizeService;


@Transactional
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {	

	private OAuth2RestOperations template;

	private String loginDetail;			
	
	@Autowired
	private SynchronizeService synchronizeService;	
	
	public Customer getCustomer() throws Exception{
	
//		
//		if (result != null) {
//			OAuth2AccessToken token = template.getOAuth2ClientContext().getAccessToken();
//			Customer customer = new Customer(result.get("usuario").get("id").getLongValue(), result.get("usuario").get("login").getTextValue(), result.get("empresa").get("cnpj").getTextValue(), token.getValue());
//			synchronizeService.addCustomer(customer);
//			return customer;
//		}
		
		return new Customer(1L, "admin", "19251842000144", null);
		
//		throw new CustomerNotFoundException();
		
	}	
	
	public void setRestTemplate(OAuth2RestOperations restTemplate) {
		this.template = restTemplate;
	 }	

	public void setLoginDetail(String loginDetail) {
		this.loginDetail = loginDetail;
	}				

}