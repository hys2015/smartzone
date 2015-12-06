package com.smartzone.store.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.GoodBiz;
import com.smartzone.store.biz.OrderBiz;
import com.smartzone.store.biz.RecaddrBiz;
import com.smartzone.store.entity.Good;
import com.smartzone.store.entity.Item;
import com.smartzone.store.entity.Order;
import com.smartzone.store.entity.Recaddr;

public class OrderAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	//成对分析
	private Integer gids[];
	private Good goods[];
	private Integer quantity[];
	
	private Order order;
	private Recaddr recaddr;
	
	private RecaddrBiz recaddrBiz;
	private OrderBiz orderBiz;
	private GoodBiz goodBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	public String toAdd(){
		/*这里这样写是因为方便 直接购买的功能
		 * 2015年11月25日19:57:55
		 * */
		if(gids == null){
			return ERROR;
		}
		goods = new Good[gids.length];
		for(int i = 0 ; i < gids.length ; ++i){
			goods[i] = goodBiz.findById(gids[i]);
		}
		List list = recaddrBiz.findByUser((User)LoginCheckData.getInstance(session).getObj());
		request.put("recaddrs", list);
		return SUCCESS;
	}
	
	public String add(){
		if(gids == null || recaddr == null){
			return ERROR;
		}
		if(order == null){
			order = new Order();
		}
		User u = (User) LoginCheckData.getInstance(session).getObj();
		order.setUsername(u.getUsername());
		recaddr = recaddrBiz.usedByOrder(recaddr.getRid());
		order.setRecaddr(recaddr);
		Set<Item> items = order.getItems();
		for(int i = 0 ; i < gids.length ; ++i){
			Item item = new Item();
			item.setGood(goodBiz.findById(gids[i]));
			System.out.println(gids[i]);
			item.setQuantity(quantity[i]);
			item.setOrder(order);
			items.add(item);
		}
		order.setItems(items);
		Integer oid = orderBiz.add(order);
		order.setOid(oid);
		
		//clear cart
		LoginCheckData.getInstance(session).clearCart();
		return SUCCESS;
	}
	
	public String userShow(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = orderBiz.findByUser(u);
		request.put("orders", list);
		return SUCCESS;
	}
	
	public String cancel(){
		if(order == null || order.getOid() == null){
			return ERROR;
		}
		orderBiz.setUnvisible(orderBiz.findById(order.getOid()));
		return SUCCESS;
	}
	
	public String toPay(){
		if( order == null || order.getOid() == null){
			System.out.println("toPay WRONG");
			return ERROR;
		}
		order = orderBiz.findById(order.getOid());
		session.put("order", order);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public OrderBiz getOrderBiz() {
		return orderBiz;
	}
	public void setOrderBiz(OrderBiz orderBiz) {
		this.orderBiz = orderBiz;
	}

	public GoodBiz getGoodBiz() {
		return goodBiz;
	}

	public void setGoodBiz(GoodBiz goodBiz) {
		this.goodBiz = goodBiz;
	}

	public Integer[] getGids() {
		return gids;
	}

	public void setGids(Integer[] gids) {
		this.gids = gids;
	}

	public Good[] getGoods() {
		return goods;
	}

	public void setGoods(Good[] goods) {
		this.goods = goods;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer[] getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer[] quantity) {
		this.quantity = quantity;
	}

	public Recaddr getRecaddr() {
		return recaddr;
	}

	public void setRecaddr(Recaddr recaddr) {
		this.recaddr = recaddr;
	}

	public RecaddrBiz getRecaddrBiz() {
		return recaddrBiz;
	}

	public void setRecaddrBiz(RecaddrBiz recaddrBiz) {
		this.recaddrBiz = recaddrBiz;
	}
}
