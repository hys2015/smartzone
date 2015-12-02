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
    <s:set var="pageTitle" value="'用户信息'"/>
    <title>${pageTitle }</title>
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
				<div class="panel panel-default">
					<div class="panel-heading">
						用户信息
						<s:if test="#session.logindata.obj.username == #request.user.username">
							<small>
								<s:url var="updURL" action="toUpdate" namespace="/user"></s:url>
								<a href="${updURL }">编辑</a>
							</small	>
						</s:if>
					</div>
					<div class="panel-body">
						<p> 
							<label>头像:</label>
							<img src="${user.img }" height="100" width="100">
						</p>
						<p>
							<label>用户名:</label>${user.username }
							<s:if test="#request.user.isAdmin">
								<i class="label label-danger">管理员</i>
							</s:if>
						</p>
						<p>
							<label>联系方式:</label>${user.userphone }
						</p>
						<p>
							<label>地址:</label>${user.useraddr}
						</p>
						<p>
							<label>所属小区:</label>${user.community.communityname }
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>