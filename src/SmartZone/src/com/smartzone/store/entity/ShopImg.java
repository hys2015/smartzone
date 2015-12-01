package com.smartzone.store.entity;

/**
 * ShopImg entity. @author MyEclipse Persistence Tools
 */

public class ShopImg implements java.io.Serializable {

	// Fields

	private Integer siid;
	private Integer sid;
	private String imgUrl;
	private Integer idx;
	private String brief;

	// Constructors

	/** default constructor */
	public ShopImg() {
	}

	/** full constructor */
	public ShopImg(Integer sid, String imgUrl, Integer idx, String brief) {
		this.sid = sid;
		this.imgUrl = imgUrl;
		this.idx = idx;
		this.brief = brief;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getImgUrl() {
		return this.imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getIdx() {
		return this.idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	public Integer getSiid() {
		return siid;
	}

	public void setSiid(Integer siid) {
		this.siid = siid;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}


}