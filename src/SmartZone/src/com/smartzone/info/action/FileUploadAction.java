package com.smartzone.info.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class FileUploadAction extends ActionSupport implements SessionAware {
	
		Logger log = LoggerFactory.getLogger(FileUploadAction.class);
	   
		private File file;
		private String contentType;
		private String filename;
		
		private int x;
		private int y;
		private int width;
		private int height;
		
		private UserBiz userBiz;
		private Map<String,Object> session;
		
		public void setUpload(File file) {
			this.file = file;
		} 
		      
		public void setUploadContentType(String contentType) {
			this.contentType = contentType;
		}
		
		public void setUploadFileName(String filename) {
			this.filename = filename;
		}

		/**
		 * 上传图片，先裁剪，再存
		 * 
		 */

	   public String execute() {
		   
		   LoginCheckData lcd = LoginCheckData.getInstance(session);
		   User user = (User) lcd.getObj();
		   
		   String path = ServletActionContext.getServletContext().getRealPath("/upload/img/")+"\\";
		   FileOutputStream fos = null;
		   FileInputStream fis = null;
		   try {
			BufferedImage bimg = ImageIO.read(file);
			BufferedImage outimg = bimg.getSubimage(x, y, width, height);
			   
			String suffix = filename.substring(filename.lastIndexOf('.'));   
			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			filename = (int)(Math.random()*1000)+df.format(new Date(System.currentTimeMillis()))+suffix;
			String outpath = path+filename;
			ImageIO.write(outimg, suffix.substring(1), new File(outpath));
			
			user = userBiz.getUserByUsername(user.getUsername());
			String img = ServletActionContext.getServletContext().getContextPath()+"/upload/img/"+filename;
			user.setImg(img);
			userBiz.save(user);
			
			lcd.setObj(user);
			lcd.setInstance(session);
			
		   } catch (FileNotFoundException e) {
			log.error(e.getMessage());
			return ERROR;
		} catch (IOException e) {
			log.error(e.getMessage());
			return ERROR;
		}
		    return SUCCESS;
	   }

	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


}
