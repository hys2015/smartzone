package com.smartzone.store.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.CommentBiz;
import com.smartzone.store.entity.Comment;

public class CommentAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private Comment comment;
	
	private CommentBiz commentBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	public String toAdd(){
		if(comment == null || comment.getGid() == null){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String add(){
		if(comment == null || comment.getGid() == null){
			return ERROR;
		}
		User u = (User) LoginCheckData.getInstance(session).getObj();
		comment.setUsername(u.getUsername());
		commentBiz.add(comment);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public CommentBiz getCommentBiz() {
		return commentBiz;
	}
	public void setCommentBiz(CommentBiz commentBiz) {
		this.commentBiz = commentBiz;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
}
