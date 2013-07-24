package br.com.catalagovpsa.model;

public class Customer {

	private Long id;
	private String login;
	private String cnpj;
	private String token;

	public Long getId() {
		return id;
	}

	public Customer(Long id, String login, String cnpj, String token) {
		super();
		this.id = id;
		this.login = login;
		this.cnpj = cnpj;
		this.setToken(token);
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}
