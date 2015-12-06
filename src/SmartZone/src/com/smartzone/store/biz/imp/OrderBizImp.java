package com.smartzone.store.biz.imp;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.smartzone.info.entity.User;
import com.smartzone.store.biz.BillBiz;
import com.smartzone.store.biz.OrderBiz;
import com.smartzone.store.dao.GoodDAO;
import com.smartzone.store.dao.OrderDAO;
import com.smartzone.store.entity.Bill;
import com.smartzone.store.entity.Good;
import com.smartzone.store.entity.Item;
import com.smartzone.store.entity.Order;

public class OrderBizImp implements OrderBiz {
	private OrderDAO orderDAO;
	private GoodDAO goodDAO;
	private BillBiz billBiz;
	public void setGoodDAO(GoodDAO goodDAO) {
		this.goodDAO = goodDAO;
	}
	
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.OrderBiz#findAll()
	 */
	@Override
	public List findAll(){
		return orderDAO.findAll();
	}

	@Override
	public Integer add(Order order) {
		order.setState(Order.STATE_UNPAYED);
		order.setVisible(true);
		return orderDAO.save(order);
	}

	@Override
	public List findByUser(User u) {
		return orderDAO.findByProperty("username", u.getUsername());
	}

	@Override
	public Order findById(Integer oid) {
		return orderDAO.findById(oid);
	}
	
	public void save(Order order){
		orderDAO.save(order);
	}

	@Override
	public void setUnvisible(Order order) {
		order.setVisible(false);
		save(order);
	}

	@Override
	public void payed(Order order) {
		Order o = findById(order.getOid());
		o.setTrxId(order.getTrxId());
		o.setState(Order.STATE_PAYED);
		o.setPaytime(new Timestamp(System.currentTimeMillis()));
		Set items = o.getItems();
		Iterator<Item> it = items.iterator();
		Bill bill = null;
		while(it.hasNext()){
			Item item = it.next();
			Good good = item.getGood();
			int quantity = good.getQuantity();
			good.setQuantity(quantity - item.getQuantity());
			good.setSoldcount(good.getSoldcount() + item.getQuantity());
			goodDAO.save(good);
			
			bill = new Bill();
			bill.setItem(item);
			bill.setSid(good.getCategory().getShop().getSid());
			bill.setRecaddr(item.getOrder().getRecaddr());
			billBiz.newBill(bill);
		}
		save(o);
	}

	public void setBillBiz(BillBiz billBiz) {
		this.billBiz = billBiz;
	}

	
}
