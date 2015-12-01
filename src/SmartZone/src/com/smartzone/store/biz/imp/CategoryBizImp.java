package com.smartzone.store.biz.imp;

import java.util.List;

import com.smartzone.store.biz.CategoryBiz;
import com.smartzone.store.dao.CategoryDAO;
import com.smartzone.store.entity.Category;

public class CategoryBizImp implements CategoryBiz {
	private CategoryDAO categoryDAO;
	
	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.CategoryBiz#findAll()
	 */
	@Override
	public List findAll(){
		return categoryDAO.findAll();
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	@Override
	public Category findById(Integer cid) {
		return categoryDAO.findById(cid);
	}

	@Override
	public List findByShopId(Integer sid) {
		return categoryDAO.findByProperty("shop.sid", sid);
	}

	@Override
	public void add(Category category) {
		// TODO Auto-generated method stub
		categoryDAO.save(category);
	}

	@Override
	public void delete(Category category) {
		categoryDAO.delete(category);
	}
}
