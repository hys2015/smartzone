package com.smartzone.info.biz.imp;

import java.util.List;

import com.smartzone.info.biz.SeriesBiz;
import com.smartzone.info.dao.SeriesDAO;
import com.smartzone.info.entity.Series;

public class SeriesBizImp implements SeriesBiz {
	
	SeriesDAO seriesdao;
	
	/* (non-Javadoc)
	 * @see com.smartzone.info.biz.imp.SeriesBiz#findAll()
	 */
	@Override
	public List findAll(){
		return seriesdao.findAll();
	}

	public SeriesDAO getSeriesdao() {
		return seriesdao;
	}

	public void setSeriesdao(SeriesDAO seriesdao) {
		this.seriesdao = seriesdao;
	}

	@Override
	public List findAll(int commNo) {
		return seriesdao.findAll(commNo);
	}

	@Override
	public Series findById(Integer seriesId) {
		return seriesdao.findById(seriesId);
	}

	@Override
	public void update(Series s) {
		seriesdao.saveOrUpdate(s);
	}

	@Override
	public void add(Series series) {
		seriesdao.saveOrUpdate(series);
	}

	@Override
	public void delete(Series series) {
		seriesdao.delete(series);
	}

	@Override
	public Series findByName(String seriesName) {
		List list =  seriesdao.findByProperty("seriesName", seriesName);
		if(list != null && list.size() > 0){
			return (Series) list.get(0);
		}
		return null;
	}
}
