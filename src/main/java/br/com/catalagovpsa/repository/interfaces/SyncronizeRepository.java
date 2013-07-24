package br.com.catalagovpsa.repository.interfaces;

import java.util.List;

import br.com.catalagovpsa.model.Customer;

public interface SyncronizeRepository {

	public String CUSTOMER_COLLECTION_NAME = "customers_syncronization";

	void addCustomer(Customer customer);

	List<Customer> allCustomers();

}