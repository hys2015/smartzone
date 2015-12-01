package com.smartzone.info.biz.imp;

import com.smartzone.info.biz.NotificationBiz;
import com.smartzone.info.dao.FeedbackDAO;
import com.smartzone.info.dao.RepairDAO;
import com.smartzone.info.entity.Notification;

public class NotificationBizImp implements NotificationBiz {

	private RepairDAO rDAO;
	private FeedbackDAO fDAO;
	
	@Override
	public Notification buildNewInstance(int commNo) {
		int rcount = rDAO.getCountofRepairOnProperty("communityno",String.valueOf(commNo));
		int fcount = fDAO.getCountofFeedbackOnProperty("communityno",String.valueOf(commNo));
		return null;
	}

	public void setrDAO(RepairDAO rDAO) {
		this.rDAO = rDAO;
	}

	public void setfDAO(FeedbackDAO fDAO) {
		this.fDAO = fDAO;
	}

}
