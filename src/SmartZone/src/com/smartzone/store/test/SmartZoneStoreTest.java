package com.smartzone.store.test;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.smartzone.store.biz.CategoryBiz;
import com.smartzone.store.biz.GoodBiz;
import com.smartzone.store.biz.ShopBiz;
import com.smartzone.store.biz.TagBiz;
import com.smartzone.store.entity.CartItem;
import com.smartzone.store.entity.Category;
import com.smartzone.store.entity.Good;
import com.smartzone.store.entity.GoodImg;
import com.smartzone.store.entity.Shop;
import com.smartzone.store.entity.ShopImg;
import com.smartzone.store.entity.Tag;

public class SmartZoneStoreTest {
	
	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	
	public static void main(String[] args) {
		SmartZoneStoreTest.listContainsTest();
	}
	
	public static void listContainsTest(){
		List<CartItem> gi = new ArrayList<CartItem>(0);
		Good good = new Good();
		CartItem ci = new CartItem();
		good.setGid(1);
		ci.setGood(good);
		gi.add(ci);
		good.setGid(2);
		ci.setGood(good);
		gi.add(ci);
		System.out.println(gi.size());
		good.setGid(1);
		ci.setGood(good);
		System.out.println(gi.contains(good));
		
		Good g2 = new Good();
		good.setGid(1);
		g2.setGid(1);
		System.out.println(g2.equals(good));
		
	}
	
	public static void goodAddTest(){
		GoodBiz gBiz = (GoodBiz) ctx.getBean("GoodBiz");
		CategoryBiz cBiz = (CategoryBiz) ctx.getBean("CategoryBiz");
		Category cat = cBiz.findById(1);
		Good good = new Good(cat,"xxx","detail", 2.2, 1.1, 20);
		List list = good.getImgs();
		GoodImg gi = new GoodImg(null, "/abcd", null);
		list.add(gi);
		gBiz.save(good);
		
	}
	
	public static void tagFindTest(){
		TagBiz tBiz = (TagBiz) ctx.getBean("TagBiz");
		Tag t = tBiz.findById(4);
		System.out.println(t.getShops().size());
		Iterator<Shop> it = t.getShops().iterator();
		while(it.hasNext()){
			System.out.println(it.next().getSname());
		}
	}
	
	public static void findByExampleTest(){
		ShopBiz sBiz = (ShopBiz) ctx.getBean("ShopBiz");
		Shop shop = new Shop();
		shop.setSname("shop%");;
		List list = sBiz.searchBySname(shop);
		System.out.println(list.size());
	}
	
	public static void ListIndexTest(){
		List list = new ArrayList();
		ShopImg si = new ShopImg(1,"abc",0,"ddd");
		list.add(si);
		si = new ShopImg(2,"abc",0,"ddd");
		list.add(si);
		si = new ShopImg(3,"abc",0,"ddd");
		list.add(si);
		si = new ShopImg(4,"abc",0,"ddd");
		list.add(si);
		System.out.println(list.size());
		Integer idx = 2;
		list.remove((int)idx);
		System.out.println(list.size());
	}
	
	public static void TagEqualTest(){
		Tag t1 = new Tag("abc");
		Tag t2 = new Tag("abcde");
		Set<Tag> tags = new HashSet<Tag>();
		tags.add(t1);
		tags.add(t2);
		System.out.println(tags.size());
		Tag t3 = new Tag("abc");
		boolean b = tags.contains(t3);
		System.out.println(b);
		tags.remove(t3);
		System.out.println(tags.size());
	} 
	
	public static void shopManyToManyTest(){
		ShopBiz sBiz = (ShopBiz) ctx.getBean("ShopBiz");
		Shop shop = new Shop();
		shop.setSid(5);
		shop = sBiz.findById(shop);
		System.out.println(shop.getTags().size());
	}
	
	public static void shopCascadeTest(){
		ShopBiz sBiz = (ShopBiz) ctx.getBean("ShopBiz");
		Shop shop = new Shop();
		shop.setSid(5);
		shop = sBiz.findById(shop);
		List<ShopImg> imgs = shop.getImgs();
		if(imgs == null){
			imgs = new ArrayList<ShopImg>();
		}
		imgs.add(new ShopImg(shop.getSid(), "abcd", 0, "brief"));
		
		shop.setImgs(imgs);
		sBiz.save(shop);
	}
	
	public static void shopTest(){
		ShopBiz sBiz = (ShopBiz) ctx.getBean("ShopBiz");
		List list = sBiz.findAll();
		System.out.println(list.size());
	}
}
