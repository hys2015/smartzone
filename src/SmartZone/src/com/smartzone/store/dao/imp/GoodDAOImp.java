package com.smartzone.store.dao.imp;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.smartzone.store.dao.GoodDAO;
import com.smartzone.store.entity.Good;

/**
 * A data access object (DAO) providing persistence and search support for Good
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.smartzone.store.entity.Good
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class GoodDAOImp implements GoodDAO {
	private static final Logger log = LoggerFactory.getLogger(GoodDAOImp.class);

	private SessionFactory sessionFactory;

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
	 * @see com.smartzone.store.dao.imp.GoodDAO#save(com.smartzone.store.entity.Good)
	 */
	@Override
	public void save(Good transientInstance) {
		log.debug("saving Good instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.GoodDAO#delete(com.smartzone.store.entity.Good)
	 */
	@Override
	public void delete(Good persistentInstance) {
		log.debug("deleting Good instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.GoodDAO#findById(java.lang.Integer)
	 */
	@Override
	public Good findById(java.lang.Integer id) {
		log.debug("getting Good instance with id: " + id);
		try {
			Good instance = (Good) getCurrentSession().get(
					"com.smartzone.store.entity.Good", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.GoodDAO#findByExample(com.smartzone.store.entity.Good)
	 */
	@Override
	public List findByExample(Good instance) {
		log.debug("finding Good instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.store.entity.Good")
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
	 * @see com.smartzone.store.dao.imp.GoodDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Good instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Good as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	@Override
	public List findVisibleByProperty(String propertyName, Integer value) {
		log.debug("finding Good instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Good as model where model."
					+ propertyName + "= ? and model.visible = 1";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.GoodDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Good instances");
		try {
			String queryString = "from Good";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Good merge(Good detachedInstance) {
		log.debug("merging Good instance");
		try {
			Good result = (Good) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Good instance) {
		log.debug("attaching dirty Good instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Good instance) {
		log.debug("attaching clean Good instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodDAO) ctx.getBean("GoodDAO");
	}

	@Override
	public List findLastOnShelf(Integer communityno, int num) {
		log.debug("finding last " + num +"onshelf Good instances");
		try {
			String queryString = "from Good g "
					+ "where g.category.shop.user.community.communityno = ? "
					+ "and g.visible = 1 order by g.onshelftime desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, communityno);
			queryObject.setMaxResults(num);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find failed", re);
			throw re;
		}
	}
}