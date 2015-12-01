package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.User;

public interface CarPortDAO {

	public void save(CarPort transientInstance);

	public void delete(CarPort persistentInstance);

	public CarPort findById(java.lang.Integer id);

	public List findByExample(CarPort instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public List findNoOwnerPorts(int commNo);

	public void update(CarPort c);

}