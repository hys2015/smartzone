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
    <s:set var="pageTitle">我的购物车</s:set>
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
				<h2>${pageTitle }</h2>
				<hr>
				<s:if test="#session.logindata.cart.items.size < 1">
					您的购物车空空如也 
				</s:if>
				<s:else>
				<s:form action="toAdd" namespace="/store/order">
					<s:iterator value="#session.logindata.cart.items">
						<li class="list-group-item">
						<div class="container-fluid">
						
							<span class="pull-right">
								<s:a cssClass="text-muted" action="del" namespace="/store/cart">
									<s:param name="good.gid" value="good.gid"></s:param>
									<span class="glyphicon glyphicon-trash"></span>
								</s:a>
							</span>
							<div class="col-md-3">
								<img class="img-responsive"
									 alt="<s:property value='good.gname'/>"
									 src='<s:property value='good.imgs[0].imgUrl'/>'>
							</div>
							<div class="col-md-9">
								<p>
									<s:a action="detail" namespace="/store">
										<s:param name="shop.sid" value="good.category.shop.sid"></s:param>
										<s:property value="good.category.shop.sname"/> >>
									</s:a>
								</p>
									<p>
									<s:property value="good.gname"/>
									￥<span class="h3">
										<s:property value="good.nowprice"/>
									</span>
									<br>
									当前库存:
									<small class="text-muted"> (时间<s:date name="new java.util.Date()" format="HH:mm"/>)</small>
									<br>
									<span class="h3">
									<s:property value="good.quantity"/>
									</span>
									</p>
								<input type="hidden" name="gids" value='<s:property value="good.gid"/>'>
							</div>
						</div>
						</li>
					</s:iterator>
					<hr>
					<p class="text-right">
						<s:a action="index" namespace="/store" cssClass="btn btn-default">再逛逛</s:a>
						<input class="btn btn-primary" type="submit" value="去下单">
					</p>
				</s:form>
				</s:else>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>