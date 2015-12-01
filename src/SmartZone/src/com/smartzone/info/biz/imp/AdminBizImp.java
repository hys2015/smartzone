package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.AdminBiz;
import com.smartzone.info.dao.AdminDAO;
import com.smartzone.info.dao.CommunityDAO;
import com.smartzone.info.entity.Administor;
import com.smartzone.info.entity.Community;

public class AdminBizImp implements AdminBiz {
	AdminDAO adminDAO ;
	CommunityDAO communityDAO;
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public boolean addAdmin(Administor admin) {
		List list = adminDAO.search(admin);
		if(list == null || list.size() == 0){
			adminDAO.save(admin);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List getAllAdmin() {
		return adminDAO.getAllAdmin();
	}
	
	@Override
	public List login(Administor admin){
		List list = adminDAO.search(admin);
		if(list == null || list.size() == 0) return null;
		Administor check = (Administor) list.get(0);
		if(admin.getAdminPwd().equals(check.getAdminPwd())){
			return list;
		}else{
			return null;
		}
	}
	
	@Override
	public List getDetail(Administor admin){
		return adminDAO.search(admin);
	}

	@Override
	public boolean update(Administor admin) {
		List list = adminDAO.search(admin);
		if(list != null && list.size() > 0){
			adminDAO.save(admin);
			return true;
		}else{
			return false;
		}
	}

	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
}
