package com.smartzone.store.entity;

/**
 * GoodImg entity. @author MyEclipse Persistence Tools
 */

public class GoodImg implements java.io.Serializable {

	// Fields

	private Integer giid;
	private Integer gid;
	private String imgUrl;
	private Integer idx;

	// Constructors

	/** default constructor */
	public GoodImg() {
	}

	/** minimal constructor */
	public GoodImg(Integer idx) {
		this.idx = idx;
	}

	/** full constructor */
	public GoodImg(Integer gid, String imgUrl, Integer idx) {
		this.gid = gid;
		this.imgUrl = imgUrl;
		this.idx = idx;
	}

	// Property accessors

	public Integer getGiid() {
		return this.giid;
	}

	public void setGiid(Integer giid) {
		this.giid = giid;
	}

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
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

}