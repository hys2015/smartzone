package com.smartzone.store.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer cid;
	private Shop shop;
	private String cname;
	private Set goods = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}


	public Set getGoods() {
		return this.goods;
	}

	public void setGoods(Set goods) {
		this.goods = goods;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

}