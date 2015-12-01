package com.smartzone.info.entity;

import java.util.Map;

import com.smartzone.store.entity.Cart;

public class LoginCheckData {
	
	private String type;
	private Object obj;
	private int commNo;
	private Cart cart;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	public int getCommNo() {
		return commNo;
	}
	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}
	public static LoginCheckData getInstance(Map<String, Object> session) {
		return (LoginCheckData)session.get("logindata");
	}
	public void setInstance(Map<String, Object> session) {
		session.put("logindata", this);
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
