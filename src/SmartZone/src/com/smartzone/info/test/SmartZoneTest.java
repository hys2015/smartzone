package com.smartzone.info.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.smartzone.bbs.biz.ReplyBiz;
import com.smartzone.info.biz.AdminBiz;
import com.smartzone.info.biz.CarPortBiz;
import com.smartzone.info.biz.CarbillBiz;
import com.smartzone.info.biz.FeedbackBiz;
import com.smartzone.info.biz.NoticeBiz;
import com.smartzone.info.biz.SeriesBiz;
import com.smartzone.info.biz.UserBiz;
import com.smartzone.info.entity.Administor;
import com.smartzone.info.entity.Feedback;
import com.smartzone.info.entity.Notice;
import com.smartzone.info.entity.User;

public class SmartZoneTest {
	
	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	
	public static void main(String[] args) {
//		SmartZoneTest.userLoginTest();
		SmartZoneTest.carbillTest();
	}
	
	static void carbillTest(){
		CarbillBiz cBiz = (CarbillBiz) ctx.getBean("CarbillBiz");
		List list = cBiz.findCommunityBills(1);
		System.out.println(list.size());
	}
	
	static void carportTest(){
		CarPortBiz cBiz = (CarPortBiz) ctx.getBean("CarPortBiz");
		
		List list = cBiz.findAll(1);
		System.out.println(list.size());
	}
	
	static void seriesTest(){
		SeriesBiz sBiz = (SeriesBiz) ctx.getBean("SeriesBiz");
		List list = sBiz.findAll();
		System.out.println(list.size());
	}
	
	static void replyStarTest(){
		ReplyBiz rbiz = (ReplyBiz) ctx.getBean("bbsReplyBiz");
		List list = rbiz.getReplyStar();
		System.out.println(list.size());
	}
	
	static void adminDAOTest(){
		AdminBiz abiz = (AdminBiz) ctx.getBean("adminBiz");
		Administor admin = new Administor();
		admin.setAdminName("admin1");
		admin.setAdminPwd("1234");
		List list = 
		abiz.login(admin);
//		boolean t = 
		System.out.println(list.size());
		System.out.println(((Administor)list.get(0)).getCommunity().getCommunityno());
		System.out.println("done");
	}
	
	static void noticeDAOTest(){
		NoticeBiz nbiz = (NoticeBiz)ctx.getBean("noticeBiz");
		Notice not = new Notice();
		not.setAuthor("HHHYS");
		not.setTitle("yss");
		not.setContent("HELLOE");
//		boolean t = nbiz.addNotice(not);
//		System.out.println(t);
//		System.out.println(((Notice)list.get(0)).getTitle());
	}
	
	static void noticeTopTest(){
		NoticeBiz nbiz = (NoticeBiz)ctx.getBean("noticeBiz");
		Notice not = new Notice();
		not.setTid(8);
		not.setAuthor("HHHYS");
		not.setTitle("NEW EIGHT");
		not.setContent("HELLOE");
		not.setValiable(1);
		nbiz.setTopNotice(not);
		System.out.println("done");
	}
	
	static void adminUpdTest(){
		
		AdminBiz abiz = (AdminBiz)ctx.getBean("adminBiz");
		Administor adm = new Administor();
		adm.setAdminName("test2");
		adm.setAdminPwd("123456");
//		abiz.addAdmin(adm);
		abiz.update(adm);
		System.out.println("done");
		
	}
	static void userLoginTest(){
		
		UserBiz ubiz = (UserBiz) ctx.getBean("userBiz");
		User user = new User();
		
	}
	
	static void feedbackTest(){
		
		FeedbackBiz fbiz = (FeedbackBiz) ctx.getBean("FeedbackBiz");
		
		int fno = 1;
		List list = fbiz.getFeedbackByFno(fno);
		Feedback fb = new Feedback("fb001", "hys", null, "fbcontent", null, null);
		
		fbiz.addFeedback(fb);
		System.out.println("done");
		//		Hibernate.initialize(fb.getReplies());
//		System.out.println(fb.getReplies().size());
	}
	
	static void WordSplitTest(){
		String s = "/abcd/der/";
		String words[] = s.split("/");
		System.out.println(s.endsWith("/"));
		for(int i = 0 ; i < words.length ; ++ i ){
			System.out.println(words[i]);
		}
	}
	
	
}
