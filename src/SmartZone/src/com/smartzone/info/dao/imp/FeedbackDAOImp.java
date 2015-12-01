package com.smartzone.info.dao.imp;

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

import com.smartzone.info.dao.FeedbackDAO;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Notice;

/**
 	* A data access object (DAO) providing persistence and search support for Feedback entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.Feedback
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class FeedbackDAOImp implements FeedbackDAO  {
	     private static final Logger log = LoggerFactory.getLogger(FeedbackDAOImp.class);
	

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory){
       this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession(){
     return sessionFactory.getCurrentSession(); 
    }
	protected void initDao() {
		//do nothing
	}
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#save(com.smartzone.info.entity.Feedback)
	 */
    @Override
	public void save(Feedback transientInstance) {
        log.debug("saving Feedback instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#delete(com.smartzone.info.entity.Feedback)
	 */
	@Override
	public void delete(Feedback persistentInstance) {
        log.debug("deleting Feedback instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#findById(java.lang.Integer)
	 */
    @Override
	public Feedback findById( java.lang.Integer id) {
        log.debug("getting Feedback instance with id: " + id);
        try {
            Feedback instance = (Feedback) getCurrentSession()
                    .get("com.smartzone.info.entity.Feedback", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#findByExample(com.smartzone.info.entity.Feedback)
	 */
    @Override
	public List findByExample(Feedback instance) {
        log.debug("finding Feedback instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.Feedback") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Feedback instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Feedback as model where model." 
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
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Feedback instances");
		try {
			String queryString = "from Feedback order by fno desc";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.FeedbackDAO#merge(com.smartzone.info.entity.Feedback)
	 */
    @Override
	public Feedback merge(Feedback detachedInstance) {
        log.debug("merging Feedback instance");
        try {
            Feedback result = (Feedback) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Feedback instance) {
        log.debug("attaching dirty Feedback instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Feedback instance) {
        log.debug("attaching clean Feedback instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static FeedbackDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (FeedbackDAO) ctx.getBean("FeedbackDAO");
	}

	@Override
	public int getCountofFeedbackOnProperty(String propertyname, String value) {
		log.debug("getCountofFeedbackOnProperty propertyname:" + propertyname + " value=" + value);
		String hql = "select count(s) from Feedback s where s."+propertyname+"=? order by s.ftime desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		Integer count = null;
		count = Integer.parseInt(query.uniqueResult().toString());
		log.debug("count: " + count);
		return count;
	}

	@Override
	public List getPagerCommunityFeedbackOnProperty(int curPage, int size, String propertyName ,String value) {
		log.debug("getPagerCommunityFeedbackOnProperty curPage:"+ curPage +",size:" + size + ",propertyName:" + propertyName + " value:"+value);
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Feedback s where s."+propertyName+"=? order by s.ftime desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0,value);
		query.setMaxResults(size);
		query.setFirstResult((curPage-1)*size);
		log.debug("getPagerCommunityFeedbackOnProperty getting list");
		return query.list();
	}
}