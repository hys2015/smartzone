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
    <s:set var="pageTitle" value="#request.notice.title"/>
    <title>${pageTitle }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		.panel-body{
			min-height:350px;
		}
	</style>
	</head>
  
  <body >
  	<s:include value="/nav.jsp"></s:include>
	<!--notice list-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
					<s:a action="showNotice" namespace="/notice">
						<s:param name="seriesId">${notice.series.seriesId }</s:param>
						<< <s:property value="#request.notice.series.seriesName"/>
					</s:a>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3>${notice.title }</h3>
						<div class="text-muted">
						发布人:
						<s:url var="userURL" action="detail" namespace="/user">
							<s:param name="user.username">${notice.author }</s:param>
						</s:url>
						<a href="${userURL }">
							${notice.author }
						</a>
						<s:date name="#request.notice.createtime" format="yyyy-MM-dd HH:mm:ss"/>
						<s:url var="updURL" action="toUpdate" namespace="/notice">
							<s:param name="notice.tid" value="#request.notice.tid"></s:param>
						</s:url>
						<s:if test="#session.logindata.obj.isAdmin > 0">
							<a class="pull-right" href="${updURL }">编辑</a>
						</s:if>
						</div>				
					</div>
					<div class="panel-body">
						${notice.content }
					</div>
				</div>
			</div>
		</div>
	</div>
  </body>
  <s:include value="/foot.html"></s:include>
</html>
