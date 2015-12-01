<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智慧社区-SMARTZONE</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		.jumbotron{
			background-color:rgba(255,255,255,0.5);
			position:absolute;
			top:10em;
			width:100%;
		}
		#carousel-example-generic{
			margin-top:-6em;
			z-index:-100;
		}
	</style>
  </head>
  	
  <body>
	<s:include value="/nav.jsp"></s:include>
  	<div class="container-fluid">
  		<div class="row">
			<h3 class="text-center">欢迎来到智慧社区</h3>
			<% response.sendRedirect("/SmartZone/index"); %>
  		</div>
  	</div>
  </body>
  <s:include value="/foot.html"></s:include>
</html>
