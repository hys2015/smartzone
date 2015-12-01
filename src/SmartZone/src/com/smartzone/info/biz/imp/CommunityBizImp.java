package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.CommunityBiz;
import com.smartzone.info.dao.CommunityDAO;
import com.smartzone.info.entity.Community;

public class CommunityBizImp implements CommunityBiz {

	CommunityDAO commDAO;
	
	@Override
	public List findAll() {
		return commDAO.findAll();
	}

	@Override
	public Community findByCommunityNo(int commNo) {
		List list = commDAO.findByProperty("communityno", commNo);
		if(list != null && list.size() > 0){
			return (Community) list.get(0);
		}
		return null;
	}

	public void setCommDAO(CommunityDAO commDAO) {
		this.commDAO = commDAO;
	}

}
