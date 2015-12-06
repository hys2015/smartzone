package com.smartzone.store.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.store.biz.BillBiz;

public class BillAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private BillBiz billBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public BillBiz getBillBiz() {
		return billBiz;
	}
	public void setBillBiz(BillBiz billBiz) {
		this.billBiz = billBiz;
	}
}
