package com.smartzone.info.interceptor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.smartzone.info.entity.BreadCrumb;

public class BreadCrumbInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		ActionContext ctx = ai.getInvocationContext();
		Map<String, Object > session = ctx.getSession();
		
		Map<String,String> wordMap = new HashMap<String,String>();
		wordMap.put("SmartZone", "首页");
		wordMap.put("notice", "公告");
		wordMap.put("repair", "报修");
		wordMap.put("feedback", "留言");
		wordMap.put("bbs", "左邻右里");
		wordMap.put("fee", "费用缴纳");
		wordMap.put("carbill", "停车费订单");
		wordMap.put("user", "用户信息");
		wordMap.put("store", "附近商家");
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String r = request.getRequestURI();
		String words[] = r.split("/");
		ArrayList<BreadCrumb> urls= new ArrayList<BreadCrumb>();
		String url = "/"; 
		int n = words.length;
		if(r.endsWith("/")){
			n++;
		}
		if(n > 3){
			for(int i = 1 ; i < n - 1; i++){
				url += words[i]+"/";
				BreadCrumb bc = new BreadCrumb();
				bc.setUrl(url+"index.action");
				if(wordMap.get(words[i])!=null){
					bc.setWord(wordMap.get(words[i]));
					urls.add(bc);
				}
			}
			session.put("breadcrumb", urls);
		}else{
			session.remove("breadcrumb");
		}
		return ai.invoke();
	}
}
