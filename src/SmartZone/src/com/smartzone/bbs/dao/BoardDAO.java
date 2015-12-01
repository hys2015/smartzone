package com.smartzone.bbs.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.smartzone.bbs.entity.Board;
import com.smartzone.bbs.entity.Board;

public interface BoardDAO {

	public void setSessionFactory(SessionFactory sessionFactory);

	public void save(Board transientInstance);

	public void delete(Board persistentInstance);

	public Board findById(java.lang.Integer id);

	public List findByExample(Board instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public Board merge(Board detachedInstance);

	public void attachDirty(Board instance);

	public void attachClean(Board instance);

}