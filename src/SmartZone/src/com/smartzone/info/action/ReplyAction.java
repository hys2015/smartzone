package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.ReplyBiz;
import com.smartzone.info.entity.ReplyToFeed;

public class ReplyAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	public static Logger log = LoggerFactory.getLogger(ReplyToFeed.class);
	
	Map<String,Object> session;
	Map<String,Object> request;
	
	private ReplyToFeed reply;
	private ReplyBiz rBiz;
	private String url;
	
	public String delete(){
		if(reply != null){
			Integer reno = reply.getReno();
			List list = rBiz.getReplyByReno(reno);
			if(list == null || list.size() < 1){
				log.error("delete reply.reno is useless");
				return ERROR;
			}
			rBiz.delete((ReplyToFeed)list.get(0));
			return SUCCESS;
		}
		log.error("reply is null");
		return ERROR;
	}
	
	public String toUpdate(){
		if( reply != null ){
			Integer reno = reply.getReno();
			List list = rBiz.getReplyByReno(reno);
			if(list == null || list.size() < 1 ){
				log.error("toUpdate reply.reno is useless");
				return ERROR;
			}
			request.put("reply", list.get(0));
			return SUCCESS;
		}
		log.error("toUpdate reply is null");
		return ERROR;
	}
	
	public String update(){
		if( reply != null ){
			Integer reno = reply.getReno();
			List list = rBiz.getReplyByReno(reno);
			if(list == null || list.size() < 1 ){
				log.error("toUpdate reply.reno is useless");
				return ERROR;
			}
			ReplyToFeed r = (ReplyToFeed) list.get(0);
			r.setRecontent(reply.getRecontent());
			rBiz.update(r);
			return SUCCESS;
		}
		log.error("toUpdate reply is null");
		return ERROR;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public ReplyToFeed getReply() {
		return reply;
	}

	public void setReply(ReplyToFeed reply) {
		this.reply = reply;
	}

	public ReplyBiz getrBiz() {
		return rBiz;
	}

	public void setrBiz(ReplyBiz rBiz) {
		this.rBiz = rBiz;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
