package com.smartzone.bbs.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import com.smartzone.bbs.entity.Post;

public interface PostDAO {

	public void setSessionFactory(SessionFactory sessionFactory);

	public int save(Post transientInstance);

	public void delete(Post persistentInstance);

	public Post findById(java.lang.Integer id);

	public List findByExample(Post instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public Post merge(Post detachedInstance);

	public void attachDirty(Post instance);

	public void attachClean(Post instance);
	
	public int getCountOf(Post instance);
	
	public int getCountOnProperty(String propertyname, String value) ;
	
	public List getPageredPostOnProperty(int curPage, int size, String propertyName ,String value);

	public List getHotPost(int bid);

	public List findLastPost(String propertyName,Object value,int num);
	
	
}