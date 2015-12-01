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
    <s:set var="pageTitle" value="'写公告'"/>
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
    <s:form action="addNotice.action">
  		<s:textfield type="text" name="notice.title" label="题目"/>
  		<s:textfield type="text" name="notice.author" label="发布者"/>
  		<s:textarea type="text" name="notice.content" label="内容"/>
  		<s:submit value="提交"></s:submit>
  	</s:form>
  	<s:form action="fileUpload.action" enctype="multipart/form-data" method="post">
		<s:file name="uploadFile" label="上传文件"/>
		<s:submit value="上传"/>
		<s:reset value="重置"/>
  	</s:form>
  	<form action="addNotice.action">
  		<div class="form-group">
  			<label for="control-label">题目</label>
  			<input type="text" name="notice.title" class="form-control" placeholder="题目">
  		</div>
  		<div class="form-group">
			<label class="control-label">发布者</label>
			<input type="text" name="admin.adminName"  class="form-control" placeholder="${session.adminName}" />
		</div>
  	</form>
  </body>
  <s:include value="/boot.html"></s:include>
</html>
