package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Good;

public interface GoodBiz {

	public List findAll();

	public List findByShopId(Integer sid);

	public void save(Good good);

	public Good findById(Integer gid);

	public void delete(Good good);

	public List findByCategory(Integer cid);

	public void add(Good good);

	public List findVisibleByShopId(Integer sid);

	public void onShelf(Good good);

	public void awayShelf(Good good);

	public List findLast10onShelf(Integer communityno);

	public List findVisibleByCategory(Integer cid);

}