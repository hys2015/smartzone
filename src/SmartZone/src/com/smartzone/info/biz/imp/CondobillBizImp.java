package com.smartzone.info.biz.imp;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.smartzone.info.biz.CondobillBiz;
import com.smartzone.info.dao.CondobillDAO;
import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.User;

public class CondobillBizImp implements CondobillBiz {
	private CondobillDAO condobillDAO;

	public CondobillDAO getCondobillDAO() {
		return condobillDAO;
	}

	public void setCondobillDAO(CondobillDAO condobillDAO) {
		this.condobillDAO = condobillDAO;
	}

	@Override
	public List findCommunityCondoBill(Integer communityno) {
		return condobillDAO.findByProperty("user.community.communityno", communityno);
	}

	@Override
	public void saveOrUpdate(Condobill condobill) {
		condobillDAO.save(condobill);
	}

	@Override
	public List findUserCondoBill(User user) {
		List list = condobillDAO.findByProperty("user.username", user.getUsername());
		return list;
	}

	@Override
	public Condobill findById(Integer bid) {
		return condobillDAO.findById(bid);
	}
}
