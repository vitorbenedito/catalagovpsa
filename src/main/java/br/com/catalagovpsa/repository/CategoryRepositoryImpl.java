package br.com.catalagovpsa.repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.Category;
import br.com.catalagovpsa.repository.interfaces.CategoryRepository;


@Transactional
@Repository("categoryRepository")
public class CategoryRepositoryImpl implements CategoryRepository {

	@Autowired
	private MongoTemplate template;

	public void add(Category category) {
		template.save(category, COLLECTION_NAME);
	}

	public Category get(String cnpj, Long categoryId) {
		return template.findOne(new Query(Criteria.where("cnpj").is(cnpj).and("id").is(categoryId)), Category.class, COLLECTION_NAME);
	}

	public void delete(String cnpj, String id) {
		Category file = template.findOne(new Query(Criteria.where("id").is(id)), Category.class, COLLECTION_NAME);
		template.remove(file, COLLECTION_NAME);
	}

	public List<Category> all(String cnpj) {
		return template.findAll(Category.class, COLLECTION_NAME);
	}

	public List<Category> filter(String cnpj, String filter, int page) {
		return find(criteriaForFilter(cnpj, filter), page);
	}

	public List<Category> page(String cnpj, Integer page) {
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

	private List<Category> find(Criteria criteria, int page) {
		Query query = new Query(criteria);
		if (page > 0) {
			query.skip((page - 1) * PER_PAGE).limit(PER_PAGE);
		}
		return template.find(query, Category.class, COLLECTION_NAME);
	}
}
