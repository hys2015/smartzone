package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.CondobillBiz;
import com.smartzone.info.biz.CondofeeBiz;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.Condofee;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class CondofeeAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private Condofee condofee;
	private Condobill condobill;
	
	private UserBiz userBiz;
	private CondobillBiz condobillBiz;
	private CondofeeBiz condofeeBiz;
	private Map<String,Object> request;
	private Map<String,Object> session;
	
	public String adminShow(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		if(!u.getIsAdmin()){
			return ERROR;
		}
		List list = userBiz.getAllinMyCommunity(u);
		request.put("users", list);
		list = condobillBiz.findCommunityCondoBill(u.getCommunity().getCommunityno());
		request.put("fees",list);
		return SUCCESS;
	}
	
	public String saveFee(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		if(!u.getIsAdmin()){
			return ERROR;
		}
		condobill.setUser(u);
		condobill.setIspayed(false);
		condobillBiz.saveOrUpdate(condobill);
		return SUCCESS;
	}
	
	public String pay(){
		Condobill bill = condobillBiz.findById(condobill.getBid());
		if(bill == null){
			return ERROR;
		}
		bill.setIspayed(true);
		condobillBiz.saveOrUpdate(bill);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public CondofeeBiz getCondofeeBiz() {
		return condofeeBiz;
	}
	public void setCondofeeBiz(CondofeeBiz condofeeBiz) {
		this.condofeeBiz = condofeeBiz;
	}
	public CondobillBiz getCondobillBiz() {
		return condobillBiz;
	}
	public void setCondobillBiz(CondobillBiz condobillBiz) {
		this.condobillBiz = condobillBiz;
	}
	public Condofee getCondofee() {
		return condofee;
	}
	public void setCondofee(Condofee condofee) {
		this.condofee = condofee;
	}
	public UserBiz getUserBiz() {
		return userBiz;
	}
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public Condobill getCondobill() {
		return condobill;
	}

	public void setCondobill(Condobill condobill) {
		this.condobill = condobill;
	}
}
