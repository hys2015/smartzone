package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Comment;

public interface CommentDAO {

	public void save(Comment transientInstance);

	public void delete(Comment persistentInstance);

	public Comment findById(java.lang.Integer id);

	public List findByExample(Comment instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

}