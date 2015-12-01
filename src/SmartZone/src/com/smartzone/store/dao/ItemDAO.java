package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Item;

public interface ItemDAO {

	public void save(Item transientInstance);

	public void delete(Item persistentInstance);

	public Item findById(java.lang.Integer id);

	public List findByExample(Item instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}