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

import com.smartzone.info.dao.CompanyDAO;
import com.smartzone.info.entity.Company;

/**
 	* A data access object (DAO) providing persistence and search support for Company entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.Company
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class CompanyDAOImp implements CompanyDAO  {
	     private static final Logger log = LoggerFactory.getLogger(CompanyDAOImp.class);
	

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
	 * @see com.smartzone.info.dao.imp.CompanyDAO#save(com.smartzone.info.entity.Company)
	 */
    @Override
	public void save(Company transientInstance) {
        log.debug("saving Company instance");
        try {
            getCurrentSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CompanyDAO#delete(com.smartzone.info.entity.Company)
	 */
	@Override
	public void delete(Company persistentInstance) {
        log.debug("deleting Company instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Company findById( java.lang.Integer id) {
        log.debug("getting Company instance with id: " + id);
        try {
            Company instance = (Company) getCurrentSession()
                    .get("com.smartzone.info.entity.Company", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CompanyDAO#findByExample(com.smartzone.info.entity.Company)
	 */
    @Override
	public List findByExample(Company instance) {
        log.debug("finding Company instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.Company") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CompanyDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Company instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Company as model where model." 
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
	 * @see com.smartzone.info.dao.imp.CompanyDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all Company instances");
		try {
			String queryString = "from Company";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Company merge(Company detachedInstance) {
        log.debug("merging Company instance");
        try {
            Company result = (Company) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Company instance) {
        log.debug("attaching dirty Company instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Company instance) {
        log.debug("attaching clean Company instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CompanyDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CompanyDAO) ctx.getBean("CompanyDAO");
	}
}