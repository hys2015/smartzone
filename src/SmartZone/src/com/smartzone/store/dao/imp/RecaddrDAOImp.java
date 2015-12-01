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

import com.smartzone.store.dao.RecaddrDAO;
import com.smartzone.store.entity.Recaddr;

/**
 * A data access object (DAO) providing persistence and search support for
 * Recaddr entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.smartzone.store.entity.Recaddr
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class RecaddrDAOImp implements RecaddrDAO {
	private static final Logger log = LoggerFactory.getLogger(RecaddrDAOImp.class);

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
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#save(com.smartzone.store.entity.Recaddr)
	 */
	@Override
	public void save(Recaddr transientInstance) {
		log.debug("saving Recaddr instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#delete(com.smartzone.store.entity.Recaddr)
	 */
	@Override
	public void delete(Recaddr persistentInstance) {
		log.debug("deleting Recaddr instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#findById(java.lang.Integer)
	 */
	@Override
	public Recaddr findById(java.lang.Integer id) {
		log.debug("getting Recaddr instance with id: " + id);
		try {
			Recaddr instance = (Recaddr) getCurrentSession().get(
					"com.smartzone.store.entity.Recaddr", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#findByExample(com.smartzone.store.entity.Recaddr)
	 */
	@Override
	public List findByExample(Recaddr instance) {
		log.debug("finding Recaddr instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.store.entity.Recaddr")
					.add(Example.create(instance).excludeNone()).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Recaddr instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Recaddr as model where model."
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
	 * @see com.smartzone.store.dao.imp.RecaddrDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Recaddr instances");
		try {
			String queryString = "from Recaddr";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Recaddr merge(Recaddr detachedInstance) {
		log.debug("merging Recaddr instance");
		try {
			Recaddr result = (Recaddr) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Recaddr instance) {
		log.debug("attaching dirty Recaddr instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Recaddr instance) {
		log.debug("attaching clean Recaddr instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RecaddrDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RecaddrDAO) ctx.getBean("RecaddrDAO");
	}

	@Override
	public List findByPropertyVisible(String propertyName, String value) {
		log.debug("finding visible Recaddr instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Recaddr as model where model."
					+ propertyName + "= ? and model.visible = true"
							+ " order by model.lastusetime desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}