package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.CarPortBiz;
import com.smartzone.info.dao.CarPortDAO;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.User;

public class CarPortBizImp implements CarPortBiz {
	
	private CarPortDAO carportDAO;

	/* (non-Javadoc)
	 * @see com.smartzone.info.biz.imp.CarPortBiz#findAll(int)
	 */
	@Override
	public List findAll(int commNo){
		return carportDAO.findByProperty("community.communityno", commNo);
	}
	
	public CarPortDAO getCarportDAO() {
		return carportDAO;
	}

	public void setCarportDAO(CarPortDAO carportDAO) {
		this.carportDAO = carportDAO;
	}

	@Override
	public void add(CarPort carport) {
		carportDAO.save(carport);
	}

	@Override
	public CarPort findById(Integer carportId) {
		return carportDAO.findById(carportId);
	}

	@Override
	public void save(CarPort c) {
		carportDAO.save(c);
	}

	@Override
	public List findUserPorts(User user) {
		return carportDAO.findByProperty("user.username", user.getUsername());
	}

	@Override
	public List findNoOwnerPorts(Integer communityno) {
		return carportDAO.findNoOwnerPorts(communityno);
	}

	@Override
	public void delete(CarPort carport) {
		carportDAO.delete(carport);
	}

	@Override
	public void update(CarPort c) {
		carportDAO.update(c);
	}
}
