package com.smartzone.info.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Condobill entity. @author MyEclipse Persistence Tools
 */

public class Condobill implements java.io.Serializable {

	// Fields

	private Integer bid;
	private User user;
	private Date begintime;
	private Date endtime;
	private Timestamp createtime;
	private Boolean ispayed;
	private Double price;

	// Constructors

	/** default constructor */
	public Condobill() {
	}

	/** minimal constructor */
	public Condobill(Timestamp createtime) {
		this.createtime = createtime;
	}

	// Property accessors

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}


	public Date getBegintime() {
		return this.begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	public Date getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Boolean getIspayed() {
		return this.ispayed;
	}

	public void setIspayed(Boolean ispayed) {
		this.ispayed = ispayed;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}