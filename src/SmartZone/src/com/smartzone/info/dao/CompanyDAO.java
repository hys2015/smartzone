package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Company;

public interface CompanyDAO {

	public void save(Company transientInstance);

	public void delete(Company persistentInstance);

	public List findByExample(Company instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}