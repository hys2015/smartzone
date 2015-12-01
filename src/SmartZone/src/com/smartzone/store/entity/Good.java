package com.smartzone.store.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Good entity. @author MyEclipse Persistence Tools
 */

public class Good implements java.io.Serializable {

	// Fields

	public static final Boolean UN_VISIBLE = false;
	public static final Boolean VISIBLE = true;
	
	private Integer gid;
	private Category category;
	private String gname;
	private String detail;
	private Double price;
	private Double nowprice;
	private Integer quantity;
	private Boolean visible;
	private Timestamp onshelftime;
	private List<GoodImg> imgs = new ArrayList<GoodImg>(0);

	// Constructors

	/** default constructor */
	public Good() {
	}

	/** full constructor */
	public Good(Category category, String gname, String detail, Double price,
			Double nowprice, Integer quantity) {
		this.category = category;
		this.gname = gname;
		this.detail = detail;
		this.price = price;
		this.nowprice = nowprice;
		this.quantity = quantity;
	}

	// Property accessors

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getGname() {
		return this.gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getNowprice() {
		return this.nowprice;
	}

	public void setNowprice(Double nowprice) {
		this.nowprice = nowprice;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public List<GoodImg> getImgs() {
		return imgs;
	}

	public void setImgs(List<GoodImg> imgs) {
		this.imgs = imgs;
	}

	@Override
	public int hashCode() {
		return gid;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj != null){
			if(obj instanceof Good){
				Good g = (Good)obj;
				return this.gid == g.getGid();
			}
		}
		return false;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public Timestamp getOnshelftime() {
		return onshelftime;
	}

	public void setOnshelftime(Timestamp onshelftime) {
		this.onshelftime = onshelftime;
	}

}