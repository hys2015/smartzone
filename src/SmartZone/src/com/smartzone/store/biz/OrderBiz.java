package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.info.entity.User;
import com.smartzone.store.entity.Order;

public interface OrderBiz {

	public List findAll();

	public Integer add(Order order);

	public List findByUser(User u);

	public Order findById(Integer oid);

	public void setUnvisible(Order findById);

	public void payed(Order order);

}