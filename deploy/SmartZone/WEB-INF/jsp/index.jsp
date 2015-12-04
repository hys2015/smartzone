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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css">
	<script type="text/javascript">
		$(function(){
			$(".a-panel").bind("mouseover",function(){
				$(this).find("div:eq(0)").slideUp(200);
			})
			$(".a-panel").bind("mouseleave",function(){
				$(this).find("div:eq(0)").slideDown(100);
			})
		})
	</script>
  </head>
  	
  <body>
	<s:include value="/nav.jsp"></s:include>
  	<div class="jumbotron">
		<div class="text-center">
			<div class="nav-pane">
				<div class="transparent"><a>.</a></div>
				<div class="a-panel">
					<div class="content">
						<span class="glyphicon glyphicon-bullhorn"></span>
					</div>
					<s:a action="index" namespace="/notice">信息中心</s:a>
				</div>
				<div class="a-panel">
					<div class="content">
						<span class="glyphicon glyphicon-user"></span>
					</div>
					<s:a action="index" namespace="/user">我的资料</s:a>
				</div>
				<br>
				<div class="a-panel">
					<div class="content">
						<span class="glyphicon glyphicon-gift"></span>
					</div>
					<s:a action="index" namespace="/store">附近商家</s:a>
				</div>
				<div class="a-panel">
					<div class="content">
						<span class="glyphicon glyphicon-tasks"></span>
					</div>
					<s:a action="index" namespace="/bbs">左邻右里</s:a>
				</div>
			</div>
			<h1>智慧社区<small>社区信息服务系统</small></h1>
			<h2 class="text-primary">开启智慧心生活</h2>
		</div>
	</div>
  	<div class="main  container-fluid "  id="linearBg2">
  		<div class="row">
			<div class="container">
			<div class="index-btn col-md-12  text-center">
			 		<div class="btns">
			            	<s:a action="feeCenter" namespace="/fee" >
			            		我要缴费
			            		<i class="glyphicon glyphicon-jpy"></i>
			            	</s:a>
				            <s:a action="toAdd" namespace="/repair">
				            	我要报修
				            	<i class="glyphicon glyphicon-alert"></i>
				            	</s:a>
			            	<s:a action="show" namespace="/feedback">
			            		我要留言
			            		<i class="glyphicon glyphicon-comment"></i>
			           		</s:a>
			 		</div>
			</div>
			<div class="col-md-6">
				<label>
				<s:a action="index" namespace="/notice">
					信息中心
					<span class="glyphicon glyphicon-bullhorn"></span>
				</s:a>
				最新消息
				</label>
				<s:if test="#request.notices.size < 1">
					<div class="list-group-item">
						还没有消息
					</div>
				</s:if>
				<s:iterator value="#request.notices">
					<div class="list-group-item">
						<s:a cssClass="text-muted h6" title="板块" action="showNotice" namespace="/notice">
							<s:param name="seriesId" value="series.seriesId"></s:param>
								【<s:property value="series.seriesName"/>】
							</s:a>
						<s:a action="noticeDetail" namespace="/notice">
							<s:param name="tid" value="tid"></s:param>
							<s:property value="title"/>
						</s:a>
						<span class="pull-right">
							<s:date name="createtime" format="MM-dd"/>
						</span>
					</div>
				</s:iterator>
				</div>
				<!-- bbs -->
				<div class="col-md-6">
				<label>
				<s:a action="listAllBoards" namespace="/bbs">
					左邻右里
					<span class="glyphicon glyphicon-tasks"></span>
					</s:a>
				最新动态
				</label>
				<s:if test="#request.posts.size < 1">
					<div class="list-group-item">
						没有新动态
					</div>
				</s:if>
				<s:iterator value="#request.posts">
					<div class="list-group-item">
						<s:a cssClass="text-muted h6" title="板块" action="visitBoard" namespace="/bbs">
							<s:param name="board.boardId" value="board.boardId"></s:param>
								【<s:property value="board.boardName"/>】
							</s:a>
						<s:a action="visitPost" namespace="/bbs">
							<s:param name="post.postId" value="postId"></s:param>
							<s:property value="postTitle"/>
						</s:a>
						<span class="pull-right">
							<s:date name="postCreatetime" format="MM-dd"/>
						</span>
					</div>
				</s:iterator>
			</div>
			<div class="col-md-12">
				<br>
				<s:include value="newgoods.jsp"></s:include>				
			</div>
			</div>
  	</div>
  	</div>
  <s:include value="/foot.html"></s:include>
  </body>
</html>
