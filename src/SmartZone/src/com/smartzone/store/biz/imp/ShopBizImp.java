package com.smartzone.store.biz.imp;

import java.util.List;

import com.smartzone.info.entity.User;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.dao.ShopDAO;
import com.smartzone.store.entity.Shop;

public class ShopBizImp implements ShopBiz {
	private ShopDAO shopDAO;

	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.ShopBiz#findAll()
	 */
	@Override
	public List findAll(){
		return shopDAO.findAll();
	}
	
	public ShopDAO getShopDAO() {
		return shopDAO;
	}

	public void setShopDAO(ShopDAO shopDAO) {
		this.shopDAO = shopDAO;
	}

	@Override
	public List findByCommNo(int commNo) {
		return shopDAO.findByProperty("user.community.communityno", commNo);
	}

	@Override
	public void save(Shop shop) {
		shopDAO.save(shop);
	}

	@Override
	public List findUserShops(User u) {
		return shopDAO.findByProperty("user.username", u.getUsername());
	}

	@Override
	public Shop findById(Shop shop) {
		return shopDAO.findById(shop.getSid());
	}

	@Override
	public List searchBySname(Shop shop) {
		return shopDAO.findByExample(shop);
	}

	@Override
	public List findVisibleByCommNo(int commNo) {
		return shopDAO.findVisibleByProperty("user.community.communityno", commNo);
	}

	@Override
	public void open(Shop shop) {
		shop = findById(shop);
		shop.setVisible(true);
		save(shop);
	}

	@Override
	public void close(Shop shop) {
		shop = findById(shop);
		shop.setVisible(false);
		save(shop);
	}

	@Override
	public void add(Shop shop) {
		shop.setVisible(false);
		save(shop);
	}
}
