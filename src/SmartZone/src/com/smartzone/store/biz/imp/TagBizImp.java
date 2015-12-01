package com.smartzone.store.biz.imp;

import java.util.List;

import com.smartzone.store.biz.TagBiz;
import com.smartzone.store.dao.TagDAO;
import com.smartzone.store.entity.Tag;

public class TagBizImp implements TagBiz {
	private TagDAO tagDAO;
	
	/* (non-Javadoc)
	 * @see com.smartzone.store.biz.imp.TagBiz#findById(int)
	 */
	@Override
	public Tag findById(int id){
		return tagDAO.findById(id);
	}

	public TagDAO getTagDAO() {
		return tagDAO;
	}

	public void setTagDAO(TagDAO tagDAO) {
		this.tagDAO = tagDAO;
	}

	@Override
	public List findByTitle(String title) {
		return tagDAO.findByProperty("title", title);
	}

	@Override
	public List findAll() {
		return tagDAO.findAll();
	}
}
