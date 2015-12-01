package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Tag;

public interface TagBiz {

	public Tag findById(int id);

	public List findByTitle(String title);

	public List findAll();

}