package com.smartzone.bbs.dao.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.smartzone.bbs.dao.ReplyDAO;
import com.smartzone.bbs.entity.Reply;

/**
 * A data access object (DAO) providing persistence and search support for Reply
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.smartzone.bbs.entity.Reply
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ReplyDAOImp implements ReplyDAO {
	private static final Logger log = LoggerFactory.getLogger(ReplyDAOImp.class);

	private SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#setSessionFactory(org.hibernate.SessionFactory)
	 */
	@Override
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#save(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public void save(Reply transientInstance) {
		log.debug("saving Reply instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#delete(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public void delete(Reply persistentInstance) {
		log.debug("deleting Reply instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#findById(java.lang.Integer)
	 */
	@Override
	public Reply findById(java.lang.Integer id) {
		log.debug("getting Reply instance with id: " + id);
		try {
			Reply instance = (Reply) getCurrentSession().get(
					"com.smartzone.bbs.entity.Reply", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#findByExample(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public List findByExample(Reply instance) {
		log.debug("finding Reply instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.bbs.entity.Reply")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Reply instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Reply as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Reply instances");
		try {
			String queryString = "from Reply";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#merge(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public Reply merge(Reply detachedInstance) {
		log.debug("merging Reply instance");
		try {
			Reply result = (Reply) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#attachDirty(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public void attachDirty(Reply instance) {
		log.debug("attaching dirty Reply instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.ReplyDAO#attachClean(com.smartzone.bbs.entity.Reply)
	 */
	@Override
	public void attachClean(Reply instance) {
		log.debug("attaching clean Reply instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ReplyDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ReplyDAO) ctx.getBean("ReplyDAO");
	}


	@Override
	public int getCountOnProperty(String propertyname, String value) {
		log.debug("getCountofbbsRepliesOnProperty propertyname:" + propertyname + " value=" + value);
		String hql = "select count(s) from Reply s where s."+propertyname+"=? order by s.idx asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		Integer count = null;
		count = Integer.parseInt(query.uniqueResult().toString());
		log.debug("count: " + count);
		return count;
	}

	@Override
	public List getPageredRepliesOnProperty(int curPage, int size, String propertyName ,String value) {
		log.debug("getPagerbbsRepliesOfPostOnProperty curPage:"+ curPage +",size:" + size + ",propertyName:" + propertyName + " value:"+value);
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Reply s where s."+propertyName+"=? order by s.idx asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		query.setMaxResults(size);
		query.setFirstResult((curPage-1)*size);
		log.debug("getPagerbbsRepliesOfPostOnProperty getting list");
		return query.list();
	}

	@Override
	public List getReplyStar() {
		log.debug("getReplyStar");
		Session session = sessionFactory.getCurrentSession();
		String hql = "select s.user from Reply s group by s.user.username order by count(*)";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setMaxResults(10);
		log.debug("getReplyStar getting list");
		return query.list();
	}
	
	
}