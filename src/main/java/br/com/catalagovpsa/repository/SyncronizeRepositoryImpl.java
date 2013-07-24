package br.com.catalagovpsa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.Customer;
import br.com.catalagovpsa.repository.interfaces.SyncronizeRepository;


@Transactional
@Repository("syncronizeRepository")
public class SyncronizeRepositoryImpl implements SyncronizeRepository {

	@Autowired
	private MongoTemplate template;

	public void addCustomer(Customer customer) {
		Customer temp = template.findOne(new Query(Criteria.where("cnpj").is(customer.getCnpj())), Customer.class, CUSTOMER_COLLECTION_NAME);
		if (temp == null) {
			temp = customer;
		} else {
			temp.setToken(customer.getToken());
		}
		template.save(temp, CUSTOMER_COLLECTION_NAME);
	}

	public List<Customer> allCustomers() {
		return template.findAll(Customer.class, CUSTOMER_COLLECTION_NAME);
	}

}
