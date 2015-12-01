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
    <s:set var="pageTitle" value="shop.sname"></s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		.badge{
			background-color: #d9534f;
		}
	</style>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<li class="list-group-item">
					<b>
					<s:property value="shop.sname"/>
					</b>
				</li>
				<li class="list-group-item">
					店主:
					<b>
					<s:a action="detail" namespace="/user">
						<s:param name="user.username" value="shop.user.username"></s:param>
						<s:property value="shop.user.username"/>
					</s:a>
					</b>
				</li>
				<li class="list-group-item">
					店铺地址:
					<b>
					<s:property value="shop.addr"/>
					</b>
				</li>
				<li class="list-group-item">
					联系电话:
					<b>
					<s:property value="shop.phone"/>
					</b>
				</li>
				<li class="list-group-item">
					店家微信号:
					<b>
					<s:property value="shop.wechat"/>
					</b>
				</li>
			</div>
			<div class="col-md-9">
				<h2>${pageTitle }
					<s:if test="shop.user.username == #session.logindata.obj.username">
						<span class="pull-right">
							<s:a cssClass="btn btn-default" action="toUpdateShop" namespace="/store">
								<s:param name="shop.sid" value="shop.sid"></s:param>
								商店信息编辑<span class="glyphicon glyphicon-pencil">
							</s:a>
							<s:a cssClass="btn btn-default" action="goodManage" namespace="/store/goods">
								<s:param name="shop.sid" value="shop.sid"></s:param>
								管理商品</s:a>
						</span>
					</s:if>
				</h2>
				<hr>
				<div></div>
				<s:action name="goods" namespace="/store/goods" executeResult="true">
					<s:param name="shop.sid" value="shop.sid"></s:param>
				</s:action>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>