package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Order;

public interface OrderDAO {

	public Integer save(Order transientInstance);

	public void delete(Order persistentInstance);

	public Order findById(java.lang.Integer id);

	public List findByExample(Order instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}