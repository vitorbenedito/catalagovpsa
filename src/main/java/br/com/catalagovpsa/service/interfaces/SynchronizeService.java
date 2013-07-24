package br.com.catalagovpsa.service.interfaces;

import java.util.Date;
import java.util.List;

import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.model.UploadedFile;

public interface SynchronizeService {

	public int MAX_PRODUCTS_LIST_FROM_SERVICE = 100;	

	public void update();

	public void update(Customer customer);

	public void addCustomer(Customer customer);

}