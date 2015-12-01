package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Shop;

public interface ShopDAO {

	public void save(Shop transientInstance);

	public void delete(Shop persistentInstance);

	public Shop findById(java.lang.Integer id);

	public List findByExample(Shop instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public List findVisibleByProperty(String string, int commNo);

}