package br.com.catalagovpsa.repository.interfaces;

import java.util.List;

import br.com.catalagovpsa.model.Product;

public interface ProductRepository {

	public String COLLECTION_NAME = "uploader_products";

	public int PER_PAGE = 10;

	List<Product> all(String cnpj);

	List<Product> page(String cnpj, Integer page);

	int numberOfPages(String cnpj);

	int numberOfPages(String cnpj, String filter);

	void add(Product product);

	Product get(String cnpj, Long productId);

	void delete(String cnpj, String id);

	List<Product> filter(String cnpj, String string, int page);

	long count(String cnpj);

}
