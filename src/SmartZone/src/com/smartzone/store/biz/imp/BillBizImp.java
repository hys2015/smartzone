package com.smartzone.store.biz.imp;

import java.util.List;

import com.smartzone.store.biz.BillBiz;
import com.smartzone.store.dao.BillDAO;
import com.smartzone.store.entity.Bill;
import com.smartzone.store.entity.Item;

public class BillBizImp implements BillBiz {
	private BillDAO billDAO;

	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.BillBiz#findAll()
	 */
	@Override
	public List findAll(){
		return billDAO.findAll();
	}
	
	public BillDAO getBillDAO() {
		return billDAO;
	}

	public void setBillDAO(BillDAO billDAO) {
		this.billDAO = billDAO;
	}

	@Override
	public Integer newBill(Bill bill) {
		bill.setState(0);
		double price = 0;
		Item item = bill.getItem();
		price = item.getGood().getPrice() * item.getQuantity();
		bill.setPrice(price);
		int bid = billDAO.save(bill);
		return bid;
	}
}
