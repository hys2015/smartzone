package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.CommunityBiz;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.Community;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class UserAction extends ActionSupport implements RequestAware,SessionAware{

	/**
	 * login
	 * logout
	 */
	
	User user;
	UserBiz userBiz;
	CommunityBiz commBiz;
	String newPwd;
	String checkPwd;
	
	Map<String, Object> session;
	Map<String, Object> request;
	
	
	
	public String login(){
		session.remove("message");
		System.out.println("user:"+user.getUsername()+":"+user.getUserpwd());
		List list = userBiz.login(user);
		if(list != null && list.size() > 0){
			user = (User) list.get(0);
			LoginCheckData lcd = new LoginCheckData();
			lcd.setType("user");
			lcd.setObj(user);
			lcd.setCommNo(user.getCommunity().getCommunityno());
			session.put("logindata", lcd);
			return SUCCESS;
		}else{
			addActionError("用户名或密码错误");
			return INPUT;
		}
	}

	public String logout(){
		session.remove("logindata");
		return SUCCESS;
	}
	
	public String detail(){
		if( user == null ){
			LoginCheckData lcd = LoginCheckData.getInstance(session);
			if(lcd == null || "admin".equals(lcd.getType()) ) return ERROR;
			user = (User) lcd.getObj();
		}else{
			if(user.getUsername() == null) return ERROR;
			user = userBiz.getUserByUsername(user.getUsername());
		}
		request.put("user", user);
		return SUCCESS;
	}
	
	public String toUpdate(){
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(lcd != null){
			user = (User) lcd.getObj();
			request.put("user", user);
			
			List list = commBiz.findAll();
			request.put("communities", list);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String update(){
		if(user == null || user.getUsername() == null ) return ERROR;
		User u = userBiz.getUserByUsername(user.getUsername());
		if( u == null) return ERROR;
		if(user.getUserpwd() != null && !"".equals(user.getUserpwd().trim()) ){
			if(newPwd == null){
				addFieldError("newPwd", "新密码不能为空");
				if(checkPwd == null){
					addFieldError("checkPwd", "确认密码不能为空");
					return INPUT;
				}
				return INPUT;
			}
			if(!user.getUserpwd().equals(u.getUserpwd())){
				addFieldError("user.userpwd", "原密码错误");
				return INPUT;
			}
			if(!checkPwd.equals(newPwd)){
				addFieldError("checkPwd", "新密码和确认密码必须相同");
				return INPUT;
			}
			if(checkPwd.length() < 4){
				addFieldError("checkPwd", "密码长度必须在4位以上");
				return INPUT;
			}
			u.setUserpwd(checkPwd);
		}
		Community comm = user.getCommunity();
		if( comm == null){
			addFieldError("user.community.communityno", "请选择所属小区");
			return INPUT;
		}
		comm = commBiz.findByCommunityNo(comm.getCommunityno());
		u.setCommunity(comm);
		u.setUseraddr(user.getUseraddr());
		u.setUserphone(user.getUserphone());
		userBiz.save(u);
		
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		lcd.setObj(u);
		lcd.setCommNo(u.getCommunity().getCommunityno());
		lcd.setInstance(session);
		
		return SUCCESS;
	}
	
	public String toRegister(){
		List list = commBiz.findAll();
		request.put("communities", list);
		return SUCCESS;
	}
	
	public String register(){
		if(user == null || user.getCommunity().getCommunityno() == null){
			System.out.println("user register user == null || user.cid == null");
			return ERROR;
		}
		Community comm = commBiz.findByCommunityNo(user.getCommunity().getCommunityno());
		user.setCommunity(comm);
		userBiz.register(user);
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getCheckPwd() {
		return checkPwd;
	}

	public void setCheckPwd(String checkPwd) {
		this.checkPwd = checkPwd;
	}

	public void setCommBiz(CommunityBiz commBiz) {
		this.commBiz = commBiz;
	}
}
