package br.com.catalagovpsa.repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.repository.interfaces.ProductRepository;


@Transactional
@Repository("productRepository")
public class ProductRepositoryImpl implements ProductRepository {

	@Autowired
	private MongoTemplate template;

	public void add(Product product) {
		template.save(product, COLLECTION_NAME);
	}

	public Product getMax(String cnpj, Long categoryId) {
	
		List<Product> list = template.find(new Query(Criteria.where("cnpj").is(cnpj).and("categoryId").is(categoryId)).with( new PageRequest(0,1,Direction.DESC,"controlId") ), Product.class, COLLECTION_NAME);
		
		if(list != null && list.size() > 0)
		{
			return list.get(0);
		}
		
		return null;
	}
	
	public Product get(String cnpj, Long productId) {
		return template.findOne(new Query(Criteria.where("cnpj").is(cnpj).and("id").is(productId)), Product.class, COLLECTION_NAME);
	}

	public void delete(String cnpj, String id) {
		Product file = template.findOne(new Query(Criteria.where("id").is(id)), Product.class, COLLECTION_NAME);
		template.remove(file, COLLECTION_NAME);
	}

	public List<Product> all(String cnpj) {
		return template.findAll(Product.class, COLLECTION_NAME);
	}

	public List<Product> filter(String cnpj, String filter, int page) {
		return find(criteriaForFilter(cnpj, filter), page);
	}

	public List<Product> page(String cnpj, Integer page) {
		if (page < 1) {
			throw new IllegalArgumentException("impossible to process page 0");
		}
		return find(Criteria.where("cnpj").is(cnpj), page);
	}

	public int numberOfPages(String cnpj, String filter) {
		return numberOfPages(criteriaForFilter(cnpj, filter));
	}

	public int numberOfPages(String cnpj) {
		return numberOfPages(Criteria.where("cnpj").is(cnpj));
	}

	public long count(String cnpj) {
		return template.count(new Query(Criteria.where("cnpj").is(cnpj)), COLLECTION_NAME);
	}

	private int numberOfPages(Criteria criteria) {
		long count = template.count(new Query(criteria), COLLECTION_NAME);
		BigDecimal bd = new BigDecimal(new Double(count / (PER_PAGE + 0.0)));
		bd = bd.setScale(0, BigDecimal.ROUND_UP);
		return bd.intValue();
	}

	private Criteria criteriaForFilter(String cnpj, String filter) {
		Pattern pattern = Pattern.compile(".*" + filter + ".*", Pattern.CASE_INSENSITIVE);
		Criteria criteria = Criteria.where("cnpj").is(cnpj).orOperator(Criteria.where("description").regex(pattern), Criteria.where("systemCode").regex(pattern), Criteria.where("internalCode").regex(pattern), Criteria.where("internalCode").regex(pattern), Criteria.where("specification").regex(pattern), Criteria.where("barCode").regex(pattern));
		return criteria;
	}

	private List<Product> find(Criteria criteria, int page) {
		Query query = new Query(criteria);
		if (page > 0) {
			query.skip((page - 1) * PER_PAGE).limit(PER_PAGE);
		}
		return template.find(query, Product.class, COLLECTION_NAME);
	}
}
