package com.smartzone.info.entity;

import java.util.Map;

import com.smartzone.info.biz.NotificationBiz;

public class Notification {
	
	private int unread_repair_num;
	private int unread_feedback_num;
	
	private NotificationBiz nBiz;

	
		
	public static Notification getInstance(Map<String, Object> application){
		Notification mf = (Notification) application.get("Notification");
		if(null == mf){
			return new Notification(0,0);
		}
		return mf;
	}
	
	public void setInstance(Map<String, Object> application) {
		application.put("Notification", this);
	}
	

	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Notification(int unread_repair_num, int unread_notice_num) {
		super();
		this.unread_repair_num = unread_repair_num;
		this.unread_feedback_num = unread_notice_num;
	}

	public void newRepair() {
		this.unread_repair_num++;
	}
	public void readRepair(){
		this.unread_repair_num = 0;
	}
	
	public void newFeedback(){
		this.unread_feedback_num ++;
	}
	public void readFeedback(){
		this.unread_feedback_num = 0;
	}
	
	public int getUnread_repair_num() {
		return unread_repair_num;
	}

	public void setUnread_repair_num(int unread_repair_num) {
		this.unread_repair_num = unread_repair_num > 0 ? unread_repair_num : 0;
	}

	public int getUnread_feedback_num() {
		return unread_feedback_num;
	}

	public void setUnread_feedback_num(int unread_feedback_num) {
		this.unread_feedback_num = unread_feedback_num;
	}

	

}
