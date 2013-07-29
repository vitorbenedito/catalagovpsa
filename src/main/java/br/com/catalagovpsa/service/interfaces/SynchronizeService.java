package br.com.catalagovpsa.service.interfaces;

import br.com.catalagovpsa.model.Customer;

public interface SynchronizeService {

	public int MAX_PRODUCTS_LIST_FROM_SERVICE = 100;	

	public void update();
	
	public void addCustomer(Customer customer);

}