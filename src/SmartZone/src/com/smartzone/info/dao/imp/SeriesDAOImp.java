package com.smartzone.info.dao.imp;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smartzone.info.dao.SeriesDAO;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Series;

public class SeriesDAOImp implements SeriesDAO{
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	SessionFactory sessionFactory;
	
	public List findAll(){
		log.debug("findAll");
		String hql = "from Series s order by s.seriesId asc";
		return getSessionFactory().getCurrentSession().createQuery(hql).list();
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public List findByProperty(String propertyName, Object value){
		log.debug("finding Series instance with property: " + propertyName
	            + ", value: " + value);
	      try {
	         String queryString = "from Series as model where model." 
	         						+ propertyName + "= ?";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 queryObject.setParameter(0, value);
			 return queryObject.list();
	      } catch (RuntimeException re) {
	         log.error("find by property name failed", re);
	         throw re;
	      }
	}

	private SharedSessionContract getCurrentSession() {
		return getSessionFactory().getCurrentSession();
	}

	@Override
	public List findAll(int commNo){
		log.debug("findAll on commNo:"+ commNo);
		String hql = "from Series s where s.community.communityno=? order by s.seriesId asc";
		return getSessionFactory().getCurrentSession()
				.createQuery(hql)
				.setInteger(0, commNo)
				.list();
	}

	@Override
	public Series findById(Integer id) {
		log.debug("getting Series instance with id: " + id);
        try {
            Series instance = (Series) getSessionFactory().getCurrentSession()
                    .get("com.smartzone.info.entity.Series", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
	}

	@Override
	public void saveOrUpdate(Series s) {
		log.debug("saving Series instance");
        try {
            getSessionFactory().getCurrentSession().saveOrUpdate(s);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
	}

	@Override
	public void delete(Series s) {
		log.debug("deleting Series instance");
        try {
            getSessionFactory().getCurrentSession().delete(s);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
	}

}
