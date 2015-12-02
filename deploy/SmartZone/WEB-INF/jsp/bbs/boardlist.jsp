<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<s:set var="pageTitle">板块</s:set>
		<title>${pageTitle }</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		
		<s:include value="/boot.html"></s:include>
			
		<style type="text/css">
			.list-group-item-heading{
				font-family:"黑体","宋体";	
			}	
		</style>
			
	</head>
	
	<body>
	<s:include value="/nav.jsp"></s:include>
	<div class="container-fluid">
  		<div class="row">
  			<div class="col-md-8 col-md-offset-2">
				<h1>
				${pageTitle }
				<s:if test="#session.logindata.obj.isAdmin > 0">
					<s:url var="manURL" action="manageBoard" namespace="/bbs"></s:url>
					<a class="btn btn-default" href="${manURL }">
					板块管理
					</a>
				</s:if>
				</h1>
				<hr>
	    		<s:iterator value="#request.boardlist" var="board">
	    			<div class="col-md-4 list-group">
				    			<s:url var="visitURL" action="showPosts" namespace="/bbs">
				    				<s:param name="board.boardId">${board.boardId }</s:param>
				    			</s:url>
				    			<a class="list-group-item" href="${visitURL}">
				    				<h3 class="list-group-item-heading">
						    			${board.boardName }
					    				<span class="badge"><s:property value="postCount"/></span>
				    				</h4>
				    				<p class="list-group-item-text">
				    					<s:property value="represent"/>
				    				</p>
				    			</a>
	    			</div>
	    		</s:iterator>
  			</div>
  			<div class="col-md-2">
  				<s:action name="replyStar" executeResult="true"></s:action>
  			</div>
    	</div>
    </div>
	</body>
	<s:include value="/foot.html"></s:include>
</html>