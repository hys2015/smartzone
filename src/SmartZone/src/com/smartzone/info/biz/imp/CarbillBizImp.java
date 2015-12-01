package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.CarbillBiz;
import com.smartzone.info.dao.CarbillDAO;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.User;

public class CarbillBizImp implements CarbillBiz {
	private CarbillDAO carbillDAO;
	
	public CarbillDAO getCarbillDAO() {
		return carbillDAO;
	}

	public void setCarbillDAO(CarbillDAO carbillDAO) {
		this.carbillDAO = carbillDAO;
	}

	@Override
	public Carbill findByCarportAndUser(CarPort carport, User u) {
		List list = carbillDAO.findByCarportAndUser(carport.getCarportId(), u.getUsername());
		if(list == null || list.size() < 1){
			return null;
		}else{
			return (Carbill) list.get(0);
		}
	}

	@Override
	public void newbill(Carbill carbill) {
		carbill.setIspayed(false);
		carbillDAO.save(carbill);
	}

	@Override
	public List getUserUnpayedBill(User u) {
		return carbillDAO.getUserUnpayedOrPayedBill(u.getUsername(), 0);
	}

	@Override
	public List getUserBill(User u) {
		return carbillDAO.findByProperty("user.username", u.getUsername());
	}

	@Override
	public void pay(Carbill carbill) {
		Carbill c = carbillDAO.findById(carbill.getBid());
		c.setIspayed(true);
		carbillDAO.save(c);
	}

	@Override
	public List findCommunityBills(Integer communityno) {
		return carbillDAO.findByProperty("community.communityno", communityno);
	}
}
