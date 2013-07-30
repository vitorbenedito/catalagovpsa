package br.com.catalagovpsa.model;


public class Category {

	private Long id;

	private String cnpj;

	private String description;

	private Long fatherId;
	
	public Category() {
	}

	public Category(Long id, String name) {
		super();
		this.id = id;
		this.description = name;
	}

	public Category(Long id, String name, String cnpj) {
		super();
		this.id = id;
		this.description = name;
		this.cnpj = cnpj;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getFatherId() {
		return fatherId;
	}

	public void setFatherId(Long fatherId) {
		this.fatherId = fatherId;
	}

}