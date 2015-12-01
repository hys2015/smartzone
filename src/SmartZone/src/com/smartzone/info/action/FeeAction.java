package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.CarPortBiz;
import com.smartzone.info.biz.CondobillBiz;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class FeeAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private CarPortBiz carportBiz;
	private CondobillBiz condobillBiz;
	private Carbill carbill;
	private Condobill condobill;
	
	Map<String,Object> request;
	Map<String,Object> session;
	
	public String fee(){
		User user = (User) LoginCheckData.getInstance(session).getObj();
		List list = carportBiz.findUserPorts(user);
		request.put("mycarports", list);
		list = condobillBiz.findUserCondoBill(user);
		request.put("condobills", list);
		return SUCCESS;
	}
	
	public String toPay(){
		return SUCCESS;
	}
	
	
	public CarPortBiz getCarportBiz() {
		return carportBiz;
	}
	public void setCarportBiz(CarPortBiz carportBiz) {
		this.carportBiz = carportBiz;
	}
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public CondobillBiz getCondobillBiz() {
		return condobillBiz;
	}
	public void setCondobillBiz(CondobillBiz condobillBiz) {
		this.condobillBiz = condobillBiz;
	}

	public Carbill getCarbill() {
		return carbill;
	}

	public void setCarbill(Carbill carbill) {
		this.carbill = carbill;
	}

	public Condobill getCondobill() {
		return condobill;
	}

	public void setCondobill(Condobill condobill) {
		this.condobill = condobill;
	}
}
