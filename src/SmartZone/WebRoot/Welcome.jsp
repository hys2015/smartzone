<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <s:set var="pageTitle">欢迎来到智慧社区</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h3>欢迎来到智慧社区！</h3>
				<p>请稍候...</p>
				<% 
				String header = request.getHeader("User-Agent");
				if(header.indexOf("WebKit")==-1||header.contains("MSIE")){
					//非webkit内核，转发到提示页
					request.getRequestDispatcher("/browser.jsp").forward(request, response);
		  			return;
				}
				response.sendRedirect("/SmartZone/index"); %>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>