package com.smartzone.store.entity;

import java.sql.Timestamp;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private Integer cid;
	private String content;
	private String username;
	private Integer gid;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(String content, String username, Integer gid,
			Timestamp createtime) {
		this.content = content;
		this.username = username;
		this.gid = gid;
		this.createtime = createtime;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}