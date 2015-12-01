package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.FeedbackBiz;
import com.smartzone.info.dao.FeedbackDAO;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Pager;

public class FeedbackBizImp implements FeedbackBiz {

	FeedbackDAO feedbackDAO;
	
	public void setFeedbackDAO(FeedbackDAO feedbackDAO) {
		this.feedbackDAO = feedbackDAO;
	}
	@Override
	public void addFeedback(Feedback feedback) {
		feedbackDAO.save(feedback);
	}
	
	@Override
	public List getFeedbackByFno(int fno){
		List list = feedbackDAO.findByProperty("fno", fno);
		if( list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public List getAll() {
		return feedbackDAO.findAll();
	}
	@Override
	public void updateFeedback(Feedback fb) {
		feedbackDAO.save(fb);
	}
	@Override
	public Pager getPager(int size, int commNo) {
		int count = feedbackDAO.getCountofFeedbackOnProperty("communityno", String.valueOf(commNo));
		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(size);
		return pager;
	}
	@Override
	public Pager getPager(int size, String name) {
		int count = feedbackDAO.getCountofFeedbackOnProperty("fauthor", name);
		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(size);
		return pager;
	}
	@Override
	public List getAll(int curPage, int size, int commNo) {
		return feedbackDAO.getPagerCommunityFeedbackOnProperty(curPage, size, "communityno",String.valueOf(commNo));
	}
	@Override
	public List getAll(int curPage, int size, String name) {
		// TODO Auto-generated method stub
		return feedbackDAO.getPagerCommunityFeedbackOnProperty(curPage, size, "fauthor", name);
	}
	@Override
	public void delete(Feedback fb) {
		feedbackDAO.delete(fb);
	}

}
