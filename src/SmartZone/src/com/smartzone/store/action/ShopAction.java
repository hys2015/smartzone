package com.smartzone.store.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.biz.TagBiz;
import com.smartzone.store.entity.Shop;
import com.smartzone.store.entity.Tag;

public class ShopAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private String kwd;
	private Tag tag;
	private Shop shop;
	private String defaultImg = "/SmartZone/img/store/shopimg_default.png";
	
	private ShopBiz shopBiz;
	private TagBiz tagBiz;
	
	private Map<String ,Object> request;
	private Map<String ,Object> session;
	
	public String userShow(){
		int commNo = LoginCheckData.getInstance(session).getCommNo();
		List list = shopBiz.findVisibleByCommNo(commNo);
		request.put("shops", list);
		return SUCCESS;
	}
	public String adminShow(){
		int commNo = LoginCheckData.getInstance(session).getCommNo();
		List list = shopBiz.findByCommNo(commNo);
		request.put("shops", list);
		return SUCCESS;
	}
	
	public String open(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shopBiz.open(shop);
		return SUCCESS;
	}
	public String close(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shopBiz.close(shop);
		return SUCCESS;
	}
	
	public String search(){
		if( shop == null || shop.getSname() == null){
			return "index";
		}
		kwd = shop.getSname();
		shop.setSname("%"+kwd+"%");
		List list = shopBiz.searchBySname(shop);
		request.put("shops", list);
		return SUCCESS;
	}
	
	public String add(){
		if(shop == null || shop.getSname() == null || shop.getAddr() == null || shop.getPhone() == null){
			addActionError("请把必填的项目填写上");
			return INPUT;
		}
		User u = (User) LoginCheckData.getInstance(session).getObj();
		shop.setUser(u);
		shopBiz.add(shop);
		return SUCCESS;
	}
	
	public String ownerShop(){
		User u = (User) LoginCheckData.getInstance(session).getObj();
		List list = shopBiz.findUserShops(u);
		request.put("shops", list);
		return SUCCESS;
	}
	
	public String tagShop(){
		if(tag == null || tag.getTid() == null){
			return ERROR;
		}
		tag = tagBiz.findById(tag.getTid());
		request.put("shops", tag.getShops());
		return SUCCESS;
	}
	
	public String toUpdate(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		List list = tagBiz.findAll();
		request.put("tags", list);
		return SUCCESS;
	}
	
	public String addTag(){
		
		if(shop == null ||tag == null || tag.getTitle() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		if(shop == null){
			return ERROR;
		}
		List list = tagBiz.findByTitle(tag.getTitle());
		if(list != null){
			tag = (Tag) list.get(0);
		}
		Set<Tag> tags = shop.getTags();
		tags.add(tag);
		shop.setTags(tags);
		shopBiz.save(shop);
		
		session.put("message", "标签添加成功");
		return SUCCESS;
	}
	
	public String delTag(){
		
		if(shop == null ||tag == null || tag.getTitle() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		if(shop == null){
			return ERROR;
		}
		Set<Tag> tags = shop.getTags();
		tags.remove(tag);
		shop.setTags(tags);
		shopBiz.save(shop);
		
		session.put("message", "标签删除成功");
		return SUCCESS;
	}
	
	public String tagNav(){
		List list = tagBiz.findAll();
		request.put("navTags", list);
		return SUCCESS;
	}
	
	public String detail(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getDefaultImg() {
		return defaultImg;
	}

	public void setDefaultImg(String defaultImg) {
		this.defaultImg = defaultImg;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public TagBiz getTagBiz() {
		return tagBiz;
	}

	public void setTagBiz(TagBiz tagBiz) {
		this.tagBiz = tagBiz;
	}

	public String getKwd() {
		return kwd;
	}

	public void setKwd(String kwd) {
		this.kwd = kwd;
	}
	
} 
