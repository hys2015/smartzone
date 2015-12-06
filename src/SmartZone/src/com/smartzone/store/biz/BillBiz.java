package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Bill;

public interface BillBiz {

	public List findAll();

	public Integer newBill(Bill bill);

}