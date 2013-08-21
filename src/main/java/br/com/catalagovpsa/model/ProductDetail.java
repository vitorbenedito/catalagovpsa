package br.com.catalagovpsa.model;

import java.math.BigDecimal;


public class ProductDetail {	
	
	private Long productId;

	private String description;
	
	private boolean isDescriptionCustomized;
	
	private String specification;
	
	private boolean isSpecificationCustomized;
	
	private BigDecimal sellingPrice;
	
	private boolean isSellingPriceCustomized;

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public BigDecimal getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(BigDecimal sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public boolean isDescriptionCustomized() {
		return isDescriptionCustomized;
	}

	public void setDescriptionCustomized(boolean isDescriptionCustomized) {
		this.isDescriptionCustomized = isDescriptionCustomized;
	}

	public boolean isSpecificationCustomized() {
		return isSpecificationCustomized;
	}

	public void setSpecificationCustomized(boolean isSpecificationCustomized) {
		this.isSpecificationCustomized = isSpecificationCustomized;
	}

	public boolean isSellingPriceCustomized() {
		return isSellingPriceCustomized;
	}

	public void setSellingPriceCustomized(boolean isSellingPriceCustomized) {
		this.isSellingPriceCustomized = isSellingPriceCustomized;
	}	
	
	
}
