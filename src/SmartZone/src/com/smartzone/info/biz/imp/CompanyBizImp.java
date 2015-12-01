package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.CompanyBiz;
import com.smartzone.info.dao.CompanyDAO;

public class CompanyBizImp implements CompanyBiz {

	CompanyDAO companyDAO;
	
	@Override
	public List findAll() {
		return companyDAO.findAll();
	}

	public void setCompanyDAO(CompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}

}
