package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.RepairBiz;
import com.smartzone.info.dao.RepairDAO;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.Repair;

public class RepairBizImp implements RepairBiz{
	
	private RepairDAO repairDAO;
	
	/* (non-Javadoc)
	 * @see com.smartzone.biz.imp.RepairBiz#addRepair(com.smartzone.entity.Repair)
	 */
	public RepairDAO getRepairDAO() {
		return repairDAO;
	}
	
	public void setRepairDAO(RepairDAO repairDAO) {
		this.repairDAO = repairDAO;
	}
	
	@Override
	public void addRepair(Repair repair){
		repairDAO.save(repair);
	}


	@Override
	public List getRpairWithPage(int page, int size,String username) {
		// TODO Auto-generated method stub
		return repairDAO.findPageRepair(page,size,username);
	}

	@Override
	public List getRpairWithPage(int page, int size) {
		return repairDAO.findPageRepair(page,size);
	}

	@Override
	public Pager getPager(int size) {
		int count = repairDAO.getCountofRepair();

		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(size);
		
		return pager;
	}
	@Override
	public Pager getPager(int size, String username) {
		int count = repairDAO.getCountofUserRepair(username);

		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(size);
		
		return pager;
	}

	@Override
	public List getRpairByRno(Integer rno) {
		List list = repairDAO.findByProperty("rno", rno);
		if(list != null && list.size() > 0) return list;
		return null;
	}

	@Override
	public void updateRepair(Repair repair) {
		repairDAO.save(repair);
	}

	@Override
	public void delete(Repair repair) {
		repairDAO.delete(repair);
	}
	
}
