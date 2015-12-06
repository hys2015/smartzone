package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Bill;

public interface BillDAO {

	public int save(Bill transientInstance);

	public void delete(Bill persistentInstance);

	public Bill findById(java.lang.Integer id);

	public List findByExample(Bill instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}