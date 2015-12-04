package com.smartzone.store.dao;

import java.util.List;

import com.smartzone.store.entity.Good;

public interface GoodDAO {

	public void save(Good transientInstance);

	public void delete(Good persistentInstance);

	public Good findById(java.lang.Integer id);

	public List findByExample(Good instance);

	public List findByProperty(String propertyName, Object value);

	public List findAll();

	public List findVisibleByProperty(String string, Integer sid);

	public List findLastOnShelf(String propertyName, Integer communityno, int num);

	public List findRecommandedGoods(Good good, int num);

}