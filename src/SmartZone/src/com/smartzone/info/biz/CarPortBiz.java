package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.User;

public interface CarPortBiz {

	public List findAll(int commNo);

	public void add(CarPort carport);

	public CarPort findById(Integer carportId);

	public void save(CarPort c);

	public List findUserPorts(User user);

	public List findNoOwnerPorts(Integer communityno);

	public void delete(CarPort carport);

	public void update(CarPort c);

}