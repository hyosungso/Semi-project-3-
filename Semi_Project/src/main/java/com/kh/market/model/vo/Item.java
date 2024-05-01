package com.kh.market.model.vo;

public class Item {

	private int itemCode;
	private int category;
	private int price;
	private int salesVol;
	private String itemDetail;
	private String itemName;
	
	private String categoryName;
	
	
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(int itemCode, int category, int price, int salesVol, String itemDetail, String itemName) {
		super();
		this.itemCode = itemCode;
		this.category = category;
		this.price = price;
		this.salesVol = salesVol;
		this.itemDetail = itemDetail;
		this.itemName = itemName;
	}
	
	
	
	public Item(int itemCode, String categoryName, int price, String itemName) {
		super();
		this.itemCode = itemCode;
		this.categoryName = categoryName;
		this.price = price;
		this.itemName = itemName;
	}
	
	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSalesVol() {
		return salesVol;
	}
	public void setSalesVol(int salesVol) {
		this.salesVol = salesVol;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	
}
