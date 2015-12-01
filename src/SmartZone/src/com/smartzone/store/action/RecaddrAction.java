package com.smartzone.store.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.RecaddrBiz;
import com.smartzone.store.entity.Recaddr;

public class RecaddrAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private Recaddr recaddr;
	
	private RecaddrBiz recaddrBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	
	public String show(){
		
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = recaddrBiz.findByUser(u);
		request.put("recaddrs", list);
		
		return SUCCESS;
	}
	
	public String add(){
		if( recaddr == null || recaddr.getName() == null 
				|| recaddr.getAddr() == null
				|| recaddr.getPhone() == null){
			return ERROR;
		}
		boolean b = recaddrBiz.isExsits(recaddr);
		if(true == b){
			session.put("message", "该地址已存在");
		}else{
			recaddr.setUser((User)LoginCheckData.getInstance(session).getObj());
			recaddrBiz.add(recaddr);
			session.put("message", "收货地址添加成功");
		}
		return SUCCESS;
	}
	
	public String delete(){
		
		if(recaddr == null || recaddr.getRid() == null){
			return ERROR;
		}
		recaddrBiz.delete(recaddr);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public RecaddrBiz getRecaddrBiz() {
		return recaddrBiz;
	}

	public void setRecaddrBiz(RecaddrBiz recaddrBiz) {
		this.recaddrBiz = recaddrBiz;
	}

	public Recaddr getRecaddr() {
		return recaddr;
	}

	public void setRecaddr(Recaddr recaddr) {
		this.recaddr = recaddr;
	}
}
