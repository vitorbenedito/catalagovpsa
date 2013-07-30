package br.com.catalagovpsa.model;

import java.util.Calendar;

import br.com.catalagovpsa.utils.ParametrosRest;


public class Product {	
	
	private Long id;

	private String cnpj;

	private String description;

	private String systemCode;

	private String internalCode;

	private String specification;

	private String barCode;
	
	private Long categoryId;
	
	private Long data;

	public Long getId() {
		return id;
	}

	public Product() {
	}

	public Product(Long id, String name) {
		super();
		this.id = id;
		this.description = name;
	}

	public Product(Long id, String name, String cnpj) {
		super();
		this.id = id;
		this.description = name;
		this.cnpj = cnpj;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getSystemCode() {
		return systemCode;
	}

	public void setSystemCode(String systemCode) {
		this.systemCode = systemCode;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public String getInternalCode() {
		return internalCode;
	}

	public void setInternalCode(String internalCode) {
		this.internalCode = internalCode;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public Long getData() {
		return data;
	}
	
	public Calendar getCalendar() {
		if(data != null)
		{
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(data);
			return calendar;
		}
		return null;
	}
	
	public String getAlteradoApos() {
		if(getCalendar() != null)
		{
			return ParametrosRest.calendarToStringDataHora(getCalendar());
		}
		return "01/01/1990 00:00:00";
	}

	public void setData(Long data) {
		this.data = data;
	}	
}
