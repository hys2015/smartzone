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
    <s:set var="pageTitle" value="'登陆'"></s:set>
	<title>${pageTitle }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		#carousel-example-generic{
			position:absolute;
			display:inline-block;
			z-index:-200;
			margin:auto;
			width:80%;
		}
		#carousel-example-generic img{
			height:328px;
		}
		.login-pane{
			float:right;
			width:30%;
		}
	</style>
  </head>
  <script type="text/javascript">
  	$(document).ready(function(){
	  	$("#idselect > li > a").on("click",function(){
	  		$("#dropdownMenu1 > txt").text(this.text);
			if(this.text == "用户"){
				$("form:eq(0)").attr("action","user/login.action");
				$("input:eq(0)").attr("name","user.username");
				$("input:eq(1)").attr("name","user.userpwd");
			}else{
				$("form:eq(0)").attr("action","admin/login.action");
				$("input:eq(0)").attr("name","admin.adminName");
				$("input:eq(1)").attr("name","admin.adminPwd");
			}
	  	});
  	}
  	)
  
  </script>
  <body>
	<s:include value="/nav.jsp"></s:include>
	<div class="container">
			<div class="row">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
				  </ol>
				
				  <!-- Wrapper for slides -->
				  <div class="carousel-inner" role="listbox">
				    <div class="item active">
				      <img src="img/banner/repair_banner.gif" alt="0">
				    </div>
				    <div class="item">
				      <img src="img/banner/bbs_banner.gif" alt="1">
				    </div>
				    <div class="item">
				      <img src="img/banner/store_banner.gif" alt="2">
				    </div>
				  </div>
			</div>
			<div class="login-pane">
				<div class="panel panel-primary">
					<div class="panel-heading">
					<h4 class="text-center">登录</h4>
					</div>
					<div class="panel-body">
						<div class="text-center text-primary nav">
							<s:property value="#session.message"/>
						</div>
						<s:actionmessage cssClass="text-center text-primary nav"/>
						<s:actionerror cssClass="text-center text-danger nav"/>
						<s:fielderror cssClass="text-center text-danger nav"/>
					<form action="user/login.action" method="post">
					<div class="form-group has-feedback">
						<label class="control-label">用户名</label>
						<input type="text" name="user.username"  class="form-control" placeholder="用户名" />
						<i class="glyphicon glyphicon-user form-control-feedback"></i>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label">密码</label>
						<input type="password" name="user.userpwd" class="form-control" placeholder="请输入密码" />
						<i class="glyphicon glyphicon-lock form-control-feedback"></i>
					</div>
					<br>
					<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					    <txt>用户</txt>
					    <span class="caret"></span>
					  </button>
					  <ul id="idselect" class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li><a>管理员</a></li>
					    <li><a>用户</a></li>
					  </ul>
						<span class="pull-right">
							<button type="submit" class="btn btn-primary">登&nbsp;&nbsp;录</button>
						</span>
					</div>
					</form>
					</div>
				</div><!-- panel -->
			</div>
		</div>
	</div>
  </body>
  <s:include value="/foot.html"></s:include>
</html>
