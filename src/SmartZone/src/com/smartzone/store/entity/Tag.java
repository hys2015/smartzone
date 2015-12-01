package com.smartzone.store.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Tag entity. @author MyEclipse Persistence Tools
 */

public class Tag implements java.io.Serializable {

	// Fields

	private Integer tid;
	private String title;
	private Set<Shop> shops = new HashSet<Shop>(0);

	// Constructors

	/** default constructor */
	public Tag() {
	}

	/** full constructor */
	public Tag(String title) {
		this.title = title;
	}

	// Property accessors

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Set<Shop> getShops() {
		return shops;
	}

	public void setShops(Set<Shop> shops) {
		this.shops = shops;
	}

	@Override
	public boolean equals(Object obj) {
		if(null != obj && obj instanceof Tag){
			Tag t = (Tag) obj;
			if(t.getTitle() == null || getTitle() == null){
				return false;
			}else if(getTitle().equals(t.getTitle())){
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() {
		return getTitle().hashCode();
	}
}