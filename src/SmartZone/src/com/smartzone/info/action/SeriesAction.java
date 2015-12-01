package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.NoticeBiz;
import com.smartzone.info.biz.SeriesBiz;
import com.smartzone.info.entity.Community;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Series;
import com.smartzone.info.entity.User;

public class SeriesAction extends ActionSupport implements RequestAware, SessionAware{
	
	private Series series;
	private SeriesBiz seriesBiz;
	private NoticeBiz noticeBiz;
	private Map<String, Object > request;
	private Map<String, Object > session;
	
	public String getAll(){
		int commNo = ((User)LoginCheckData.getInstance(session).getObj()).getCommunity().getCommunityno();
		List list = seriesBiz.findAll(commNo);
		request.put("series", list);
		return SUCCESS;
	}
	
	public String add(){
		if(series.getSeriesName() == null || "".equals(series.getSeriesName().trim())){
			return ERROR;
		}
		Series s = seriesBiz.findByName(series.getSeriesName());
		if(s != null){
			session.put("message","分类名"+series.getSeriesName()+"已存在，请添加其他名称");
			return INPUT;
		}
		Community comm = ((User)LoginCheckData.getInstance(session).getObj()).getCommunity();
		series.setCommunity(comm);
		seriesBiz.add(series);
		session.put("message","添加成功");
		return SUCCESS;
	}
	
	public String toAdd(){
		return getAll();
	}
	
	public String delete(){
		if(series.getSeriesId() == null){
			return ERROR;
		}
		seriesBiz.delete(series);
		session.put("message", "删除成功");
		return SUCCESS;
	}
	
	public String update(){
		
		if(series == null || series.getSeriesId() == null){
			return ERROR;
		}
		Series s = seriesBiz.findById(series.getSeriesId());
		s.setSeriesName(series.getSeriesName());
		seriesBiz.update(s);
		return SUCCESS;
	}
	
	public String seriesPane(){
		
		if(series == null || series.getSeriesId() == null){
			return ERROR;
		}
		int commNo = LoginCheckData.getInstance(session).getCommNo();
		List list = noticeBiz.getNotice(0, 5, commNo, series.getSeriesId());
		request.put("notices",list);
		return SUCCESS;
	}
	
	public Series getSeries() {
		return series;
	}

	public void setSeries(Series series) {
		this.series = series;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public SeriesBiz getSeriesBiz() {
		return seriesBiz;
	}

	public void setSeriesBiz(SeriesBiz seriesBiz) {
		this.seriesBiz = seriesBiz;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setNoticeBiz(NoticeBiz noticeBiz) {
		this.noticeBiz = noticeBiz;
	}
}
