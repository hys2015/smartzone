package com.smartzone.info.biz.imp;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.smartzone.info.biz.NoticeBiz;
import com.smartzone.info.dao.NoticeDAO;
import com.smartzone.info.entity.Notice;
import com.smartzone.info.entity.Pager;

public class NoticeBizImp implements NoticeBiz {
	NoticeDAO noticeDAO;
	public void setNoticeDAO(NoticeDAO noticedao) {
		this.noticeDAO = noticedao;
	}
	@Override
	public List getNotice(int page, int size, int commNo, int seriesId) {
		return noticeDAO.getAllCommunityNotices(page, size, commNo, seriesId);
	}
	@Override
	public boolean addNotice(Notice notice) {
		notice.setValiable(Notice.AVALIABLE);
		notice.setPriority(Notice.NORMAL_PRIORITY);
		return noticeDAO.saveNotice(notice);
	}
	@Override
	public Pager getPager(int size, int commNo, int seriesId) {
		int count = noticeDAO.getCountofCommunityNotice(commNo, seriesId);

		Pager pager = new Pager();
		pager.setItemCount(count);
		pager.setPageSize(size);
		
		return pager;
	}
	@Override
	public List readNoticebyTid(int tid) {
		List list = getNoticebyTid(tid);
		Notice notice = (Notice) list.remove(0);
		notice.setReadcount(notice.getReadcount()+1);
		noticeDAO.saveNotice(notice);
		list.add(notice);
		return list;
	}
	@Override
	public List getNoticebyTid(int tid) {
		List list = new ArrayList();
		list.add(noticeDAO.searchByTid(tid));
		return list;
	}
	@Override
	public boolean setTopNotice(Notice notice) {
		notice.setPriority(Notice.TOP_PRIORITY);
		return noticeDAO.saveNotice(notice);
	}
	@Override
	public boolean cancelNotice(Notice notice) {
		notice.setValiable(Notice.UN_AVALIABLE);
		notice.setPriority(Notice.NORMAL_PRIORITY);
		return noticeDAO.updateNotice(notice);
	}
	@Override
	public boolean deleteNotice(Notice notice) {
		return noticeDAO.deleteNotice(notice);
	}
	@Override
	public void reset(Notice notice) {
		notice.setValiable(Notice.AVALIABLE);
		notice.setPriority(Notice.NORMAL_PRIORITY);
		noticeDAO.saveNotice(notice);
	}
	@Override
	public List search(String keyword) {
		return noticeDAO.searchOnProperty("title",keyword);
	}
	@Override
	public List findLast10(Integer communityno) {
		int num = 5;
		return noticeDAO.findLastOnProperty("communityno",communityno, num);
	}
}
