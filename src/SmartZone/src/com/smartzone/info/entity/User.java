package com.smartzone.info.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	public static final String DEFAULT_IMG = "/SmartZone/upload/img/1.jpg";
	private String username;
	private Community community;
	private String userpwd;
	private String useraddr;
	private String userphone;
	private Boolean isAdmin;
	private String img;
	private Set condofees = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, Boolean isAdmin) {
		this.username = username;
		this.isAdmin = isAdmin;
	}

	/** full constructor */
	public User(String username, Community community, String userpwd,
			String useraddr, String userphone, Boolean isAdmin, String img,
			Set condofees) {
		this.username = username;
		this.community = community;
		this.userpwd = userpwd;
		this.useraddr = useraddr;
		this.userphone = userphone;
		this.isAdmin = isAdmin;
		this.img = img;
		this.condofees = condofees;
	}

	// Property accessors

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Community getCommunity() {
		return this.community;
	}

	public void setCommunity(Community community) {
		this.community = community;
	}

	public String getUserpwd() {
		return this.userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUseraddr() {
		return this.useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}

	public String getUserphone() {
		return this.userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public Boolean getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Set getCondofees() {
		return this.condofees;
	}

	public void setCondofees(Set condofees) {
		this.condofees = condofees;
	}

}