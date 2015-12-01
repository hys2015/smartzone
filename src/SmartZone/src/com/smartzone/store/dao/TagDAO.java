package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Tag;

public interface TagDAO {

	public void save(Tag transientInstance);

	public void delete(Tag persistentInstance);

	public Tag findById(java.lang.Integer id);

	public List findByExample(Tag instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}