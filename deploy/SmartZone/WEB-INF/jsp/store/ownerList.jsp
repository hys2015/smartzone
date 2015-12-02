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
    <s:set var="pageTitle">我的商店</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>我的商店
					<span class="pull-right">
						<s:url var="toAddURL" action="toAddShop" namespace="/store"></s:url>
						<a class="btn btn-default" href="${toAddURL}">申请开店</a>
					</span>
				</h2>
				<hr>
				<s:if test="#request.shops.size < 1">
					<p class="text-center text-muted">你还没有店铺，可以
						<a class="btn btn-default" href="${toAddURL}">申请开店</a>
					</p>
				</s:if>
				<s:iterator value="#request.shops">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="pull-right">
								<s:a action="goodManage" namespace="/store/goods">
									<s:param name="shop.sid" value="sid"></s:param>
									商品管理</s:a>
								|
								<s:url var="updateShop" action="toUpdateShop" namespace="/store">
									<s:param name="shop.sid" value="sid"></s:param>
								</s:url>
								<a href="${updateShop}">
								信息编辑<span class="glyphicon glyphicon-pencil"></span>
								</a>
							</span>
							店铺编号：
							<s:property value="sid"/>
							店铺名称:
							<s:property value="sname"/>
							<s:if test="visible == 0 ">
								<span class="label label-default">不可见</span>
							</s:if>
							<s:else>
								<span class="label label-success">可见</span>
							</s:else>
						</div>
						<div class="panel-body">
							店铺地址:
							<b>
							<s:property value="addr"/>
							</b>
							联系电话:
							<b>
							<s:property value="phone"/>
							</b>
							微信号:
							<b>
							<s:property value="wechat"/>
							</b>
							QQ:
							<b>
							<s:property value="qq"/>
							</b>
							<br>
							简介:
							<s:property value="represent"/>
							<br>
							所属分类:
							<s:if test="tags.size < 1">
								<span class="text-muted">无分类</span>
							</s:if>
							<s:iterator value="tags">
								<span class="label label-danger">
									<s:property value="title"/>
								</span>
							</s:iterator>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>