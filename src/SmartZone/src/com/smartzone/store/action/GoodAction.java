package com.smartzone.store.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.store.biz.CategoryBiz;
import com.smartzone.store.biz.CommentBiz;
import com.smartzone.store.biz.GoodBiz;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.entity.Category;
import com.smartzone.store.entity.Good;
import com.smartzone.store.entity.GoodImg;
import com.smartzone.store.entity.Shop;

public class GoodAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	private Integer imgIdx;
	private Shop shop;
	private Category category;
	private Good good;
	
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;
	
	private ShopBiz shopBiz;
	private GoodBiz goodBiz;
	private CategoryBiz categoryBiz;
	private CommentBiz commentBiz;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	public String toAdd(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		List list = categoryBiz.findByShopId(shop.getSid());
		request.put("categorys", list);
		return SUCCESS;
	}
	
	public String add(){
		
		if(good == null || category == null || category.getCid() == null){
			return ERROR;
		}
		category = categoryBiz.findById(category.getCid());
		if(category == null){
			return ERROR;
		}
		good.setCategory(category);
		
		if(upload != null){
			try {
				uploadProc();
			} catch (IOException e) {
				e.printStackTrace();
				return ERROR;
			}
		}
		goodBiz.add(good);
		
		return SUCCESS;
	}
	
	private void uploadProc() throws IOException{
		List<GoodImg> imgs = good.getImgs();
		
		String path = ServletActionContext.getServletContext().getRealPath("/img/store/")+ "/"+category.getShop().getSid()+"/";
		
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		GoodImg gImg = null;
		
		int len = 0;
		if(upload != null){
			len = upload.length;
		}
		
		for(int i = 0; i < len; ++i){
			
			String filename = uploadFileName[i];
			String suffix = filename.substring(filename.lastIndexOf('.'));   
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			filename = (int)(Math.random()*1000)+df.format(new Date(System.currentTimeMillis()))+suffix;
			String outpath = path+filename;
			
			fis = new FileInputStream(upload[i]);
			fos = new FileOutputStream(outpath);
			byte b[] = new byte[1024];
			while(fis.read(b) != -1){
				fos.write(b);
			}
			
			fos.close();
			fis.close();
			
			String imgpath = ServletActionContext.getServletContext().getContextPath()
					+"/img/store/"+category.getShop().getSid()+"/"
					+filename;
			Integer gid = null;
			gid = good.getGid();
			gImg = new GoodImg(gid, imgpath, null);
			
			imgs.add(gImg);
		}
		good.setImgs(imgs);
	}
	
	public String detail(){
		if( good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		request.put("good", good);
		List list = commentBiz.findByGood(good.getGid());
		request.put("comments", list);
		return SUCCESS;
	}
	
	public String show(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		List list = goodBiz.findVisibleByShopId(shop.getSid());
		request.put("goods", list);
		list = categoryBiz.findByShopId(shop.getSid());
		request.put("categorys", list);
		return SUCCESS;
	}
	public String manage(){
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		List list = goodBiz.findByShopId(shop.getSid());
		request.put("goods", list);
		list = categoryBiz.findByShopId(shop.getSid());
		request.put("categorys", list);
		return SUCCESS;
	}
	
	public String onShelf(){
		if(good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		goodBiz.onShelf(good);
		return SUCCESS;
	}
	
	public String awayShelf(){
		if(good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		goodBiz.awayShelf(good);
		return SUCCESS;
	}
	
	public String goodOnCategory(){
		
		if(category == null || category.getCid() == null){
			return ERROR;
		}
		category = categoryBiz.findById(category.getCid());
		List list = goodBiz.findByCategory(category.getCid());
		request.put("goods", list);
		list = categoryBiz.findByShopId(category.getShop().getSid());
		request.put("categorys", list);
		return SUCCESS;
	}
	
	public String delete(){
		if( good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		goodBiz.delete(good);
		return SUCCESS;
	}
	
	public String toAddImg(){
		return SUCCESS;
	}
	
	public String addImg(){
		if(good == null || good.getGid() == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		category = good.getCategory();
		if(upload != null){
			try {
				uploadProc();
			} catch (IOException e) {
				e.printStackTrace();
				return ERROR;
			}
		}
		goodBiz.save(good);
		return SUCCESS;
	}
	
	public String delImg(){
		if( good == null || good.getGid() == null || imgIdx == null){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		List imgs = good.getImgs();
		imgs.remove((int) imgIdx);
		good.setImgs(imgs);
		goodBiz.save(good);
		return SUCCESS;
	}
	
	public String toUpdate(){
		if( good == null || good.getGid() == null ){
			return ERROR;
		}
		good = goodBiz.findById(good.getGid());
		request.put("good", good);
		List list = categoryBiz.findByShopId(good.getCategory().getShop().getSid());
		request.put("categorys", list);
		return SUCCESS;
	}
	public String update(){
		if(good == null || good.getGid() == null){
			return ERROR;
		}
		Good check = goodBiz.findById(good.getGid());
		good.setImgs(check.getImgs());
		category = categoryBiz.findById(category.getCid());
		good.setCategory(category);
		goodBiz.save(good);
		
		return SUCCESS;
	}
	
	public String addCategory(){
		if(shop == null || shop.getSid() == null 
				|| category == null
				|| category.getCname() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		if(shop == null){
			return ERROR;
		}
		category.setShop(shop);
		categoryBiz.add(category);
		return SUCCESS;
	}
	public String delCategory(){
		if(category == null || category.getCid() == null){
			return ERROR;
		}
		categoryBiz.delete(category);
		return SUCCESS;
	}
	
	/*********************GETTER & SETTER*************************/
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setGoodBiz(GoodBiz goodBiz) {
		this.goodBiz = goodBiz;
	}
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public void setUpload(File[] uploadFile) {
		this.upload = uploadFile;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Integer getImgIdx() {
		return imgIdx;
	}

	public void setImgIdx(Integer imgIdx) {
		this.imgIdx = imgIdx;
	}

	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public CommentBiz getCommentBiz() {
		return commentBiz;
	}

	public void setCommentBiz(CommentBiz commentBiz) {
		this.commentBiz = commentBiz;
	}
}
