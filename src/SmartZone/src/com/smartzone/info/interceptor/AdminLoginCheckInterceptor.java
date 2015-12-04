package com.smartzone.info.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.smartzone.info.entity.Administor;
import com.smartzone.info.entity.LoginCheckData;

public class AdminLoginCheckInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		Map<String,Object> session = ai.getInvocationContext().getSession();
		LoginCheckData lcd = (LoginCheckData) session.get("logindata");
		if(lcd != null && lcd.getObj() instanceof Administor) {
			 return ai.invoke();
		}
		session.put("message","请登录");
		return Action.LOGIN;
	}
	
}
