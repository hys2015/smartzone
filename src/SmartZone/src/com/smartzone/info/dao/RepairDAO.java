package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Repair;

public interface RepairDAO {

	public void save(Repair transientInstance);

	public void delete(Repair persistentInstance);

	public Repair findById(java.lang.Integer id);

	public List findByProperty(String propertyName, Object value);

	public List findPageRepair(int page, int size, String username);

	public List findPageRepair(int page, int size);

	public int getCountofUserRepair(String username);

	public int getCountofRepair();
	
	public int getCountofRepairOnProperty(String propertyName, String value);

}