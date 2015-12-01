package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Condobill;

public interface CondobillDAO {

	public void save(Condobill transientInstance);

	public void delete(Condobill persistentInstance);

	public Condobill findById(java.lang.Integer id);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}