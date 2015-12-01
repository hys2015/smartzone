package com.smartzone.info.biz;

import java.util.List;

import com.smartzone.info.entity.Notice;
import com.smartzone.info.entity.Pager;

public interface NoticeBiz {
	/**
	 * 分页取结果
	 * @param page 页数（从1开始）
	 * @param size 页面大小
	 * @param seriesId 
	 * @return 结果
	 */
	public List getNotice(int page,int size, int commNo, int seriesId);
	/**
	 * add Notice
	 * @param notice
	 * @return true if suc , false if err
	 */
	public boolean addNotice(Notice notice);
	/**
	 * 
	 * @param size 
	 * @return Pager Entity
	 * 
	 */
	public Pager getPager(int sIZE, int commNo, int seriesId);
	/**
	 * 
	 * @param tid
	 * @return
	 */
	public List getNoticebyTid(int tid);
	
	public List readNoticebyTid(int tid);
	/**
	 * 置顶notice，每次只能有一个置顶的
	 * @param notice
	 * @return
	 */
	public boolean setTopNotice(Notice notice);
	/**
	 * 
	 * @param notice
	 * @return
	 */
	public boolean cancelNotice(Notice notice);
	/**
	 * 
	 * @param notice
	 * @return
	 */
	public boolean deleteNotice(Notice notice);
	/**
	 * 
	 * @param notice
	 */
	public void reset(Notice notice);
	
	public List search(String keyword);
	
	public List findLast10(Integer communityno);
	
	
}
