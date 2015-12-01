package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.ReplyToFeed;

public interface ReplyDAO {

	public void save(ReplyToFeed transientInstance);

	public void delete(ReplyToFeed persistentInstance);

	public List findByExample(ReplyToFeed instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public ReplyToFeed merge(ReplyToFeed detachedInstance);

}