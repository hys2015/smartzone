package com.smartzone.store.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.GoodBiz;
import com.smartzone.store.entity.Cart;
import com.smartzone.store.entity.CartItem;
import com.smartzone.store.entity.Good;

public class CartAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	
	private Integer cartsize;
	private CartItem cartitem;
	private Good good;
	private GoodBiz goodBiz;
	/*json properties*/
	private String status;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	
	public String add(){
		if(good == null || good.getGid() == null){
			status="wrong";
			return SUCCESS;
		}
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		User u = (User) lcd.getObj();
		Cart cart = lcd.getCart();
		if(cart == null){
			cart = new Cart();
		}
		List<CartItem> items= cart.getItems();
		good = goodBiz.findById(good.getGid());
		cartitem.setGood(good);
		
		Integer quantity = cartitem.getQuantity();
		quantity = quantity == null ? quantity: 1;
		if(items.contains(cartitem)){
			CartItem ci = items.get(items.indexOf(cartitem));
			ci.setQuantity(ci.getQuantity() + cartitem.getQuantity());
		}else{
			items.add(cartitem);
		}
		cart.setItems(items);
		lcd.setCart(cart);
		lcd.setInstance(session);
		status = "success";
		cartsize = cart.getItems().size();
		return SUCCESS;
	}
	
	public String show(){
		return SUCCESS;
	}
	
	public String del(){
		if(good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		LoginCheckData lcd  = LoginCheckData.getInstance(session);
		List<CartItem> items = lcd.getCart().getItems();
		CartItem ci = new CartItem(); 
		ci.setGood(good);
		if(items.contains(ci)){
			items.remove(items.indexOf(ci));
		}
		lcd.getCart().setItems(items);
		lcd.setInstance(session);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setGoodBiz(GoodBiz goodBiz) {
		this.goodBiz = goodBiz;
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public CartItem getCartitem() {
		return cartitem;
	}

	public void setCartitem(CartItem cartitem) {
		this.cartitem = cartitem;
	}

	public Integer getCartsize() {
		return cartsize;
	}

	public void setCartsize(Integer cartsize) {
		this.cartsize = cartsize;
	}


}
