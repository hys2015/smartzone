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
    <s:set var="pageTitle">注册成功</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			var time = 3;
			setInterval(function(){
				time -= 1;
				if(time < 1){
					clearInterval();
					window.location.href="/SmartZone/index";
				}
					$("span.timeout").text(time);
			},1000)
		})
	</script>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h3>
				注册成功，即将跳转到登陆页面
				<span class="timeout">3</span>
				...
				<br>
				如浏览器无响应，请点击<s:a action="login" namespace="/">这里</s:a>
				</h3>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>