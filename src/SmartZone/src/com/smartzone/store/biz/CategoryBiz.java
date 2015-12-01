package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Category;

public interface CategoryBiz {

	public List findAll();

	public Category findById(Integer cid);

	public List findByShopId(Integer sid);

	public void add(Category category);

	public void delete(Category category);

}