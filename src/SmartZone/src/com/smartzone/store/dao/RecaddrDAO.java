package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Recaddr;

public interface RecaddrDAO {

	public void save(Recaddr transientInstance);

	public void delete(Recaddr persistentInstance);

	public Recaddr findById(java.lang.Integer id);

	public List findByExample(Recaddr instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public List findByPropertyVisible(String string, String username);

}