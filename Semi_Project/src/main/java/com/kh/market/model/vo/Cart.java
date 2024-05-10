package com.kh.market.model.vo;

public class Cart {

	private int orderId;
	private int userNo;
	private int itemCode;
	private int itemQuantity;
	
	private String itemName;
	private int itemPrice;
	private int itemDicount;
	
	private int salePrice;
	private int totalPrice;
	
	
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Cart(int orderId, int userNo, int itemCode, int itemQuantity, String itemName, int itemPrice,
			int itemDicount) {
		super();
		this.orderId = orderId;
		this.userNo = userNo;
		this.itemCode = itemCode;
		this.itemQuantity = itemQuantity;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemDicount = itemDicount;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}


	public int getItemDicount() {
		return itemDicount;
	}


	public void setItemDicount(int itemDicount) {
		this.itemDicount = itemDicount;
	}


	public int getOrderId() {
		return orderId;
	}




	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public int getItemCode() {
		return itemCode;
	}




	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}




	public int getItemQuantity() {
		return itemQuantity;
	}




	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	
	public void initSaleTotal() {
		this.salePrice = (int)(this.itemPrice*(1-this.itemDicount));
		this.totalPrice = this.salePrice*this.itemQuantity;
	}
	
}
