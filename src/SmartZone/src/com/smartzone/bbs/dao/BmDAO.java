package com.smartzone.bbs.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.smartzone.bbs.entity.Bm;

public interface BmDAO {

	public void setSessionFactory(SessionFactory sessionFactory);

	public void save(Bm transientInstance);

	public void delete(Bm persistentInstance);

	public Bm findById(java.lang.Integer id);

	public List findByExample(Bm instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public Bm merge(Bm detachedInstance);

	public void attachDirty(Bm instance);

	public void attachClean(Bm instance);

}