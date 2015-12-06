package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.dao.UserDAO;
import com.smartzone.info.entity.User;

public class UserBizImp implements UserBiz {

	private UserDAO userDAO;
	@Override
	public List login(User user) {
		List list = userDAO.findByProperty("username", user.getUsername());
		if(list == null || list.size()==0) return null;
		User check = (User) list.get(0);
		if(check != null && user.getUserpwd().equals(check.getUserpwd())){
			return list;
		}else{
			return null;
		}
	}
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	@Override
	public List getAll() {
		return userDAO.findAll();
	}
	@Override
	public User getUserByUsername(String username) {
		List list = userDAO.findByProperty("username", username);
		if( list != null && list.size() > 0 ){
			return (User) list.get(0);
		}
		return null;
	}
	@Override
	public void save(User u) {
		userDAO.save(u);
	}
	@Override
	public List getAllinMyCommunity(User u) {
		return userDAO.findByProperty("community.communityno", u.getCommunity().getCommunityno());
	}
	@Override
	public void register(User user) {
		user.setIsAdmin(false);
		user.setImg(User.DEFAULT_IMG);
		save(user);
	}	
}
