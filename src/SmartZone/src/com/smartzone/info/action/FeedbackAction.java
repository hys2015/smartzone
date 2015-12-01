package com.smartzone.info.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.FeedbackBiz;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Notification;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.ReplyToFeed;
import com.smartzone.info.entity.User;

public class FeedbackAction extends ActionSupport implements RequestAware,
		SessionAware,ApplicationAware {
	
	/**
	 * show 
	 * add 新留言
	 * reply 回复
	 * toReply 回复之前的准备工作
	 * myFeedback 我的留言
	 * delete
	 *
	 *
	 */
	private final int SIZE = 5;

	Logger log = LoggerFactory.getLogger(FeedbackAction.class);
	
	private Pager pager;
	private Feedback feedback;
	private FeedbackBiz fBiz;
	private ReplyToFeed reply;
	
	Map<String, Object> request;
	Map<String, Object> session;
	Map<String, Object> application;
	
	public String show(){
		
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List nlist = null;
		LoginCheckData lcd = null;
		if (null == feedback) {
			lcd = LoginCheckData.getInstance(session);
			pager = fBiz.getPager(SIZE, lcd.getCommNo());
			if (curPage > pager.getPageCount()) {
				curPage = pager.getPageCount();
			} else if (curPage < 0) {
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = fBiz.getAll(curPage, SIZE, lcd.getCommNo());
		}
		request.put("feedbackList", nlist);
		request.put("url","show");
		User user = (User) lcd.getObj();
		if(user.getIsAdmin()){
			Notification ntf = Notification.getInstance(application);
			ntf.readFeedback();
			ntf.setInstance(application);
		}
		
		return SUCCESS;
	}
	
	public String add(){
		
		if(feedback !=null && feedback.getFno() != null){
			List list = fBiz.getFeedbackByFno(feedback.getFno());
			if( null == list ){
				log.error("add(update) feedback.fno is useless");
				return ERROR;
			}
			Feedback fb = (Feedback) list.get(0);
			feedback.setReplies(fb.getReplies());
			feedback.setFtime(fb.getFtime());
		}
		
		if(feedback != null && feedback.getFauthor() == null && feedback.getCommunityno() == null){
			LoginCheckData lcd = LoginCheckData.getInstance(session);
			String name = null;
			Integer communityno = null;
			if("user".equals(lcd.getType())){
				name = ((User)lcd.getObj()).getUsername();
				communityno =  ((User)lcd.getObj()).getCommunity().getCommunityno();
			}
			feedback.setFauthor(name);
			feedback.setCommunityno(communityno);
		}
		
		fBiz.addFeedback(feedback);
		//Notification
		Notification ntf = Notification.getInstance(application);
		ntf.newFeedback();
		ntf.setInstance(application);
		
		return SUCCESS;
	}
	
	public String reply(){
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		String name = null;
		if( "user".equals(lcd.getType())){
			name = ((User) lcd.getObj()).getUsername();
		}
		reply.setReauthor(name);
		
		Integer fno = feedback.getFno();
		if( null == fno ) {
			log.error("feedback.fno is NULL");
			return ERROR;
		}
		List list = fBiz.getFeedbackByFno(fno);
		if( null == list || list.size() < 1){
			log.error("fno is wrong");
			return ERROR;
		}
		Feedback fb = (Feedback) list.get(0);
		List replies = fb.getReplies();
		if( null == replies ){
			replies = new ArrayList();
		}
		reply.setFeedback(fb);
		replies.add(reply);
		fb.setReplies(replies);
		fBiz.updateFeedback(fb);
		
		return SUCCESS;
	}

	public String toReply(){
		Integer fno = feedback.getFno();
		if( fno == null ){
			return INPUT;
		}
		request.put("fno",fno);
		return SUCCESS;
	}
	
	public String toUpdate(){
		if(feedback == null){
			log.error("toUpdate feedback is null");
			return ERROR;
		}
		Integer fno = feedback.getFno();
		List list = fBiz.getFeedbackByFno(fno);
		if(list == null || list.size() < 1 ){
			log.error("toUpdate feedback fno is useless");
			return ERROR;
		}
		request.put("feedback",list.get(0));
		return SUCCESS;
	}
	
	/**
	 * "我的留言" 功能,用户功能
	 * @return
	 */
	public String myFeedback(){
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List nlist = null;
		if (null == feedback) {
			LoginCheckData lcd = LoginCheckData.getInstance(session);
			String name = null;
			if( "user".equals(lcd.getType())){
				name = ((User) lcd.getObj()).getUsername();
			}
			pager = fBiz.getPager(SIZE, name);
			if (curPage > pager.getPageCount()) {
				curPage = pager.getPageCount();
			} else if (curPage < 0) {
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = fBiz.getAll(curPage, SIZE, name);
		}
		request.put("feedbackList", nlist);
		request.put("myFeedback", "我的留言");
		request.put("url","myFeedback");
		return SUCCESS;
	}
	
	public String delete(){
		if(feedback != null && feedback.getFno() != null ){
			int fno = feedback.getFno();
			List list = fBiz.getFeedbackByFno(fno);
			if(list == null || list.size() < 1){
				log.error("fno is useless");
				return ERROR;
			}
			Feedback fb = (Feedback)list.get(0);
			fBiz.delete(fb);
			return SUCCESS;
		}
		log.error("FeedbackAction feedback is null");
		return ERROR;
	}
	
	public void setfBiz(FeedbackBiz fBiz) {
		this.fBiz = fBiz;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	public Feedback getFeedback() {
		return feedback;
	}
	
	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public ReplyToFeed getReply() {
		return reply;
	}

	public void setReply(ReplyToFeed reply) {
		this.reply = reply;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}
}
