package com.smartzone.store.entity;

public class CartItem {
	private Good good;
	private int quantity;
	
	public CartItem(){
		super();
	}
	public CartItem(Good good, int quantity) {
		super();
		this.good = good;
		this.quantity = quantity;
	}
	
	public Good getGood() {
		return good;
	}
	public void setGood(Good good) {
		this.good = good;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public int hashCode() {
		return good.getGid();
	}
	@Override
	public boolean equals(Object obj) {
		if(obj != null){
			if(obj instanceof Good){
				Good g = (Good)obj;
				return this.good.equals(g);
			}
			if(obj instanceof CartItem){
				CartItem ci = (CartItem)obj;
				return this.good.equals(ci.getGood());
			}
		}
		return false;
	}
}
