package com.kh.market.model.vo;

import java.sql.Date;

public class Order {

	private String orderNo;
	private String name;
	private Date shippingDate;
	private String postNum;
	private String address;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String orderNo, String name, Date shippingDate, String postNum, String address) {
		super();
		this.orderNo = orderNo;
		this.name = name;
		this.shippingDate = shippingDate;
		this.postNum = postNum;
		this.address = address;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", name=" + name + ", shippingDate=" + shippingDate + ", postNum="
				+ postNum + ", address=" + address + "]";
	}
	
	
	
}