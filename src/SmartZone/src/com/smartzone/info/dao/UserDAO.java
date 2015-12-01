package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.User;

public interface UserDAO {

	public void save(User transientInstance);

	public void delete(User persistentInstance);

	public User findById(java.lang.String id);

	public List findByExample(User instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}