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
    <s:set var="pageTitle">附近商家</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
	<style type="text/css">
		.shop-pane{
			min-height:450px;
		}
		a:hover{
			text-decoration:none;
		}
	</style>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
			 	<s:action name="tagNav" namespace="/store" executeResult="true"></s:action>
			</div>
			<div class="col-md-10">
				<h2>${pageTitle }
				<span class="pull-right">
					<s:if test="#session.logindata.obj.isAdmin > 0">
					<s:a cssClass="btn btn-danger" action="adminShow" namespace="/store">
						商店审核</s:a>
					</s:if>
					<s:url var="ownerShopURL" action="ownerShop" namespace="/store"></s:url>
					<a class="btn btn-default" href="${ownerShopURL }">我的商店</a>
				</span>
				</h2>
				<hr>
				<div class="text-center">
					<s:include value="shopSearch.jsp"></s:include>
				</div>
				<s:if test="#request.shops.size < 1">
					<p class="text-center text-muted">
						您附近暂时没有商家
					</p>
				</s:if>
				<s:iterator value="#request.shops">
				<div class="col-md-4 shop-pane">
					<div class="thumbnail">
						<s:set var="imgURL" value="defaultImg"></s:set>
						<s:if test="imgs.size > 0">
							<s:set var="imgURL" value="imgs[0].imgUrl"></s:set>
						</s:if>
						<s:if test="#session.logindata.obj.username == user.username">
							<span class="pull-right h6 text-primary" title="您是这家店的店主">我的店</span>
						</s:if>
						<!-- title -->
						<h3 class="text-center">
							<s:a action="detail" namespace="/store">
								<s:param name="shop.sid" value="sid"></s:param>
							<s:property value="sname"/>
							</s:a>
						</h3>
						<p class='text-center'>
							<s:if test="tags.size < 1">
								<span class="text-muted">
								暂无标签
								</span>
							</s:if>
							<s:iterator value="tags">
								<span class="label label-danger">
									<s:property value="title"/>
								</span>
							</s:iterator>
						</p>
						<img class="img-thumbnail" src="${imgURL }">
						<hr>
						<div class="list-group">
							<li class="list-group-item">
								<s:if test="represent == null">
									<span class="text-muted">暂无简述</span>
								</s:if>
								<s:property value="represent"/>
							</li>
						</div>
							<s:a action="detail" namespace="/store" cssClass="btn btn-primary center-block">
								<s:param name="shop.sid" value="sid"></s:param>
							<b>进店看看</b>
							</s:a>
					</div>
				</div>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>