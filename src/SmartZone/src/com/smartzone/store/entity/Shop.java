package com.smartzone.store.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.smartzone.info.entity.User;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */

public class Shop implements java.io.Serializable {

	// Fields

	private Integer sid;
	private String sname;
	private User user;
	private String addr;
	private String phone;
	private String wechat;
	private String wechat2d;
	private String qq;
	private String represent;
	private Boolean checked;
	private Boolean visible;
	private List imgs = new ArrayList(0);
	private Set<Tag> tags = new HashSet<Tag>(0);

	// Constructors

	/** default constructor */
	public Shop() {
	}
	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
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

	public String getWechat() {
		return this.wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getWechat2d() {
		return this.wechat2d;
	}

	public void setWechat2d(String wechat2d) {
		this.wechat2d = wechat2d;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getRepresent() {
		return this.represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}

	public Boolean getChecked() {
		return this.checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List getImgs() {
		return imgs;
	}

	public void setImgs(List imgs) {
		this.imgs = imgs;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	public Boolean getVisible() {
		return visible;
	}

	public void setVisible(Boolean visible) {
		this.visible = visible;
	}


}