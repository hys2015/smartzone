<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
	<script type="text/javascript">
		$(function(){
			$("li.community").tooltip();
		})
	</script>
</head>

<nav class="navbar navbar-default navbar-static-top no-border">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#smartzone-navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.action">
				<img width="36" height="36" style="display:inline-block;" src="${pageContext.request.contextPath }/img/smartzone_noword.png">
				<span class="h3">智慧社区</span>
				</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="smartzone-navbar-collapse-1">
			<s:if test="#session.logindata.Type=='user'">
			
			<ul class="nav navbar-nav">
				<s:if test="#session.logindata != null">
					<li class="community" data-toggle="tooltip" data-placement="bottom" title='${logindata.obj.community.communityaddr }'>
						<a>
						${logindata.obj.community.communityname }
						</a>
					</li>
				</s:if> 
				<li>
					<s:url var="noticeCenter" action="noticeCenter" namespace="/notice"></s:url>
					<a href="${noticeCenter }">
						信息中心
						<span class="glyphicon glyphicon-bullhorn"></span>
					</a>
				</li>
				<li class="dropdown">
		          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		          	社区服务
		          		<s:if test="#session.logindata.obj.isAdmin > 0 && ( #application.Notification.unread_repair_num > 0 || #application.Notification.unread_feedback_num )">
			          		<i class="mybadge"></i>
			          		</s:if>
		          	<span class="caret"></span>
		          </a>
		          <ul class="dropdown-menu">
		            <li>
		            	<s:url var="feeURL" action="feeCenter" namespace="/fee" ></s:url>
		            	<a href="${feeURL }">费用缴纳
		            		<i class="glyphicon glyphicon-jpy"></i>
		            	</a>
		            </li>
		            <li role="separator" class="divider"></li>
		            <li><a href="${pageContext.request.contextPath }/repair/toAdd.action">物件报修
		            	<i class="glyphicon glyphicon-alert"></i>
		            	</a></li>
		            <li role="separator" class="divider"></li>
		            <s:url var="feedbackURL" action="show" namespace="/feedback"></s:url>
		            <li>
		            	<a href="${feedbackURL }">
		            		留言投诉
		            		<i class="glyphicon glyphicon-comment"></i>
		            		<s:if test="#application.Notification.unread_feedback_num > 0">
			          		<i class="label label-danger">new</i>
			          		</s:if>
		           		</a>
		           	</li>
		          </ul>
		        </li>
		        <li>
		        	<s:url var="bbsURL" action="listAllBoards" namespace="/bbs"></s:url>
		        	<a href="${bbsURL }">左邻右里
		        		<span class="glyphicon glyphicon-tasks"></span>
		        	</a>
		        </li>
		        <li>
		        	<s:url var="storeURL" action="userShow" namespace="/store"></s:url>
		        	<a href="${storeURL }">附近商家
		        		<span class="glyphicon glyphicon-gift"></span>
		        		</a>
		        </li>
		        <s:if test="#session.logindata.obj.isAdmin > 0">
		        <li>
		        	<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
		          	管理维护
		          	<span class="caret"></span>
		          </a>
		          <ul class="dropdown-menu">
		            <li>
		          		<s:url action="adminShow" namespace="/fee/condofee" var="condofeeURL"></s:url>
		          		<a href="${condofeeURL }">物业费管理</a>
          			</li>
          			<li role="separator" class="divider"></li>
		            <li>
		          		<s:url action="adminShow" namespace="/fee/carport/carbill" var="carbillURL"></s:url>
		          		<a href="${carbillURL }">车费订单管理</a>
          			</li>
		            <li>
		          		<s:url action="show" namespace="/fee/carport" var="carportURL"></s:url>
		          		<a href="${carportURL }">车位管理</a>
          			</li>
          			<li role="separator" class="divider"></li>
	          		<li>
		          		<a href="${pageContext.request.contextPath }/repair/showAll.action">报修反馈
			          		<s:if test="#application.Notification.unread_repair_num > 0">
			          		<i class="label label-danger">new</i>
			          		</s:if>
		          		</a>
	          		</li>
		          </ul>
		        </li>
		        </s:if>
			</ul>
			</s:if>
			<ul class="nav navbar-nav navbar-right">
				<s:if test="#session.logindata == null">
					<s:url var="loginURL" value="/login.jsp" namespace="/">
					</s:url>
					<li><a href="${loginURL }">登录</a></li>
				</s:if>
				<s:else>
					<s:if test="#session.logindata.Type != 'admin' ">
				<li>
					<s:a title="购物车" action="index" namespace="/store/cart">
					<span class="glyphicon glyphicon-shopping-cart"></span>
					(<span id="cartsize">
					<s:if test="#session.logindata.cart == null">0</s:if>
					<s:property value="#session.logindata.cart.items.size"/>
					</span>)
					</s:a>
				</li>
					</s:if>
				<li class="dropdown">
		     	  <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<s:if test="#session.logindata.Type != 'admin'">
						<img class="img-circle user_icon" src='${logindata.obj.img }'/>
						<s:if test="#session.logindata.obj.isAdmin > 0">
							<span class="label label-primary">管理员</span>
						</s:if>
							<u>${session.logindata.obj.username}</u>
					</s:if>
						<s:else>
							<i class="glyphicon glyphicon-user"></i>
							<u>${session.logindata.obj.adminName }</u>
						</s:else>	
					<span class="caret"></span></a>
	          		<ul class="dropdown-menu">
						<s:if test="#session.logindata.Type == 'user'">
							<li>
								<s:url var="userdetailURL" action="detail" namespace="/user"></s:url>
								<a href="${userdetailURL }">我的资料</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<s:url var="myFeedbackURL" action="myFeedback" namespace="/feedback"></s:url>
								<a href="${myFeedbackURL }">我的留言</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<s:url var="myRepairURL" action="show" namespace="/repair"></s:url>
								<a href="${ myRepairURL}">我的报修记录</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<s:a action="show" namespace="/store/order/recaddr">
									我的收货地址</s:a>
							</li>
							<li>
								<s:a action="userShow" namespace="/store/order">
									我的订单</s:a>
							</li>
						</s:if>
						<s:if test="#session.logindata.Type == 'admin'">
						<!-- 管理员 -->
							<li>
								<s:url var="manageURL" action="show" namespace="/admin"></s:url>
								<a href="${manageURL }">后台管理</a>
							</li>
							<li>
								<s:url var="adminDetail" action="adminDetail" namespace="/admin"></s:url>
								<a href="${adminDetail }">修改密码</a>
							</li>
						</s:if>
						<li role="separator" class="divider"></li>
						<li>
						<s:url var="ulogoutURL" action="logout.action" namespace="/"></s:url>
						<a href="${ulogoutURL }">退出登录</a>
						</li>
	          		</ul>
				</s:else>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<s:include value="/breadnav.jsp"/>
