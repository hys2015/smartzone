package com.smartzone.store.entity;

import java.util.ArrayList;
import java.util.List;

import com.smartzone.info.entity.User;

public class Cart{
	
	private List<CartItem> items = new ArrayList<CartItem>(0);

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public void clear() {
		this.items.clear();
	}
}
