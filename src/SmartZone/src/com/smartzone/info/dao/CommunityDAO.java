package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Community;

public interface CommunityDAO {

	public void save(Community transientInstance);

	public void delete(Community persistentInstance);

	public List findByExample(Community instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}