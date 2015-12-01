package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.User;

public interface UserBiz {
	public List login(User user);

	public List getAll();

	public User getUserByUsername(String username);

	public void save(User u);

	public List getAllinMyCommunity(User u);
}
