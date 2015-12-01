package com.smartzone.info.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.smartzone.info.entity.LoginCheckData;
import com.smartzone.info.entity.User;

public class UserLoginCheckInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6728133047998551543L;

	private StringBuffer toURL;
	
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		Map<String,Object> session = ai.getInvocationContext().getSession();
        LoginCheckData lcd = (LoginCheckData) session.get("logindata");
        if(lcd != null && lcd.getType().equals("user") && lcd.getObj() instanceof User) {
        	 return ai.invoke();
        }
    	 session.put("message","欢迎您，请先登录");
         return Action.LOGIN;
	}

	public StringBuffer getToURL() {
		return toURL;
	}

	public void setToURL(StringBuffer toURL) {
		this.toURL = toURL;
	}

}
