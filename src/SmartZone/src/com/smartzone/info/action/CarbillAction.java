package com.smartzone.info.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.CarPortBiz;
import com.smartzone.info.biz.CarbillBiz;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class CarbillAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private Integer needFee; //是否需要缴费
	private CarPort carport;
	private Carbill carbill;
	private Integer period;
	
	private CarPortBiz carportBiz;
	private CarbillBiz carbillBiz;
	private Map<String, Object> request;
	private Map<String, Object> session ;
	
	public String tobill(){
		if(carport == null || carport.getCarportId() == null){
			return ERROR;
		}
		User u = (User) LoginCheckData.getInstance(session).getObj();
		carport = carportBiz.findById(carport.getCarportId());
		Carbill cb = carbillBiz.findByCarportAndUser(carport, u);
		if(cb == null || cb.getEndtime().before(new Date()) ){
			needFee = 1;
		}else{
			needFee = 0;
		}
		request.put("bill", cb);
		return SUCCESS;
	}
	
	public String addcarbill(){
		
		carport = carportBiz.findById(carport.getCarportId());
		User u = (User) LoginCheckData.getInstance(session).getObj();
		carbill.setCarport(carport);
		carbill.setUser(u);
		carbill.setCommunity(u.getCommunity());
		int total = carport.getFee() * period;
		carbill.setFee(total);
		carbillBiz.newbill(carbill);
		
		return SUCCESS;
	}

	public String userUnpayedBill(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = carbillBiz.getUserUnpayedBill(u);
		request.put("list", list);
		return SUCCESS;
	}
	
	public String usercarbill(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = carbillBiz.getUserBill(u);
		request.put("list", list);
		return SUCCESS;
	}
	
	
	public String payCarbill(){
		if(carbill == null || carbill.getBid() == null){
			return ERROR;
		}
		carbillBiz.pay(carbill);
		return SUCCESS;
	}
	
	public String adminShow(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		if(u == null || !u.getIsAdmin()){
			return ERROR;
		}
		List list = carbillBiz.findCommunityBills(u.getCommunity().getCommunityno());
		request.put("bills", list);
		return SUCCESS;
	}
	
	public CarbillBiz getCarbillBiz() {
		return carbillBiz;
	}

	public void setCarbillBiz(CarbillBiz carbillBiz) {
		this.carbillBiz = carbillBiz;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public CarPort getCarport() {
		return carport;
	}

	public void setCarport(CarPort carport) {
		this.carport = carport;
	}

	public Integer getNeedFee() {
		return needFee;
	}

	public void setNeedFee(Integer needFee) {
		this.needFee = needFee;
	}

	public CarPortBiz getCarportBiz() {
		return carportBiz;
	}

	public void setCarportBiz(CarPortBiz carportBiz) {
		this.carportBiz = carportBiz;
	}

	public Carbill getCarbill() {
		return carbill;
	}

	public void setCarbill(Carbill carbill) {
		this.carbill = carbill;
	}

	public Integer getPeriod() {
		return period;
	}

	public void setPeriod(Integer period) {
		this.period = period;
	}
}
