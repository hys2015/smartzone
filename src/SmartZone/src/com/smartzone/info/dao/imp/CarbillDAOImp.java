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

import com.smartzone.info.dao.CarbillDAO;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.Carbill;
import com.smartzone.info.entity.User;

/**
 	* A data access object (DAO) providing persistence and search support for Carbill entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.Carbill
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class CarbillDAOImp implements CarbillDAO  {
	     private static final Logger log = LoggerFactory.getLogger(CarbillDAOImp.class);
	

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
	 * @see com.smartzone.info.dao.imp.CarbillDAO#save(com.smartzone.info.entity.Carbill)
	 */
    @Override
	public void save(Carbill transientInstance) {
        log.debug("saving Carbill instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarbillDAO#delete(com.smartzone.info.entity.Carbill)
	 */
	@Override
	public void delete(Carbill persistentInstance) {
        log.debug("deleting Carbill instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarbillDAO#findById(java.lang.Integer)
	 */
    @Override
	public Carbill findById( java.lang.Integer id) {
        log.debug("getting Carbill instance with id: " + id);
        try {
            Carbill instance = (Carbill) getCurrentSession()
                    .get("com.smartzone.info.entity.Carbill", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Carbill instance) {
        log.debug("finding Carbill instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.Carbill") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarbillDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Carbill instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Carbill as model where model." 
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
	 * @see com.smartzone.info.dao.imp.CarbillDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Carbill instances");
		try {
			String queryString = "from Carbill";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Carbill merge(Carbill detachedInstance) {
        log.debug("merging Carbill instance");
        try {
            Carbill result = (Carbill) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Carbill instance) {
        log.debug("attaching dirty Carbill instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Carbill instance) {
        log.debug("attaching clean Carbill instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CarbillDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CarbillDAO) ctx.getBean("CarbillDAO");
	}

	@Override
	public List findByCarportAndUser(int id, String username) {
		log.debug("finding Carbill instance with carportid: " + id
	            + ", username: " + username);
	      try {
	         String queryString = "from Carbill as model where model.carport.carportId=?"
	         		+ " and model.user.username=? and model.ispayed = 1 order by model.bid desc"; 
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 queryObject.setParameter(0, id);
			 queryObject.setParameter(1, username);
			 return queryObject.list();
	      } catch (RuntimeException re) {
	         log.error("find by carportid and username name failed", re);
	         throw re;
	      }
	}

	@Override
	public List getUserUnpayedOrPayedBill(String username, int payed) {
		log.debug("getUserUnpayedBill username: " + username);
	      try {
	         String queryString = "from Carbill as model where "
	         		+ " model.user.username=? and model.ispayed = ? order by model.bid desc"; 
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 queryObject.setParameter(0, username);
			 queryObject.setParameter(1, payed);
			 return queryObject.list();
	      } catch (RuntimeException re) {
	         log.error("getUserUnpayedBill failed", re);
	         throw re;
	      }
	}
}