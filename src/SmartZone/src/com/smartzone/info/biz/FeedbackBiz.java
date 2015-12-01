package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Pager;

public interface FeedbackBiz {
	public void addFeedback(Feedback feedback);

	public List getAll();
	
	public List getFeedbackByFno(int fno);

	public void updateFeedback(Feedback fb);

	public Pager getPager(int sIZE, int commNo);

	public Pager getPager(int sIZE, String name);

	public List getAll(int curPage, int sIZE, int commNo);

	public List getAll(int curPage, int sIZE, String name);

	public void delete(Feedback fb);
}
