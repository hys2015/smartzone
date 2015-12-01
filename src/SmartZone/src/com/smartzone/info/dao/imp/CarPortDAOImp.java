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

import com.smartzone.info.dao.CarPortDAO;
import com.smartzone.info.entity.CarPort;
import com.smartzone.info.entity.User;

/**
 	* A data access object (DAO) providing persistence and search support for CarPort entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.smartzone.info.entity.CarPort
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class CarPortDAOImp implements CarPortDAO  {
	private static final Logger log = LoggerFactory.getLogger(CarPortDAOImp.class);

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
	 * @see com.smartzone.info.dao.imp.CarPortDAO#save(com.smartzone.info.entity.CarPort)
	 */
    @Override
	public void save(CarPort transientInstance) {
        log.debug("saving CarPort instance");
        try {
            getCurrentSession().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }

	@Override
	public void update(CarPort c) {
		 log.debug("updating CarPort instance");
        try {
            getCurrentSession().update(c);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
	}
	/* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarPortDAO#delete(com.smartzone.info.entity.CarPort)
	 */
	@Override
	public void delete(CarPort persistentInstance) {
        log.debug("deleting CarPort instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarPortDAO#findById(java.lang.Integer)
	 */
    @Override
	public CarPort findById( java.lang.Integer id) {
        log.debug("getting CarPort instance with id: " + id);
        try {
            CarPort instance = (CarPort) getCurrentSession()
                    .get("com.smartzone.info.entity.CarPort", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarPortDAO#findByExample(com.smartzone.info.entity.CarPort)
	 */
    @Override
	public List findByExample(CarPort instance) {
        log.debug("finding CarPort instance by example");
        try {
            List results = getCurrentSession().createCriteria("com.smartzone.info.entity.CarPort") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.info.dao.imp.CarPortDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding CarPort instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from CarPort as model where model." 
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
	 * @see com.smartzone.info.dao.imp.CarPortDAO#findAll()
	 */
	@Override
	public List findAll() {
		log.debug("finding all CarPort instances");
		try {
			String queryString = "from CarPort";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public CarPort merge(CarPort detachedInstance) {
        log.debug("merging CarPort instance");
        try {
            CarPort result = (CarPort) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(CarPort instance) {
        log.debug("attaching dirty CarPort instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(CarPort instance) {
        log.debug("attaching clean CarPort instance");
        try {
          	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CarPortDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CarPortDAO) ctx.getBean("CarPortDAO");
	}

	@Override
	public List findNoOwnerPorts(int commNo) {
		log.debug("finding NoOwnerPorts commNo: " + commNo);
	      try {
	         String queryString = "from CarPort as model where model.community.communityno=?"
	         		+ " and model.user = null"; 
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 queryObject.setParameter(0, commNo);
			 return queryObject.list();
	      } catch (RuntimeException re) {
	         log.error("find all no onwer ports failed", re);
	         throw re;
	      }
	}
}