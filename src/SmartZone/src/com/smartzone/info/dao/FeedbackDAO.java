package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Feedback;

public interface FeedbackDAO {

	public void save(Feedback transientInstance);

	public void delete(Feedback persistentInstance);

	public Feedback findById(java.lang.Integer id);

	public List findByExample(Feedback instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public Feedback merge(Feedback detachedInstance);

	public int getCountofFeedbackOnProperty(String propertyname, String value);

	public List getPagerCommunityFeedbackOnProperty(int curPage, int size, String properName,String value);

}