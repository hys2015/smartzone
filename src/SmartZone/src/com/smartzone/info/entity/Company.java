package com.smartzone.info.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */

public class Company implements java.io.Serializable {

	// Fields

	private Integer cno;
	private String cname;
	private String caddr;
	private String cphone;
	private String cemail;
	private Set communities = new HashSet(0);

	// Constructors

	/** default constructor */
	public Company() {
	}

	/** full constructor */
	public Company(String cname, String caddr, String cphone, String cemail,
			Set communities) {
		this.cname = cname;
		this.caddr = caddr;
		this.cphone = cphone;
		this.cemail = cemail;
		this.communities = communities;
	}

	// Property accessors

	public Integer getCno() {
		return this.cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCaddr() {
		return this.caddr;
	}

	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}

	public String getCphone() {
		return this.cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getCemail() {
		return this.cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	public Set getCommunities() {
		return this.communities;
	}

	public void setCommunities(Set communities) {
		this.communities = communities;
	}

}