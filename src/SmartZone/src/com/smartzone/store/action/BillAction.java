package com.smartzone.store.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.store.biz.BillBiz;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.entity.Bill;
import com.smartzone.store.entity.Shop;

public class BillAction extends ActionSupport implements RequestAware,
		SessionAware {
	private Bill bill;
	private Shop shop;
	
	private ShopBiz shopBiz;
	private BillBiz billBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	public String mybills(){
		
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		List list = billBiz.findShopBills(shop);
		request.put("bills", list);
		return SUCCESS;
	}
	
	public String sent(){
		if(bill == null || bill.getBid() == null){
			System.out.println("sent method bill or bid is null");
			return ERROR;
		}
		bill = billBiz.findById(bill.getBid());
		billBiz.sentBill(bill);
		return SUCCESS;
	}
	public String arrived(){
		if(bill == null || bill.getBid() == null){
			System.out.println("sent method bill or bid is null");
			return ERROR;
		}
		bill = billBiz.findById(bill.getBid());
		billBiz.arrivedBill(bill);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public BillBiz getBillBiz() {
		return billBiz;
	}
	public void setBillBiz(BillBiz billBiz) {
		this.billBiz = billBiz;
	}
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}
}
