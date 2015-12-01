<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<s:set var="pageTitle" value="'帖子'"></s:set>
	<title>${pageTitle }</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		.backTop{
			position:fixed;
			bottom:2em;
			right:10em;
			display:inline-block;
		}
	
	</style>
</head>
<body>
<div class="backTop">
		<a href="#top">
		<i class="glyphicon glyphicon-arrow-up"></i>
		返回顶部
	</a>
</div>
<a name="top"></a>

<s:include value="/nav.jsp"></s:include>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<s:action name="listAllBoards" namespace="/bbs" executeResult="true">
				<s:param name="nav" value="'nav'"></s:param>
			</s:action>
		</div>
    	<div class="col-md-8">
	    	<div class="panel panel-default">
	    		<div class="panel-heading">
	    			<s:a action="visitBoard" namespace="/bbs">
	    				<s:param name="board.boardId" value="post.board.boardId"></s:param>
	    				<< <s:property value="post.board.boardName"/>
	    			</s:a>
	    			<span class="pull-right">
	    					<a class="btn btn-primary" href="#createReply">回帖</a>
	    			</span>
	    			<h3>${post.postTitle }
	    			</h3>
	    			<small class="text-muted">
	    				<s:url var="userURL" action="detail" namespace="/user">
	    					<s:param name="user.username" value="post.user.username"></s:param>
	    				</s:url>
	    				<a href="${userURL }">
	    					<s:property value="post.user.username"/>
	    				</a>
	    				发布于 <s:date name="post.postCreatetime" format="yyyy-MM-dd HH:mm:ss"/>
	    			</small>
	    		</div>
	    		<s:include value="replies.jsp"/>
	   		</div><!-- col-8 -->
	   		<s:include value="repliespager.jsp"/>
	   		<a name="createReply"></a>
		   	<s:include value="createreply.jsp" />
	   	</div>
	</div>
</div>
</body>
<s:include value="/foot.html"></s:include>
</html>