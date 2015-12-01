package com.smartzone.store.biz.imp;

import java.sql.Timestamp;
import java.util.List;

import com.smartzone.info.entity.User;
import com.smartzone.store.biz.RecaddrBiz;
import com.smartzone.store.dao.RecaddrDAO;
import com.smartzone.store.entity.Recaddr;

public class RecaddrBizImp implements RecaddrBiz {
	private RecaddrDAO recaddrDAO;

	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.RecaddrBiz#add(com.smartzone.store.entity.Recaddr)
	 */
	@Override
	public void add(Recaddr recaddr){
		recaddr.setVisible(true);
		recaddrDAO.save(recaddr);
	}
	
	public RecaddrDAO getRecaddrDAO() {
		return recaddrDAO;
	}

	public void setRecaddrDAO(RecaddrDAO recaddrDAO) {
		this.recaddrDAO = recaddrDAO;
	}

	@Override
	public List findByUser(User u) {
		return recaddrDAO.findByPropertyVisible("user.username",u.getUsername());
	}

	@Override
	public void delete(Recaddr recaddr) {
		Recaddr ra = recaddrDAO.findById(recaddr.getRid());
		if( ra != null){
			ra.setVisible(false);
			recaddrDAO.save(ra);
		}
	}

	@Override
	public boolean isExsits(Recaddr recaddr) {
		List list = recaddrDAO.findByExample(recaddr);
		if(list != null && list.size() > 0){
			return true;
		}
		return false;
	}

	@Override
	public Recaddr findById(Integer rid) {
		return recaddrDAO.findById(rid);
	}

	public void save(Recaddr recaddr){
		recaddrDAO.save(recaddr);
	}
	
	@Override
	public Recaddr usedByOrder(Integer rid) {
		Recaddr ra = findById(rid);
		ra.setLastusetime(new Timestamp(System.currentTimeMillis()));
		save(ra);
		return ra;
	}
}
