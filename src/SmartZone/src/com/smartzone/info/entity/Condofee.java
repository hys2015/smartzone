package com.smartzone.info.entity;

/**
 * Condofee entity. @author MyEclipse Persistence Tools
 */

public class Condofee implements java.io.Serializable {

	// Fields

	private String username;
	private User user;
	private Double fee;

	// Constructors

	/** default constructor */
	public Condofee() {
	}

	/** minimal constructor */
	public Condofee(String username, User user) {
		this.username = username;
		this.user = user;
	}

	/** full constructor */
	public Condofee(String username, User user, Double fee) {
		this.username = username;
		this.user = user;
		this.fee = fee;
	}

	// Property accessors

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getFee() {
		return this.fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

}