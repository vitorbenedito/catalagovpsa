package br.com.catalagovpsa.repository.interfaces;

import java.util.List;

import br.com.catalagovpsa.model.Category;

public interface CategoryRepository {

	public String COLLECTION_NAME = "categorys";

	public int PER_PAGE = 10;

	List<Category> all(String cnpj);

	List<Category> page(String cnpj, Integer page);

	int numberOfPages(String cnpj);

	int numberOfPages(String cnpj, String filter);

	void add(Category category);

	Category get(String cnpj, Long categoryId);

	void delete(String cnpj, String id);

	List<Category> filter(String cnpj, String string, int page);

	long count(String cnpj);

}
