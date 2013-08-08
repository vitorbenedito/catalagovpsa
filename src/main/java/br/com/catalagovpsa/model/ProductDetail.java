package br.com.catalagovpsa.model;

import java.math.BigDecimal;
import java.util.LinkedList;


public class ProductDetail {	
	
	private Long productId;

	private String description;
	
	private String specification;
	
	private BigDecimal sellingPrice;
	
	private LinkedList<FileMeta> photos;

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

	public LinkedList<FileMeta> getPhotos() {
		if(photos == null)
		{
			photos = new LinkedList<FileMeta>();
		}
		return photos;
	}

	public void setPhotos(LinkedList<FileMeta> photos) {
		this.photos = photos;
	}
	
}
