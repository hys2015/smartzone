package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.Repair;

public interface RepairBiz {

	public void addRepair(Repair repair);

	public List getRpairWithPage(int page,int size,String username);
	
	public List getRpairWithPage(int page,int size);

	public Pager getPager(int size, String username);
	
	public Pager getPager(int size);
	
	public List getRpairByRno(Integer rno);

	public void updateRepair(Repair r);

	public void delete(Repair repair);
	
}