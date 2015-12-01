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
    <s:set var="pageTitle" value="#request.detail.adminName"/>
    <title>${detail.adminName }</title>
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
				<form action="updateAdmin.action" method="post">
					<div class="h3">
					个人信息
					</div>
						<s:actionmessage cssClass="text-center text-danger nav"/>
						<s:fielderror cssClass="text-center text-danger nav">
							<s:param>admin.adminName</s:param>			
							<s:param>admin.adminPwd</s:param>
							<s:param>newPwd</s:param>
							<s:param>checkPwd</s:param>
						</s:fielderror>
					<div class="form-group">
						<label class="control-label">用户名</label>
						<input readonly="true" type="text" name="admin.adminName" value="${detail.adminName }"  class="form-control" placeholder="用户名" />
					</div>
					<div class="form-group">
						<label class="control-label">旧密码</label>
						<input type="password" name="admin.adminPwd" class="form-control" placeholder="请输入旧密码" />
					</div>
					<div class="form-group">
						<label class="control-label">新密码</label>
						<input type="password" name="newPwd" class="form-control" placeholder="请输入新密码" />
					</div>
					<div class="form-group">
						<label class="control-label">确认新密码</label>
						<input type="password" name="checkPwd" class="form-control" placeholder="请再次输入新密码" />
					</div>
					
					<button type="submit" class="btn btn-default center-block">保存</button>
				</form>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>