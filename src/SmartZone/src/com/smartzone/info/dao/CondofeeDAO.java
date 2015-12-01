package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Condofee;

public interface CondofeeDAO {

	public void save(Condofee transientInstance);

	public void delete(Condofee persistentInstance);

	public Condofee findById(java.lang.String id);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}