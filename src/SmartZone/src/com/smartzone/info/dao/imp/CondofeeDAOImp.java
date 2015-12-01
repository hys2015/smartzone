package com.smartzone.info.dao.imp;

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

import com.smartzone.info.dao.CondofeeDAO;
import com.smartzone.info.entity.Condofee;

/**
 * A data access object (DAO) providing persistence and search support for
 * Condofee entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.smartzone.info.entity.Condofee
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class CondofeeDAOImp implements CondofeeDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CondofeeDAOImp.class);

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
	 * @see com.smartzone.info.dao.imp.CondofeeDAO#save(com.smartzone.info.entity.Condofee)
	 */
	@Override
	public void save(Condofee transientInstance) {
		log.debug("saving Condofee instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CondofeeDAO#delete(com.smartzone.info.entity.Condofee)
	 */
	@Override
	public void delete(Condofee persistentInstance) {
		log.debug("deleting Condofee instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CondofeeDAO#findById(java.lang.String)
	 */
	@Override
	public Condofee findById(java.lang.String id) {
		log.debug("getting Condofee instance with id: " + id);
		try {
			Condofee instance = (Condofee) getCurrentSession().get(
					"com.smartzone.info.entity.Condofee", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Condofee instance) {
		log.debug("finding Condofee instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.info.entity.Condofee")
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
	 * @see com.smartzone.info.dao.imp.CondofeeDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Condofee instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Condofee as model where model."
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
	 * @see com.smartzone.info.dao.imp.CondofeeDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Condofee instances");
		try {
			String queryString = "from Condofee";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Condofee merge(Condofee detachedInstance) {
		log.debug("merging Condofee instance");
		try {
			Condofee result = (Condofee) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Condofee instance) {
		log.debug("attaching dirty Condofee instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Condofee instance) {
		log.debug("attaching clean Condofee instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CondofeeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CondofeeDAO) ctx.getBean("CondofeeDAO");
	}
}