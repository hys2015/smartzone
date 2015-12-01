package com.smartzone.bbs.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

abstract class BaseAction extends ActionSupport implements SessionAware {
    Map<String,Object> session;
	@Override
	public void setSession(Map session) {
		this.session=session;
	}
}
