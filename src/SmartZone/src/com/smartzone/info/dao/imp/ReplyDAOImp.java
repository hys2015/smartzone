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

import com.smartzone.info.dao.ReplyDAO;
import com.smartzone.info.entity.ReplyToFeed;

/**
 	* A data access object (DAO) providing persistence and search support for ReplyToFeed entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.ReplyToFeedToFeed
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class ReplyDAOImp implements ReplyDAO  {
	     private static final Logger log = LoggerFactory.getLogger(ReplyDAOImp.class);
	

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
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#save(com.smartzone.info.entity.ReplyToFeed)
	 */
    @Override
	public void save(ReplyToFeed transientInstance) {
        log.debug("saving ReplyToFeed instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#delete(com.smartzone.info.entity.ReplyToFeed)
	 */
	@Override
	public void delete(ReplyToFeed persistentInstance) {
        log.debug("deleting ReplyToFeed instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public ReplyToFeed findById( java.lang.Integer id) {
        log.debug("getting ReplyToFeed instance with id: " + id);
        try {
        	ReplyToFeed instance = (ReplyToFeed) getCurrentSession()
                    .get("com.smartzone.info.entity.ReplyToFeed", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#findByExample(com.smartzone.info.entity.ReplyToFeed)
	 */
    @Override
	public List findByExample(ReplyToFeed instance) {
        log.debug("finding ReplyToFeed instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.ReplyToFeed") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding ReplyToFeed instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from ReplyToFeed as model where model." 
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
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all ReplyToFeed instances");
		try {
			String queryString = "from ReplyToFeed";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.ReplyToFeedDAO#merge(com.smartzone.info.entity.ReplyToFeed)
	 */
    @Override
	public ReplyToFeed merge(ReplyToFeed detachedInstance) {
        log.debug("merging ReplyToFeed instance");
        try {
        	ReplyToFeed result = (ReplyToFeed) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(ReplyToFeed instance) {
        log.debug("attaching dirty ReplyToFeed instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(ReplyToFeed instance) {
        log.debug("attaching clean ReplyToFeed instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ReplyDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ReplyDAO) ctx.getBean("ReplyDAO");
	}
}