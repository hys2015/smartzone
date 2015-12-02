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
    <s:set var="pageTitle">我的订单</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			bindCancel();
		})
	</script>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h2>${pageTitle }</h2>
			<hr>
			<s:if test="#request.orders.size < 1">
				暂无订单，去
				<s:a action="index" namespace="/store">
					逛逛
				</s:a>
				吧
			</s:if>
			<s:iterator value="#request.orders" var="order">
				<div class="list-group-item">
					<p>
					订单号:
					<s:property value="oid"/>
					</p>
					订单商品：
					<s:iterator value="items">
						<li class="list-group-item">
							<span class='pull-right'>
								<s:if test="#order.state == 1">
									<s:a cssClass="btn btn-default" action="toAdd" namespace="/store/comments">
										<s:param name="comment.gid" value="good.gid"></s:param>
										评价晒单</s:a>
								</s:if>
							</span>
							<div class="container-fluid">
							
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
								<s:a action="detail" namespace="/store/goods">
									<s:param name="good.gid" value="good.gid"></s:param>
									<s:property value="good.gname"/>
								</s:a>
								<br>
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
							</div>	
							</div>
						</li>
					</s:iterator>
					<div class="text-right">
						<br>
						总计:
						<span class="text-danger h4">
						￥
						<s:property value="price"/>
						</span>
					</div>
					<hr>
					<p>
					订单状态:
					<s:if test="state == 0">
						<span class="text-danger h3">
						未支付
						</span>
						<span class="pull-right">
							<s:a cssClass="cancel btn btn-default" 
								action="cancel" namespace="/store/order">
								<s:param name="order.oid" value="oid"></s:param>
								取消订单</s:a>
							<s:a action="toPay" namespace="/store/order" cssClass="btn btn-danger">
								<s:param name="order.oid" value="oid"></s:param>
								去支付</s:a>
						</span>
					</s:if>
					<span class="h3">
					<s:if test="state == 1">
						<span class='text-success'>
						已付款
						</span>
						</s:if>
					<s:if test="state == 2">已评价</s:if>
					</span>
					</p>
				</div>
			</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>