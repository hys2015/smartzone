package com.smartzone.info.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.RepairBiz;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.Notification;
import com.smartzone.info.entity.Pager;
import com.smartzone.info.entity.Repair;
import com.smartzone.info.entity.User;

public class RepairAction extends ActionSupport implements RequestAware,SessionAware,ApplicationAware{
	
	private final static Logger log = LoggerFactory.getLogger(RepairAction.class);
	
	private final String USERNAME = "userName";
	private final String ADMINNAME = "adminName";
	
	private final int SIZE = 10;
	
	private Repair repair;
	private RepairBiz repairBiz;
	private Pager pager;
	private Integer toState;
	private Map<String,Object> session;
	private Map<String,Object> request;
	private Map<String,Object> application;
	
	public String add(){
		if(repair == null){
			return INPUT;
		}
		LoginCheckData lcd = LoginCheckData.getInstance(session);
		User ruser = (User) lcd.getObj();
		repair.setRuser(ruser.getUsername());
		repair.setCommunityno(ruser.getCommunity().getCommunityno());
		repair.setRstate(1);  //默认等级 未审核
		String content = repair.getRcontent();
		int length = content.length();
		content = content.substring(0 , length > 1000 ? 1000 : length);
		repair.setRcontent(content);
		repairBiz.addRepair(repair);
		//repair通知
		Notification mf = Notification.getInstance(application);
		mf.newRepair();
		mf.setInstance(application);
		
		return SUCCESS;
	}

	public String show(){
		int curPage = 1; //默认的页数
		if(pager!=null){
			curPage = pager.getCurPage();
		}
		List nlist = null;
		if(null==repair){
			LoginCheckData lcd = (LoginCheckData) session.get("logindata");
			User user = (User) lcd.getObj();
			pager = repairBiz.getPager(SIZE,user.getUsername());
			if(curPage > pager.getPageCount()){
				curPage = pager.getPageCount();
			}else if(curPage < 0){
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = repairBiz.getRpairWithPage(curPage, SIZE, user.getUsername());
		}
		request.put("repairlist", nlist);
		return SUCCESS;
	}
	
	public String showAll(){
		int curPage = 1; //默认的页数
		if(pager!=null){
			curPage = pager.getCurPage();
		}
		List nlist = null;
		if(null==repair){
			pager = repairBiz.getPager(SIZE);
			if(curPage > pager.getPageCount()){
				curPage = pager.getPageCount();
			}else if(curPage < 0){
				curPage = 1;
			}
			pager.setCurPage(curPage);
			nlist = repairBiz.getRpairWithPage(curPage, SIZE);
		}
		request.put("repairlist", nlist);
		
		Notification mf = Notification.getInstance(application);
		mf.readRepair();
		mf.setInstance(application);
		
		return SUCCESS;
	}
	
	public String changeState(){
		//登录检测(interceptor)
		//得到rno，状态修改至toState,需要记录修改人
		if(repair != null){
			List list = repairBiz.getRpairByRno(repair.getRno());
			if(list == null) {
				log.error("changestate() list null");
				return ERROR;
			}
			Repair r = (Repair) list.get(0);
			LoginCheckData lcd = LoginCheckData.getInstance(session);
			r.setRlastupdatorId(((User)lcd.getObj()).getUsername());
			r.setRstate(toState);
			repairBiz.updateRepair(r);
			return SUCCESS;
		}
		//更新保存
		log.error("未得到repair的值");
		return ERROR;
	}
	
	public String detail(){
		Integer rno = repair.getRno();
		if( rno == null){
			log.debug(log.getClass() + "rno is null");
			return ERROR;
		}
		List list = repairBiz.getRpairByRno(rno);
		if(list == null){
			log.debug("rno is useless");
			return ERROR;
		}
		repair = (Repair) list.get(0);
		request.put("detail", repair);
		return SUCCESS;
	}
	
	public String toUpdate(){
		int rno = repair.getRno();
		List list = repairBiz.getRpairByRno(rno);
		if( list == null || list.size() < 1) {
			log.error("repair.tid is null or useless");
			return ERROR;
		}
		request.put("repair",list.get(0));
		return SUCCESS;
	}
	
	public String delete(){
		if(repair != null && repair.getRno() != null){
			int rno = repair.getRno();
			List list = repairBiz.getRpairByRno(rno);
			if(list != null){
				repair = (Repair) list.get(0);
				repairBiz.delete(repair);
				User u = (User)LoginCheckData.getInstance(session).getObj();
				boolean b = u.getIsAdmin();
				if( true == b){
					return "admin";
				}else{
					return "user";
				}
			}
		}
		log.error("repair is null or rno missing");
		return ERROR;
	}
	
	public RepairBiz getRepairBiz() {
		return repairBiz;
	}

	public void setRepairBiz(RepairBiz repairBiz) {
		this.repairBiz = repairBiz;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Repair getRepair() {
		return repair;
	}

	public void setRepair(Repair repair) {
		this.repair = repair;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {	
		this.request = arg0;
	}

	public Integer getToState() {
		return toState;
	}

	public void setToState(Integer toState) {
		this.toState = toState;
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}
}
