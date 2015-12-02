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
		#linearBg2 {
		
			  /* Safari 4-5, Chrome 1-9 */
			  background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#2E4CA6), to(#69B5F1));
			
			  /* Safari 5.1, Chrome 10+ */
			  background: -webkit-linear-gradient(top, #2E4CA6, #69B5F1);
			
			  /* Firefox 3.6+ */
			  background: -moz-linear-gradient(top, #2E4CA6, #69B5F1);
			
			  /* IE 10 */
			  background: -ms-linear-gradient(top, #2E4CA6, #69B5F1);
			
			  /* Opera 11.10+ */
			  background: -o-linear-gradient(top, #2E4CA6, #69B5F1);
			}
		body{
			background-size:100% 350px;
			background-repeat:no-repeat;
			background-image:url('img/bg1.jpg');
			background-color:#69B5F1;
		}
		.jumbotron{
			background-color:rgba(255,255,255,0.4);
			font-family:"微软雅黑";
			margin-top:-20px;
			margin-bottom:50px;
		}
		.main .container{
			background-color:rgba(255,255,255,0.9);
			padding:2em;
		}
		.navbar-default{
			background-color:rgba(0,0,0,0);
		}
		.navbar-default .navbar-nav>li>a
		   ,.navbar-default .navbar-brand{
			color:#fff;
		}
		.nav-pane{
			vertical-align:middle;
			float:right;
			margin-top:-1em;
			margin-right:9em;
			margin-left:-29em;
		}
		.a-panel{
			overflow:hidden;
			display:inline-block;
			width:70px;
			height:70px;
			margin:5px;
		}
		.a-panel>a{
			display:block;
			line-height:35px;
			font-size:30px;
			text-decoration:none;
			background-color:rgba(0,0,0,0.5);
			color:#fff;
		}
		.a-panel>.content{
			display:block;
			height:100%;
			width:70px;
		}
		.a-panel>.content>span{
			font-size: 50px;
    		line-height: 70px;
		}
		.transparent{
			display:inline-block;
			opacity:0;
			margin-right:165px;
		}
		.footer{
			width:100%;
			background-color:#fff;
			background-image:url('/SmartZone/img/fbg1.jpg');	
			background-size:100% 100%;
		}
		.footer .col-md-3,.footer .col-md-6 p{
			color:#fff;
		}
	</style>
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
