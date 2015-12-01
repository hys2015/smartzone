package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.ReplyBiz;
import com.smartzone.info.dao.ReplyDAO;
import com.smartzone.info.entity.ReplyToFeed;

public class ReplyBizImp implements ReplyBiz {
	
	ReplyDAO replyDAO;
	
	@Override
	public List getAll() {
		return replyDAO.findAll();
	}

	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public List getReplyByReno(Integer reno) {
		return replyDAO.findByProperty("reno", reno);
	}

	@Override
	public void delete(ReplyToFeed reply) {
		// TODO Auto-generated method stub
		replyDAO.delete(reply);
	}

	@Override
	public void update(ReplyToFeed r) {
		replyDAO.save(r);
	}

}
