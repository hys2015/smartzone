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

import com.smartzone.info.dao.AdminDAO;
import com.smartzone.info.entity.Administor;

/**
 	* A data access object (DAO) providing persistence and search support for Administor entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.Administor
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class AdminDAOImp  implements AdminDAO{
	     private static final Logger log = LoggerFactory.getLogger(AdminDAOImp.class);
	

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
    
    public void save(Administor transientInstance) {
        log.debug("saving Administor instance");
        try {
        	getCurrentSession().clear();
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Administor persistentInstance) {
        log.debug("deleting Administor instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Administor findById( java.lang.String id) {
        log.debug("getting Administor instance with id: " + id);
        try {
            Administor instance = (Administor) getCurrentSession()
                    .get("com.smartzone.info.entity.Administor", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Administor instance) {
        log.debug("finding Administor instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.Administor") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    @Override
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Administor instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Administor as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getCurrentSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Administor instances");
		try {
			String queryString = "from Administor";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Administor merge(Administor detachedInstance) {
        log.debug("merging Administor instance");
        try {
            Administor result = (Administor) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Administor instance) {
        log.debug("attaching dirty Administor instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Administor instance) {
        log.debug("attaching clean Administor instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static AdminDAOImp getFromApplicationContext(ApplicationContext ctx) {
    	return (AdminDAOImp) ctx.getBean("adminDAO");
	}

	@Override
	public List getAllAdmin() {
		return findAll();
	}

	@Override
	public List search(Administor admin) {
		return findByProperty("adminName", admin.getAdminName());
	}


}