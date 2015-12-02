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
    <s:set var="pageTitle" value="'编辑用户信息'"/>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
  <script type="text/javascript">
  $(function(){
  	$("#Pwd").hide();
  	$("#changePwd").bind("click",function(){
  		$("#Pwd").toggle(300);
  	});
  });
  </script>
  
<body>
<s:include value="/nav.jsp"></s:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<s:form action="update" namespace="/user">
					<div class="h3">
					个人信息
					</div>
						<s:actionmessage cssClass="text-center text-danger nav"/>
						<s:fielderror cssClass="text-center text-danger nav">
							<s:param>user.username</s:param>			
							<s:param>user.userpwd</s:param>
							<s:param>newPwd</s:param>
							<s:param>checkPwd</s:param>
						</s:fielderror>
					<div class="form-group">
						<label class="control-label">头像</label>
						<div>
							<img src="${user.img }" height="100" width="100">
							<s:url action="toUpload" namespace="/user" var="uploadURL"></s:url>
							<a href="${uploadURL }">更改头像
								<i class="glyphicon glyphicon-user"></i>
							</a>
						</div>
					</div>
					<div class="form-group">
						<a id="changePwd" class="pull-right" href="javascript:void(0)">修改密码<i class="glyphicon glyphicon-lock"></i></a>
						<label class="control-label">用户名</label>
						<input readonly="true" type="text" name="user.username" value="${user.username }"  class="form-control" placeholder="用户名" />
					</div>
						<div id="Pwd">
					<div class="form-group">
						<label class="control-label">旧密码</label>
						<input type="password" name="user.userpwd" class="form-control" placeholder="请输入旧密码" />
					</div>
					<div class="form-group">
						<label class="control-label">新密码</label>
						<input type="password" name="newPwd" class="form-control" placeholder="请输入新密码" />
					</div>
					<div class="form-group">
						<label class="control-label">确认新密码</label>
						<input type="password" name="checkPwd" class="form-control" placeholder="请再次输入新密码" />
					</div>
						</div>
					<div class="form-group">
						<label class="control-label">用户地址</label>
						<input type="text" name="user.useraddr" value="${user.useraddr }"  class="form-control" placeholder="地址" />
					</div>
					<div class="form-group">
						<label class="control-label">联系方式</label>
						<input type="text" name="user.userphone" value="${user.userphone }"  class="form-control" placeholder="联系方式" />
					</div>
					<div class="form-group">
						<label class="control-label">所属小区</label>
						<div class="dropdown">
						  <input id="dropdown-input" type="hidden" name="user.community.communityno" value="${user.community.communityno}">
						  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						        <span>
						        	${user.community.communityname}
						        </span>
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<s:iterator value="#request.communities" var="comm">
								<li><a addr='<s:property value="communityaddr"/>' data='<s:property value="communityno"/>'><s:property value="communityname"/></a></li>
							</s:iterator>
						  </ul>
						<span id="addr" class="text-muted"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-default center-block">保存</button>
				</s:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$(".dropdown-menu > li").bind("click",function(){
			//alert($(this).children().attr("data"));
			var o = $(this).children();
			$("#dropdownMenu1 > span:eq(0)").html(o.text());
			$("#dropdown-input").val(o.attr("data"));
			$("#addr").text("所在地址:" + o.attr("addr"));
		});
	})

</script>

<s:include value="/foot.html"></s:include>
</html>