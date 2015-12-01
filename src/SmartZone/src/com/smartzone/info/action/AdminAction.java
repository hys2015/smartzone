package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.AdminBiz;
import com.smartzone.info.biz.CommunityBiz;
import com.smartzone.info.biz.CompanyBiz;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.Administor;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class AdminAction extends ActionSupport implements RequestAware,SessionAware {
	Logger log = LoggerFactory.getLogger(AdminAction.class);
	/**
	 * Login
	 * Logout
	 * Register
	 * GetDetail
	 * Update
	 */
	private static final long serialVersionUID = -3897404616246122957L;
	
	private Administor admin; 
	private AdminBiz adminBiz;
	private CommunityBiz commBiz;
	private CompanyBiz companyBiz;
	private UserBiz userBiz;
	private User user;
	private String url;
	private String checkPwd;
	private String newPwd;
	private String adminName;
	
	private Map <String,Object> request;
	private Map<String, Object> session;
	
	public String login(){
		session.remove("message");
		List list = adminBiz.login(admin);
		log.info(admin.getAdminName()+":"+admin.getAdminPwd());
		
		if(list != null && list.size() > 0){
			admin = (Administor)list.get(0);
			LoginCheckData lcd = new LoginCheckData();
			lcd.setType("admin");
			lcd.setObj(admin);
			lcd.setCommNo(admin.getCommunity().getCommunityno());
			session.put("logindata", lcd);
			return SUCCESS;
		}else{
			addFieldError("loginInfo", "账号或密码错误,登录失败");
			return INPUT;
		}
	}

	public String logout() throws Exception {
		if(session.get("logindata")!=null){
			session.remove("logindata");
		}
		return SUCCESS;
	}
	
	public String register(){
		log.info(admin.getAdminName()+":"+admin.getAdminPwd());
		LoginCheckData lcd = (LoginCheckData) session.get("logindata");
		if(lcd == null || "user".equals(lcd.getType())) return LOGIN;
		Administor nowadmin = (Administor) lcd.getObj();
		admin.setCommunity(nowadmin.getCommunity());
		boolean b = adminBiz.addAdmin(admin);
		if(b){
			addActionMessage("管理员添加成功");
			return SUCCESS;
		}else{
			addFieldError("admin.adminName", "用户名已存在");
			return INPUT;
		}
	}
	
	public String detail(){
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(lcd.getObj() instanceof Administor){
			admin = (Administor) lcd.getObj();
		}else{
			admin = null;
		}
		if(admin != null ){
			request.put("detail", admin);
			return SUCCESS;
		}else{
			addActionError("没有找到您需要的结果，请确认您的操作无误");
			return ERROR;
		}
	}
	
	public String update(){
		List list = adminBiz.getDetail(admin);
		Administor check = (Administor)list.get(0);
		if(!check.getAdminPwd().equals(admin.getAdminPwd())){
			addFieldError("admin.adminPwd","旧密码错误");
			return INPUT;
		}else{
			admin.setAdminPwd(newPwd);
			admin.setCommunity(check.getCommunity());
			boolean b = adminBiz.update(admin);
			if(b){
				addActionMessage("修改成功");
				return SUCCESS;
			}else{
				addActionError("修改失败");
				return INPUT;
			}
		}
	}
	
	public String show(){
		List list = commBiz.findAll();
		request.put("communities", list);
		list = adminBiz.getAllAdmin();
		request.put("admins", list);
		list = companyBiz.findAll();
		request.put("companys", list);
		list = userBiz.getAll();
		request.put("users", list);
		return SUCCESS;
	}
	
	public String roleChange(){
		
		if(user == null || user.getUsername() == null){
			return ERROR;
		}
		User u = userBiz.getUserByUsername(user.getUsername());
		if(u == null){
			return ERROR;
		}
		if(u.getIsAdmin()){
			u.setIsAdmin(false);
		}else{
			u.setIsAdmin(true);
		}
		userBiz.save(u);
		return SUCCESS;
	}
	
	public Administor getAdmin() {
		return admin;
	}

	public void setAdmin(Administor admin) {
		this.admin = admin;
	}

	public AdminBiz getAdminBiz() {
		return adminBiz;
	}

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCheckPwd() {
		return checkPwd;
	}

	public void setCheckPwd(String checkPwd) {
		this.checkPwd = checkPwd;
	}

	public Map<String, Object> getRequest() {
		return request;
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

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setCommBiz(CommunityBiz commBiz) {
		this.commBiz = commBiz;
	}

	public CommunityBiz getCommBiz() {
		return commBiz;
	}

	public CompanyBiz getCompanyBiz() {
		return companyBiz;
	}

	public void setCompanyBiz(CompanyBiz companyBiz) {
		this.companyBiz = companyBiz;
	}

	public UserBiz getUserBiz() {
		return userBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
