package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Series;

public interface SeriesBiz {

	public List findAll();

	public List findAll(int commNo);

	public Series findById(Integer seriesId);

	public void update(Series s);

	public void add(Series series);

	public void delete(Series series);

	public Series findByName(String seriesName);

}