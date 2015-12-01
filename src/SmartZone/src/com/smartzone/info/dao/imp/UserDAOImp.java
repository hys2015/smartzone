package com.smartzone.info.dao.imp;
// default package

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

import com.smartzone.info.dao.UserDAO;
import com.smartzone.info.entity.User;

/**
 	* A data access object (DAO) providing persistence and search support for User entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .User
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class UserDAOImp implements UserDAO  {
	private static final Logger log = LoggerFactory.getLogger(UserDAOImp.class);
		//property constants
	public static final String USERNAME = "userName";
	public static final String USERPWD = "userPwd";
	public static final String USERADDR = "userAddr";
	public static final String USERPHONE = "userPhone";



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
	 * @see com.smartzone.dao.imp.UserDAO#save(com.smartzone.entity.User)
	 */
    @Override
	public void save(User transientInstance) {
        log.debug("saving User instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.dao.imp.UserDAO#delete(com.smartzone.entity.User)
	 */
	@Override
	public void delete(User persistentInstance) {
        log.debug("deleting User instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.dao.imp.UserDAO#findById(java.lang.String)
	 */
    @Override
	public User findById( java.lang.String id) {
        log.debug("getting User instance with id: " + id);
        try {
            User instance = (User) getCurrentSession()
                    .get("com.smartzone.entity.User", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.dao.imp.UserDAO#findByExample(com.smartzone.entity.User)
	 */
    @Override
	public List findByExample(User instance) {
        log.debug("finding User instance by example");
        try {
            List results = getCurrentSession().createCriteria("User") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.dao.imp.UserDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding User instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from User as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getCurrentSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUserpwd(Object userpwd
	) {
		return findByProperty(USERPWD, userpwd
		);
	}
	
	public List findByUseraddr(Object useraddr
	) {
		return findByProperty(USERADDR, useraddr
		);
	}
	
	public List findByUserphone(Object userphone
	) {
		return findByProperty(USERPHONE, userphone
		);
	}
	

	/* (non-Javadoc)
	 * @see com.smartzone.dao.imp.UserDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public User merge(User detachedInstance) {
        log.debug("merging User instance");
        try {
            User result = (User) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(User instance) {
        log.debug("attaching dirty User instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(User instance) {
        log.debug("attaching clean User instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UserDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UserDAO) ctx.getBean("UserDAO");
	}
}