package com.smartzone.bbs.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.smartzone.bbs.entity.Reply;

public interface ReplyDAO {

	public void setSessionFactory(SessionFactory sessionFactory);

	public void save(Reply transientInstance);

	public void delete(Reply persistentInstance);

	public Reply findById(java.lang.Integer id);

	public List findByExample(Reply instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public Reply merge(Reply detachedInstance);

	public void attachDirty(Reply instance);

	public void attachClean(Reply instance);
	
	public int getCountOnProperty(String propertyname, String value);
	
	public List getPageredRepliesOnProperty(int curPage, int size, String propertyName ,String value);

	public List getReplyStar();
}