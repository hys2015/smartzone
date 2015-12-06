package com.smartzone.store.biz;

import java.util.List;

import com.smartzone.store.entity.Bill;
import com.smartzone.store.entity.Shop;

public interface BillBiz {

	public List findAll();

	public Integer newBill(Bill bill);

	public List findShopBills(Shop shop);

	public Bill findById(Integer bid);

	public void sentBill(Bill bill);

	public void arrivedBill(Bill bill);

}