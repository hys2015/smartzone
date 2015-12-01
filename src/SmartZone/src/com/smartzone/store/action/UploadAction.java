package com.smartzone.store.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.entity.Shop;
import com.smartzone.store.entity.ShopImg;

public class UploadAction extends ActionSupport implements RequestAware,
		SessionAware {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private Integer idx;
	private Shop shop;
	private ShopBiz shopBiz;
	private ShopImg shopImg;
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	public String toUpload(){
		
		return SUCCESS;
	}
	
	public String delete(){
		
		if( null == idx || null == shop){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		if( null == shop){
			return ERROR;
		}
		List imgs = shop.getImgs();
		imgs.remove((int)idx);
		shop.setImgs(imgs);
		shopBiz.save(shop);
		
		return SUCCESS;
	}
	
	public String execute(){
		
		if(shop == null || shop.getSid() == null){
			return ERROR;
		}
		shop = shopBiz.findById(shop);
		if(shop == null){
			return ERROR;
		}
		
		String path = ServletActionContext.getServletContext().getRealPath("/img/store")+"\\";
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			String suffix = uploadFileName.substring(uploadFileName.lastIndexOf('.'));   
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			uploadFileName = (int)(Math.random()*1000)+df.format(new Date(System.currentTimeMillis()))+suffix;
			String outpath = path+uploadFileName;
			
			fis = new FileInputStream(upload);
			fos = new FileOutputStream(outpath);
			byte b[] = new byte[1024];
			while(fis.read(b) != -1){
				fos.write(b);
			}
			
			fos.close();
			fis.close();
			
			String imgpath = ServletActionContext.getServletContext().getContextPath()+"/img/store/"+uploadFileName;
			
			shopImg.setSid(shop.getSid());
			shopImg.setImgUrl(imgpath);
			
			List<ShopImg> imgs = shop.getImgs();
			if(imgs == null){
				imgs = new ArrayList<ShopImg>();
			}
			imgs.add(shopImg);
			
			shop.setImgs(imgs);
			shopBiz.save(shop);
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
			
		return SUCCESS;
	}
	
	public ShopBiz getShopBiz() {
		return shopBiz;
	}

	public void setShopBiz(ShopBiz shopBiz) {
		this.shopBiz = shopBiz;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFilename) {
		this.uploadFileName = uploadFilename;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public ShopImg getShopImg() {
		return shopImg;
	}

	public void setShopImg(ShopImg shopImg) {
		this.shopImg = shopImg;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}


}
