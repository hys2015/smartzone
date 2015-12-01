<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<s:set var="pageTitle" value="board.boardName"/>
		<title>${pageTitle }</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<s:include value="/boot.html"></s:include>
		
	</head>
	<body>
	<a name="top"></a>
	<s:include value="/nav.jsp"></s:include>
  	<div class="container-fluid">
  		<div class="row">
  			<!-- boardnav -->
  			<div class="col-md-2">
  				<s:action name="listAllBoards" namespace="/bbs" executeResult="true">
  					<s:param name="nav" value="'nav'"></s:param>
  				</s:action>
  			</div>
  		
  			<!-- posts -->
  			<div class="col-md-8">
	    		<s:include value="posts.jsp"></s:include>
				<!-- 分页 -->
				<s:include value="postpager.jsp"></s:include>
				<a name="createPost"></a>
	    		<s:include value="createpost.jsp"/>
	  		</div>
	  		<!-- 热门 -->
	  		<div class="col-md-2">
				<s:action name="hotPost" namespace="/bbs" executeResult="true">
					<s:param name="board.boardId" value="board.boardId"></s:param>
				</s:action>
	  		</div>
    	</div>
    </div>
	</body>
	<s:include value="/foot.html"></s:include>
</html>