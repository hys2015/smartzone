package com.smartzone.store.entity;


/**
 * Item entity. @author MyEclipse Persistence Tools
 * OrderItem
 */

public class Item implements java.io.Serializable {

	// Fields

	private Integer iid;
	private Good good;
	private Integer quantity;
	private Order order;
	private String comment;
	
	// Constructors

	/** default constructor */
	public Item() {
	}


	// Property accessors

	public Integer getIid() {
		return this.iid;
	}

	public void setIid(Integer iid) {
		this.iid = iid;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}


	public Good getGood() {
		return good;
	}


	public void setGood(Good good) {
		this.good = good;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}

}