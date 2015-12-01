package com.smartzone.bbs.dao.imp;

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

import com.smartzone.bbs.dao.BoardDAO;
import com.smartzone.bbs.entity.Board;

/**
 * A data access object (DAO) providing persistence and search support for Board
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.smartzone.bbs.entity.Board
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class BoardDAOImp implements BoardDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImp.class);

	private SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#setSessionFactory(org.hibernate.SessionFactory)
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
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#save(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public void save(Board transientInstance) {
		log.debug("saving Board instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#delete(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public void delete(Board persistentInstance) {
		log.debug("deleting Board instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#findById(java.lang.Integer)
	 */
	@Override
	public Board findById(java.lang.Integer id) {
		log.debug("getting Board instance with id: " + id);
		try {
			Board instance = (Board) getCurrentSession().get(
					"com.smartzone.bbs.entity.Board", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#findByExample(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public List findByExample(Board instance) {
		log.debug("finding Board instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.bbs.entity.Board")
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
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Board instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Board as model where model."
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
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Board instances");
		try {
			String queryString = "from Board";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#merge(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public Board merge(Board detachedInstance) {
		log.debug("merging Board instance");
		try {
			Board result = (Board) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#attachDirty(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public void attachDirty(Board instance) {
		log.debug("attaching dirty Board instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.BoardDAO#attachClean(com.smartzone.bbs.entity.Board)
	 */
	@Override
	public void attachClean(Board instance) {
		log.debug("attaching clean Board instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BoardDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BoardDAO) ctx.getBean("BoardDAO");
	}
}