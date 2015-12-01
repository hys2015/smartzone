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

import com.smartzone.store.dao.OrderDAO;
import com.smartzone.store.entity.Order;

/**
 * A data access object (DAO) providing persistence and search support for Order
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.smartzone.store.entity.Order
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class OrderDAOImp implements OrderDAO {
	private static final Logger log = LoggerFactory.getLogger(OrderDAOImp.class);

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
	 * @see com.smartzone.store.dao.imp.OrderDAO#save(com.smartzone.store.entity.Order)
	 */
	@Override
	public Integer save(Order transientInstance) {
		log.debug("saving Order instance");
		Integer id = null;
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			id = transientInstance.getOid();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		return id;
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.OrderDAO#delete(com.smartzone.store.entity.Order)
	 */
	@Override
	public void delete(Order persistentInstance) {
		log.debug("deleting Order instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.OrderDAO#findById(java.lang.Integer)
	 */
	@Override
	public Order findById(java.lang.Integer id) {
		log.debug("getting Order instance with id: " + id);
		try {
			Order instance = (Order) getCurrentSession().get(
					"com.smartzone.store.entity.Order", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.OrderDAO#findByExample(com.smartzone.store.entity.Order)
	 */
	@Override
	public List findByExample(Order instance) {
		log.debug("finding Order instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.store.entity.Order")
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
	 * @see com.smartzone.store.dao.imp.OrderDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Order instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Order as model where model."
					+ propertyName + "= ? and model.visible = 1 order by model.updatetime desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.OrderDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Order instances");
		try {
			String queryString = "from Order";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Order merge(Order detachedInstance) {
		log.debug("merging Order instance");
		try {
			Order result = (Order) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Order instance) {
		log.debug("attaching dirty Order instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Order instance) {
		log.debug("attaching clean Order instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OrderDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OrderDAO) ctx.getBean("OrderDAO");
	}
}