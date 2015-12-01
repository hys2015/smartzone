package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.CondofeeBiz;
import com.smartzone.info.dao.CondofeeDAO;
import com.smartzone.info.entity.Condobill;
import com.smartzone.info.entity.Condofee;

public class CondofeeBizImp implements CondofeeBiz{
	private CondofeeDAO condofeeDAO;

	
	public CondofeeDAO getCondofeeDAO() {
		return condofeeDAO;
	}

	public void setCondofeeDAO(CondofeeDAO condofeeDAO) {
		this.condofeeDAO = condofeeDAO;
	}

	@Override
	public List findCommunityCondoFee(int commNo) {
		return condofeeDAO.findByProperty("user.community.communityno", commNo);
	}

	@Override
	public void saveOrUpdate(Condofee condofee) {
		condofeeDAO.save(condofee);
	}
}
