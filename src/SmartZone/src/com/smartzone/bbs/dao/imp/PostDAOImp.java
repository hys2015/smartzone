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

import com.smartzone.bbs.dao.PostDAO;
import com.smartzone.bbs.entity.Post;

/**
 * A data access object (DAO) providing persistence and search support for Post
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.smartzone.bbs.entity.Post
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class PostDAOImp implements PostDAO {
	private static final Logger log = LoggerFactory.getLogger(PostDAOImp.class);

	private SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#setSessionFactory(org.hibernate.SessionFactory)
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
	 * @see com.smartzone.bbs.dao.imp.PostDAO#save(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public int save(Post transientInstance) {
		log.debug("saving Post instance");
		try {
			getCurrentSession().saveOrUpdate(transientInstance);
			log.debug("save successful");
			return transientInstance.getPostId();
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#delete(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public void delete(Post persistentInstance) {
		log.debug("deleting Post instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#findById(java.lang.Integer)
	 */
	@Override
	public Post findById(java.lang.Integer id) {
		log.debug("getting Post instance with id: " + id);
		try {
			Post instance = (Post) getCurrentSession().get(
					"com.smartzone.bbs.entity.Post", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#findByExample(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public List findByExample(Post instance) {
		log.debug("finding Post instance by example");
		try {
			List results = getCurrentSession()
					.createCriteria("com.smartzone.bbs.entity.Post")
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
	 * @see com.smartzone.bbs.dao.imp.PostDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@Override
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Post instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Post as model where model."
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
	 * @see com.smartzone.bbs.dao.imp.PostDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Post instances");
		try {
			String queryString = "from Post";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#merge(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public Post merge(Post detachedInstance) {
		log.debug("merging Post instance");
		try {
			Post result = (Post) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#attachDirty(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public void attachDirty(Post instance) {
		log.debug("attaching dirty Post instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.smartzone.bbs.dao.imp.PostDAO#attachClean(com.smartzone.bbs.entity.Post)
	 */
	@Override
	public void attachClean(Post instance) {
		log.debug("attaching clean Post instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PostDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PostDAO) ctx.getBean("PostDAO");
	}

	@Override
	public int getCountOf(Post instance) {
		Session session=sessionFactory.getCurrentSession();
		Criteria c=session.createCriteria(Post.class);
		if(instance != null){
			if(instance.getBoard() != null)
				c.add(Restrictions.eq("board.id", instance.getBoard().getBoardId()));
		}
		return c.list().size();
	}

	@Override
	public int getCountOnProperty(String propertyname, String value) {
		log.debug("getCountofPostOnProperty propertyname:" + propertyname + " value=" + value);
		String hql = "select count(s) from Post s where s."+propertyname+"=? order by s.postReplytime desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		Integer count = null;
		count = Integer.parseInt(query.uniqueResult().toString());
		log.debug("count: " + count);
		return count;
	}

	@Override
	public List getPageredPostOnProperty(int curPage, int size, String propertyName ,String value) {
		log.debug("getPagerOfPostOnProperty curPage:"+ curPage +",size:" + size + ",propertyName:" + propertyName + " value:"+value);
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Post s where s."+propertyName+"=? order by s.postReplytime desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		query.setMaxResults(size);
		query.setFirstResult((curPage-1)*size);
		log.debug("getPagerOfPostOnProperty getting list");
		return query.list();
	}

	@Override
	public List getHotPost(int bid) {
		log.debug("getHotPost boardid:"+ bid);
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Post s where s.board.boardId=? order by s.postReplytimes desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger(0,bid);
		query.setMaxResults(10);
		log.debug("getHotPost getting list");
		return query.list();
	}

	@Override
	public List findLastPost(String propertyName,Object value,int num) {
		log.debug("finding last "+ num +" Post instance ");
		try {
			String queryString = "from Post as model where model."
					+ propertyName + "= ? order by model.postCreatetime desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			queryObject.setMaxResults(num);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
}