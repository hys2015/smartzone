package com.smartzone.info.dao.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.smartzone.info.dao.NoticeDAO;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Notice;

public class NoticeDAOImp implements NoticeDAO {
	
	Logger log = LoggerFactory.getLogger(NoticeDAOImp.class);
	
	SessionFactory sessionFactory ;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Override
	public List getAllNotices(int page, int size) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Notice.class);
		c.addOrder(Order.desc("valiable"));
		c.addOrder(Order.desc("priority"));
		c.addOrder(Order.desc("createtime"));
//		c.add(Restrictions.gt("valiable", 0));
		c.setFirstResult((page-1)*size);
		c.setMaxResults(size);
		return c.list();
	}
	
	@Override
	public List getAllCommunityNotices(int page, int size, int commNo, int seriesId) {
		log.debug("getAllCommunityNotices page:"+page+",size:"+size+",commNo:"+commNo+",seriesId"+seriesId);
		Criteria c = getCurrentSession().createCriteria(Notice.class);
		c.addOrder(Order.desc("valiable"));
		c.addOrder(Order.desc("priority"));
		c.addOrder(Order.desc("createtime"));
		c.add(Restrictions.eq("communityno", commNo));
		c.add(Restrictions.eq("series.seriesId", seriesId));
		c.setFirstResult((page-1)*size);
		c.setMaxResults(size);
		return c.list();
	}

	@Override
	public boolean saveNotice(Notice notice){
		boolean ret = false;
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(notice);
			session.flush();
			session.evict(notice);
			ret = true;
		} catch (RuntimeException re) {
			log.debug("save Notice failed");
			log.error(re.toString());;
			throw re;
		}
		return ret;
	}

	@Override
	public Integer getCountofNotice() {
		Integer count = null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(s) from Notice s";
		Query query = session.createQuery(hql);
		count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	
	@Override
	public Integer getCountofCommunityNotice(int commNo ,int seriesId){
		String hql = "select count(s) from Notice s where s.communityno=? and s.series.seriesId=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,commNo);
		query.setInteger(1,seriesId);
		Integer count = null;
		count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public  Notice searchByTid(int id) {
		log.debug("getting Feedback instance with id: " + id);
        try {
            Notice instance = (Notice) getCurrentSession()
                    .get("com.smartzone.info.entity.Notice", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
	}

	@Override
	public boolean updateNotice(Notice notice) {
		boolean ret = false;
		Session session = sessionFactory.getCurrentSession();
		session.update(notice);
		session.flush();
		session.evict(notice);
		ret = true;
		return ret;
	}

	@Override
	public List searchTopNotice() {
		List list = null;
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Notice.class);
		c.add(Restrictions.eq("priority", Notice.TOP_PRIORITY));
		list = c.list();
		return list;
	}

	@Override
	public boolean deleteNotice(Notice notice) {
		boolean ret = false;
		List list = null;
		Session session = sessionFactory.getCurrentSession();
		session.delete(notice);
		ret = true;
		return ret;
	}


	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}


	@Override
	public List searchOnProperty(String propertyName, String keyword) {
		log.debug("searchOnProperty property:"+ propertyName + " keyword:"+ keyword);
		String hql = "from Notice m where m."+propertyName +" like ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, "%"+keyword+"%");
		log.debug(query.getQueryString());
		return query.list();
	}


	@Override
	public List findLastOnProperty(String propertyName, Object value, int num) {
		log.debug("searchOnProperty property:"+ propertyName + " keyword:"+ value);
		try {
			String hql = "from Notice m where m."+propertyName +" = ? order by createtime desc";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter(0, value);
			query.setMaxResults(num);
			log.debug(query.getQueryString());
			return query.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
	        throw re;
		}
	}
}
