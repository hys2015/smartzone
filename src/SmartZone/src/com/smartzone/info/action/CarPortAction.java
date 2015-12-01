package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.CarPortBiz;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Community;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class CarPortAction extends ActionSupport implements RequestAware,
		SessionAware {
	private CarPort carport;
	private CarPortBiz carportBiz;
	
	Map<String,Object> request;
	Map<String,Object> session;
	
	public String show(){
		int commNo = LoginCheckData.getInstance(session).getCommNo();
		List list = carportBiz.findAll(commNo);
		request.put("carports", list);
		return SUCCESS;
	}
	
	public String add(){
		if(carport == null 
				|| carport.getCarportId() == null
				|| carport.getFee() == null){
			return ERROR;
		}
		if(carportBiz.findById(carport.getCarportId()) != null){
			session.put("message", "此编号已存在");
			return INPUT;
		}
		Community community = ((User)LoginCheckData.getInstance(session).getObj()).getCommunity();
		carport.setCommunity(community);
		carportBiz.add(carport);
		return SUCCESS;
	}
	
	public String update(){
		if(carport == null || carport.getCarportId() == null){
			return ERROR;
		}
		CarPort c = carportBiz.findById(carport.getCarportId());
		c.setFee(carport.getFee());
		carportBiz.update(c);
		return SUCCESS;
	}
	
	public String delete(){
		if(carport == null || carport.getCarportId() == null){
			return ERROR;
		}
		carportBiz.delete(carport);
		return SUCCESS;
	}
	
	public String toBindPort(){
		User user = (User) LoginCheckData.getInstance(session).getObj();
		List list = carportBiz.findNoOwnerPorts(user.getCommunity().getCommunityno());
		request.put("carports", list);
		return SUCCESS;
	}
	
	public String toUnbindPort(){
		User user = (User) LoginCheckData.getInstance(session).getObj();
		List list = carportBiz.findUserPorts(user);
		request.put("carports", list);
		return SUCCESS;
	}
	
	public String bindOrUnbind(){
		if(carport == null || carport.getCarportId() == null){
			return ERROR;
		}
		CarPort c = carportBiz.findById(carport.getCarportId());
		User user = (User) LoginCheckData.getInstance(session).getObj();
		if(c.getUser() == null){
			c.setUser(user);
			session.put("message", "绑定成功");
		}else{
			c.setUser(null);
			session.put("message", "解绑成功");
		}
		carportBiz.update(c);
		return SUCCESS;
	}
	
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public CarPortBiz getCarportBiz() {
		return carportBiz;
	}

	public void setCarportBiz(CarPortBiz carportBiz) {
		this.carportBiz = carportBiz;
	}

	public CarPort getCarport() {
		return carport;
	}

	public void setCarport(CarPort carport) {
		this.carport = carport;
	}
}
