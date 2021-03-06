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

import com.smartzone.info.dao.CommunityDAO;
import com.smartzone.info.entity.Community;

/**
 	* A data access object (DAO) providing persistence and search support for Community entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.Community
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class CommunityDAOImp implements CommunityDAO  {
	     private static final Logger log = LoggerFactory.getLogger(CommunityDAOImp.class);
	

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
	 * @see com.smartzone.info.dao.imp.CommunityDAO#save(com.smartzone.info.entity.Community)
	 */
    @Override
	public void save(Community transientInstance) {
        log.debug("saving Community instance");
        try {
            getCurrentSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CommunityDAO#delete(com.smartzone.info.entity.Community)
	 */
	@Override
	public void delete(Community persistentInstance) {
        log.debug("deleting Community instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Community findById( java.lang.Integer id) {
        log.debug("getting Community instance with id: " + id);
        try {
            Community instance = (Community) getCurrentSession()
                    .get("com.smartzone.info.entity.Community", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CommunityDAO#findByExample(com.smartzone.info.entity.Community)
	 */
    @Override
	public List findByExample(Community instance) {
        log.debug("finding Community instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.Community") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CommunityDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Community instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Community as model where model." 
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
	 * @see com.smartzone.info.dao.imp.CommunityDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Community instances");
		try {
			String queryString = "from Community";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Community merge(Community detachedInstance) {
        log.debug("merging Community instance");
        try {
            Community result = (Community) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Community instance) {
        log.debug("attaching dirty Community instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Community instance) {
        log.debug("attaching clean Community instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CommunityDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CommunityDAO) ctx.getBean("CommunityDAO");
	}
}