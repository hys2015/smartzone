package com.smartzone.store.entity;

import java.sql.Timestamp;

import com.smartzone.info.entity.User;

/**
 * Recaddr entity. @author MyEclipse Persistence Tools
 */

public class Recaddr implements java.io.Serializable {

	// Fields

	private Integer rid;
	private User user;
	private String addr;
	private String phone;
	private String name;
	private Boolean visible;
	private Timestamp lastusetime;

	// Constructors

	/** default constructor */
	public Recaddr() {
	}


	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}


	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Boolean getVisible() {
		return visible;
	}


	public void setVisible(Boolean visible) {
		this.visible = visible;
	}


	public Timestamp getLastusetime() {
		return lastusetime;
	}


	public void setLastusetime(Timestamp lastusetime) {
		this.lastusetime = lastusetime;
	}

}