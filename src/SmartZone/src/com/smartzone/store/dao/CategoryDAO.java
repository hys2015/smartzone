package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Category;

public interface CategoryDAO {

	public void save(Category transientInstance);

	public void delete(Category persistentInstance);

	public Category findById(java.lang.Integer id);

	public List findByExample(Category instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}