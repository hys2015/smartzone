package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Administor;

public interface AdminDAO {
	List getAllAdmin();
	void save(Administor admin);
	void delete(Administor admin);
	List search(Administor admin);
	List findByProperty(String propertyName, Object value);
}
