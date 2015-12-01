package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Administor;

public interface AdminBiz {
	public List login(Administor admin);
	//GetAll
	public List getAllAdmin();
	//Create
	public boolean addAdmin(Administor admin);
	//get
	public List getDetail(Administor admin);
	//update
	public boolean update(Administor admin);
}
