package com.smartzone.store.biz.imp;

import java.sql.Timestamp;
import java.util.List;

import com.smartzone.store.biz.GoodBiz;
import com.smartzone.store.dao.GoodDAO;
import com.smartzone.store.entity.Good;

public class GoodBizImp implements GoodBiz {
	private GoodDAO goodDAO;
	
	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.GoodBiz#findAll()
	 */
	@Override
	public List findAll(){
		return goodDAO.findAll();
	}

	public GoodDAO getGoodDAO() {
		return goodDAO;
	}

	public void setGoodDAO(GoodDAO goodDAO) {
		this.goodDAO = goodDAO;
	}

	@Override
	public List findByShopId(Integer sid) {
		return goodDAO.findByProperty("category.shop.sid", sid);
	}

	@Override
	public void save(Good good) {
		goodDAO.save(good);
	}

	@Override
	public Good findById(Integer gid) {
		return goodDAO.findById(gid);
	}

	@Override
	public void delete(Good good) {
		goodDAO.delete(good);
	}

	@Override
	public List findByCategory(Integer cid) {
		return goodDAO.findByProperty("category.cid", cid);
	}

	@Override
	public void add(Good good) {
		good.setVisible(Good.UN_VISIBLE);
		save(good);
	}

	@Override
	public List findVisibleByShopId(Integer sid) {
		return goodDAO.findVisibleByProperty("category.shop.sid", sid);
	}

	@Override
	public List findVisibleByCategory(Integer cid) {
		return goodDAO.findVisibleByProperty("category.cid", cid);
	}

	@Override
	public void onShelf(Good good) {
		good.setVisible(Good.VISIBLE);
		good.setOnshelftime(new Timestamp(System.currentTimeMillis()));
		save(good);
	}
	public void awayShelf(Good good) {
		good.setVisible(Good.UN_VISIBLE);
		save(good);
	}

	@Override
	public List findLast10onShelf(Integer communityno) {
		int num = 8;
		return goodDAO.findLastOnShelf("category.shop.user.community.communityno",communityno, num);
	}

	@Override
	public List findRecommandedFoodsByShop(Good good) {
		int num = 3;
		return goodDAO.findRecommandedGoods(good, num);
	}
}
