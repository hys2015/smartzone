package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.info.entity.User;
import com.smartzone.store.entity.Shop;

public interface ShopBiz {

	public List findAll();

	public List findByCommNo(int commNo);

	public void save(Shop shop);

	public List findUserShops(User u);

	public Shop findById(Shop shop);

	public List searchBySname(Shop shop);

	public List findVisibleByCommNo(int commNo);

	public void open(Shop shop);
	public void close(Shop shop);

	public void add(Shop shop);

}