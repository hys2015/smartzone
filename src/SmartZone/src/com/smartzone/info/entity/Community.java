package com.smartzone.info.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Community entity. @author MyEclipse Persistence Tools
 */

public class Community implements java.io.Serializable {

	// Fields

	private Integer communityno;
	private Company company;
	private String communityname;
	private String communityaddr;
	private Set users = new HashSet(0);

	// Constructors

	/** default constructor */
	public Community() {
	}

	/** full constructor */
	public Community(Company company, String communityname,
			String communityaddr, Set users) {
		this.company = company;
		this.communityname = communityname;
		this.communityaddr = communityaddr;
		this.users = users;
	}

	// Property accessors

	public Integer getCommunityno() {
		return this.communityno;
	}

	public void setCommunityno(Integer communityno) {
		this.communityno = communityno;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getCommunityname() {
		return this.communityname;
	}

	public void setCommunityname(String communityname) {
		this.communityname = communityname;
	}

	public String getCommunityaddr() {
		return this.communityaddr;
	}

	public void setCommunityaddr(String communityaddr) {
		this.communityaddr = communityaddr;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}