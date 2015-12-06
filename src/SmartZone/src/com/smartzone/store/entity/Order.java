package com.smartzone.store.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	public static final Short STATE_UNPAYED = 0;
	public static final Short STATE_PAYED = 1;
	public static final Short STATE_DEAL = 2;
	private Integer oid;
	private Timestamp createtime;
	private String username;
	private String comment;
	private Short state;
	private Timestamp updatetime;
	private Timestamp paytime;
	private Recaddr recaddr;
	private Double price;
	private Boolean visible;
	private String trxId;
	private Set items = new HashSet(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Timestamp createtime, Timestamp updatetime) {
		this.createtime = createtime;
		this.updatetime = updatetime;
	}

	/** full constructor */
	public Order(Timestamp createtime, String username, String comment,
			Short state, Timestamp updatetime, Timestamp paytime, Set items) {
		this.createtime = createtime;
		this.username = username;
		this.comment = comment;
		this.state = state;
		this.updatetime = updatetime;
		this.paytime = paytime;
		this.items = items;
	}

	// Property accessors

	public Integer getOid() {
		return this.oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Short getState() {
		return this.state;
	}

	public void setState(Short state) {
		this.state = state;
	}

	public Timestamp getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(Timestamp updatetime) {
		this.updatetime = updatetime;
	}

	public Timestamp getPaytime() {
		return this.paytime;
	}

	public void setPaytime(Timestamp paytime) {
		this.paytime = paytime;
	}

	public Set getItems() {
		return this.items;
	}

	public void setItems(Set items) {
		this.items = items;
	}

	public Recaddr getRecaddr() {
		return recaddr;
	}

	public void setRecaddr(Recaddr recaddr) {
		this.recaddr = recaddr;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	public String getTrxId() {
		return trxId;
	}

	public void setTrxId(String trxId) {
		this.trxId = trxId;
	}

}