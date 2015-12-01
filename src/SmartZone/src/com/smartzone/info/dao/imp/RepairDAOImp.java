package com.smartzone.info.dao.imp;
// default package

import java.util.Date;
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

import com.smartzone.info.dao.RepairDAO;
import com.smartzone.info.entity.Notice;
import com.smartzone.info.entity.Repair;

/**
 	* A data access object (DAO) providing persistence and search support for Repair entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .Repair
  * @author MyEclipse Persistence Tools 
 */
    @Transactional   
public class RepairDAOImp implements RepairDAO  {
	     private static final Logger log = LoggerFactory.getLogger(RepairDAOImp.class);
		//property constants
	public static final String RADDR = "raddr";
	public static final String RPHONE = "rphone";
	public static final String RCONTENT = "rcontent";
	public static final String RUSER = "ruser";



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
	 * @see com.smartzone.dao.imp.RepairDAO#save(com.smartzone.entity.Repair)
	 */
    @Override
	public void save(Repair transientInstance) {
        log.debug("saving Repair instance");
        try {
            getCurrentSession().saveOrUpdate(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	/* (non-Javadoc)
	 * @see com.smartzone.dao.imp.RepairDAO#delete(com.smartzone.entity.Repair)
	 */
	@Override
	public void delete(Repair persistentInstance) {
        log.debug("deleting Repair instance");
        try {
            getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    /* (non-Javadoc)
	 * @see com.smartzone.dao.imp.RepairDAO#findById(java.lang.Integer)
	 */
    @Override
	public Repair findById( java.lang.Integer id) {
        log.debug("getting Repair instance with id: " + id);
        try {
            Repair instance = (Repair) getCurrentSession()
                    .get("Repair", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Repair instance) {
        log.debug("finding Repair instance by example");
        try {
            List results = getCurrentSession().createCriteria("Repair") .add(Example.create(instance)).list();
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    /* (non-Javadoc)
	 * @see com.smartzone.dao.imp.RepairDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
    @Override
	public List findByProperty(String propertyName, Object value) {
      log.debug("finding Repair instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Repair as model where model." 
         						+ propertyName + "= ?";
         Query queryObject = getCurrentSession().createQuery(queryString);
		 queryObject.setParameter(0, value);
		 return queryObject.list();
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByRaddr(Object raddr
	) {
		return findByProperty(RADDR, raddr
		);
	}
	
	public List findByRphone(Object rphone
	) {
		return findByProperty(RPHONE, rphone
		);
	}
	
	public List findByRcontent(Object rcontent
	) {
		return findByProperty(RCONTENT, rcontent
		);
	}
	
	public List findByRuser(Object ruser
	) {
		return findByProperty(RUSER, ruser
		);
	}
	

	public List findAll() {
		log.debug("finding all Repair instances");
		try {
			String queryString = "from Repair";
	         Query queryObject = getCurrentSession().createQuery(queryString);
			 return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Repair merge(Repair detachedInstance) {
        log.debug("merging Repair instance");
        try {
            Repair result = (Repair) getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Repair instance) {
        log.debug("attaching dirty Repair instance");
        try {
            getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Repair instance) {
        log.debug("attaching clean Repair instance");
        try {
                      	getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
          	            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static RepairDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (RepairDAO) ctx.getBean("RepairDAO");
	}

	@Override
	public List findPageRepair(int page, int size) {
		log.debug("getRepair on page:"+page+",size="+size);
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria c = session.createCriteria(Repair.class);
			c.addOrder(Order.desc("rno"));
			c.setFirstResult((page-1)*size);
			c.setMaxResults(size);
	        log.debug("getRepairWith page successful");
	        return c.list();
		} catch (RuntimeException re) {
			log.error("getRepairWith page failed", re);
			throw re;
		}
	}
	
	@Override
	public List findPageRepair(int page, int size, String username) {
		log.debug("getRepair on page:"+page+",size="+size);
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria c = session.createCriteria(Repair.class);
			c.addOrder(Order.desc("rno"));
			c.setFirstResult((page-1)*size);
			c.setMaxResults(size);
			c.add(Restrictions.eq("ruser", username));
	        log.debug("getRepairWith page successful");
	        return c.list();
		} catch (RuntimeException re) {
			log.error("getRepairWith page failed", re);
			throw re;
		}
	}

	@Override
	public int getCountofUserRepair(String username) {
		log.debug("getCountofUSERRepair");
		return getCountofRepairOnProperty("ruser", username);
	}

	@Override
	public int getCountofRepair() {
		log.debug("getCountofRepair");
		int count = 0;
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select count(r) from Repair r";
			Query query =  session.createQuery(hql);
			count = Integer.parseInt(query.uniqueResult().toString());
	        log.debug("getCount successful");
	        return count;
		} catch (RuntimeException re) {
			log.error("getCount failed", re);
			throw re;
		}
	}
	@Override
	public int getCountofRepairOnProperty(String propertyName, String value){
		log.debug("getCountofRepairOnProperty,propertyName:"+propertyName+",value:"+value);
		int count = 0;
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select count(r) from Repair r where r."+propertyName+"=?";
			Query query =  session.createQuery(hql);
			query.setString(0, value);
			count = Integer.parseInt(query.uniqueResult().toString());
	        log.debug("getCount successful,count:"+count);
	        return count;
		} catch (RuntimeException re) {
			log.error("getCount failed", re);
			throw re;
		}
	}
	
}