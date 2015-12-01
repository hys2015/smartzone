package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Series;

public interface SeriesDAO {
	public List findAll();

	public List findAll(int commNo);

	public Series findById(Integer seriesId);

	public void saveOrUpdate(Series s);

	public void delete(Series s);
	
	public List findByProperty(String s, Object v);
}
