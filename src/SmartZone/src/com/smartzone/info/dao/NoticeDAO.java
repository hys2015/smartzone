package com.smartzone.info.dao;

import java.util.List;

import com.smartzone.info.entity.Notice;

public interface NoticeDAO {
	/**
	 * 分页获取结果
	 * @param page 页码
	 * @param size 页面大小
	 * @return 相应页面的结果
	 */
	public List getAllNotices(int page,int size);
	public List getAllCommunityNotices(int page,int size,int commNo, int seriesId);
	/**
	 * 
	 * @param notice
	 * @return
	 */
	public boolean saveNotice(Notice notice);
	/**
	 * 
	 * @return
	 */
	public Integer getCountofNotice();
	
	public Integer getCountofCommunityNotice(int commNo, int seriesId);
	
	/**
	 * 
	 * @param tid
	 * @return
	 */
	public Notice searchByTid(int tid);
	/**
	 * 
	 * @param notice
	 * @return
	 */
	public boolean updateNotice(Notice notice);
	/**
	 * 查找已经被置顶的帖子
	 * @return
	 */
	public List searchTopNotice();
	/**
	 * 
	 * @param notice
	 * @return
	 */
	public boolean deleteNotice(Notice notice);
	public List searchOnProperty(String string, String keyword);
	public List findLastOnProperty(String propertyName, Object value, int num);
}
