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

import com.smartzone.store.dao.ShopDAO;
import com.smartzone.store.entity.Shop;

/**
 	* A data access object (DAO) providing persistence and search support for Shop entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.store.dao.imp.Shop
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class ShopDAOImp implements ShopDAO  {
	     private static final Logger log = LoggerFactory.getLogger(ShopDAOImp.class);
	

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
	 * @see com.smartzone.store.dao.imp.ShopDAO#save(com.smartzone.store.entity.Shop)
	 */
    @Override
	public void save(Shop transientInstance) {
        log.debug("saving Shop instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.ShopDAO#delete(com.smartzone.store.entity.Shop)
	 */
	@Override
	public void delete(Shop persistentInstance) {
        log.debug("deleting Shop instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.ShopDAO#findById(java.lang.Integer)
	 */
    @Override
	public Shop findById( java.lang.Integer id) {
        log.debug("getting Shop instance with id: " + id);
        try {
            Shop instance = (Shop) getCurrentSession()
                    .get("com.smartzone.store.entity.Shop", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.ShopDAO#findByExample(com.smartzone.store.entity.Shop)
	 */
    @Override
	public List findByExample(Shop instance) {
        log.debug("finding Shop instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.store.entity.Shop") .add(Example.create(instance).enableLike()).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.ShopDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Shop instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Shop as model where model." 
         						+ propertyName + "= ? order by model.sid";
         Query queryObject = getCurrentSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	@Override
	public List findVisibleByProperty(String propertyName, int value) {
		log.debug("finding visible Shop instance with property: " + propertyName
	            + ", value: " + value);
	      try {
	         String queryString = "from Shop as model where model." 
	         						+ propertyName + "= ? and model.visible = 1 order by model.sid";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 queryObject.setParameter(0, value);
			 return queryObject.list();
	      } catch (RuntimeException re) {
	         log.error("find by property name failed", re);
	         throw re;
	      }
	}

	/* (non-Javadoc)
	 * @see com.smartzone.store.dao.imp.ShopDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Shop instances");
		try {
			String queryString = "from Shop";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Shop merge(Shop detachedInstance) {
        log.debug("merging Shop instance");
        try {
            Shop result = (Shop) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Shop instance) {
        log.debug("attaching dirty Shop instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Shop instance) {
        log.debug("attaching clean Shop instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ShopDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ShopDAO) ctx.getBean("ShopDAO");
	}
}