package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.User;

public interface CarbillDAO {

	public void save(Carbill transientInstance);

	public void delete(Carbill persistentInstance);

	public Carbill findById(java.lang.Integer id);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public List findByCarportAndUser(int id, String username);

	public List getUserUnpayedOrPayedBill(String username, int payed);

}