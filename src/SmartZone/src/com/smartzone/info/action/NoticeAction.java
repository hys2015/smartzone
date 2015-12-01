package com.smartzone.info.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.NoticeBiz;
import com.smartzone.info.biz.SeriesBiz;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Notice;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.Series;
import com.smartzone.info.entity.User;

public class NoticeAction extends ActionSupport implements RequestAware,
		SessionAware,ApplicationAware {
	
	private Logger log = LoggerFactory.getLogger(Notice.class);
	
	private static final long serialVersionUID = -3622345487788864427L;

	private Notice notice;
	private Pager pager;
	private NoticeBiz nBiz;
	private SeriesBiz seriesBiz;
	private Integer tid;
	private Integer seriesId;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, Object> application;
	
	private String keyword;
	
	private final int SIZE = 10;

	/**
	 * get notice
	 * 
	 * @return
	 */
	public String show() {
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List nlist = null;
		if (null == notice || pager == null) {
			LoginCheckData lcd = LoginCheckData.getInstance(session);
			pager = nBiz.getPager(SIZE, lcd.getCommNo(), seriesId);
			if (curPage > pager.getPageCount()) {
				curPage = pager.getPageCount();
			} else if (curPage < 0) {
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = nBiz.getNotice(curPage, SIZE, lcd.getCommNo(), seriesId);
		}
		request.put("notice", nlist);
		
		return "success";
	}

	/**
	 * add notice
	 */
	public String add() {
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		if(notice.getTid() != null ){
			nBiz.deleteNotice(notice);
			notice.setTid(null);
		}
		notice.setCommunityno(lcd.getCommNo());
		notice.setAuthor(((User)lcd.getObj()).getUsername());
		if(notice.getReadcount() == null){
			notice.setReadcount(0);
		}
		Series s = seriesBiz.findById(seriesId);
		if(s == null){
			return ERROR;
		}
		List notices = s.getNotices();
		if(notices == null ){
			notices = new ArrayList<Notice>();
		}
		notice.setValiable(Notice.AVALIABLE);
		notice.setPriority(Notice.NORMAL_PRIORITY);
		notice.setSeries(s);
		notices.add(notice);
		s.setNotices(notices);
		seriesBiz.update(s);
		return "success";
	}
	
	public String toUpdate(){
		
		int tid = notice.getTid();
		List list = nBiz.getNoticebyTid(tid);
		if( list == null || list.size() < 1) {
			log.error("notice.tid is null or useless");
			return ERROR;
		}
		request.put("notice",list.get(0));
		int commNo = LoginCheckData.getInstance(session).getCommNo();
		list = seriesBiz.findAll(commNo);
		request.put("series", list);
		return SUCCESS;
	}
	
	public String update(){
		
		Notice check = (Notice) nBiz.getNoticebyTid(notice.getTid()).get(0);
		Series s = seriesBiz.findById(seriesId);
		check.setSeries(s);
		check.setContent(notice.getContent());
		nBiz.addNotice(check);
		
		return SUCCESS;
	}

	/**
	 * 
	 * @return
	 */
	public String getNoticeByTid() {
		if (tid != null && tid > 0) {
			List list = nBiz.readNoticebyTid(tid);
			if (list == null)
				return INPUT;
			request.put("notice", list.get(0));
			return SUCCESS;
		}
		return INPUT;
	}

	/**
	 * 
	 * @param notice
	 */
	public String topNotice() {
		if (tid != null && tid > 0) {
			List list = nBiz.getNoticebyTid(tid);
			Notice notice = (Notice) list.get(0);
			nBiz.setTopNotice(notice);
			seriesId = notice.getSeries().getSeriesId();
			return SUCCESS;
		}
		return INPUT;
	}

	public String cancelNotice() {
		if (tid != null && tid > 0) {
			List list = nBiz.getNoticebyTid(tid);
			Notice notice = (Notice) list.get(0);
			nBiz.cancelNotice(notice);
			seriesId = notice.getSeries().getSeriesId();
			return SUCCESS;
		}
		return INPUT;
	}

	public String deleteNotice() {
		if (tid != null && tid > 0) {
			List list = nBiz.getNoticebyTid(tid);
			Notice notice = (Notice) list.get(0);
			nBiz.deleteNotice(notice);
			seriesId = notice.getSeries().getSeriesId();
		}
		return SUCCESS;
	}

	public String reset() {
		if (tid != null && tid > 0) {
			List list = nBiz.getNoticebyTid(tid);
			Notice notice = (Notice) list.get(0);
			nBiz.reset(notice);
			seriesId = notice.getSeries().getSeriesId();
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String search(){
		if( null == keyword || "".equals(keyword.trim())){
			return ERROR;
		}
		List list = nBiz.search(keyword);
		request.put("notice", list);
		return SUCCESS;
	}

	/******************* getter & setter *************************/
	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public Notice getNotice() {
		return notice;
	}

	public void setnBiz(NoticeBiz nBiz) {
		this.nBiz = nBiz;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setuBiz(UserBiz uBiz) {
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getSeriesId() {
		return seriesId;
	}

	public void setSeriesId(Integer seriesId) {
		this.seriesId = seriesId;
	}

	public SeriesBiz getSeriesBiz() {
		return seriesBiz;
	}

	public void setSeriesBiz(SeriesBiz seriesBiz) {
		this.seriesBiz = seriesBiz;
	}
}
