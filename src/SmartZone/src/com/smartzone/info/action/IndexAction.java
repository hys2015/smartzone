package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.bbs.biz.PostBiz;
import com.smartzone.info.biz.NoticeBiz;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.GoodBiz;

public class IndexAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private GoodBiz goodBiz;
	private PostBiz postBiz;
	private NoticeBiz noticeBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	public String index(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = postBiz.findLast10(u.getCommunity().getCommunityno());
		request.put("posts", list);
		list = noticeBiz.findLast10(u.getCommunity().getCommunityno());
		request.put("notices", list);
		list = goodBiz.findLast10onShelf(u.getCommunity().getCommunityno());
		request.put("goods", list);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setGoodBiz(GoodBiz goodBiz) {
		this.goodBiz = goodBiz;
	}
	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}
	public void setNoticeBiz(NoticeBiz noticeBiz) {
		this.noticeBiz = noticeBiz;
	}
	
	
}
