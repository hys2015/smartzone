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
    <s:set var="pageTitle">分类浏览</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			bindDelete();
			bindConfirm();
		})
	</script>	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container">
		<div class="row">
			<h2>${pageTitle }</h2>
			<hr>
			<div class="col-md-3 col-md-offset-1">
				<s:a action="detail" namespace="/store">
					<s:param name="shop.sid" value="category.shop.sid"></s:param>
					<<商店首页
				</s:a>
				<div class="list-group">
				<s:iterator value="#request.categorys">
					<li class="list-group-item">
						<s:param name="category.cid" value="cid"></s:param>
					<s:a  title="点击查看该类别下的商品" action="showCategory" namespace="/store/goods">
						<s:param name="category.cid" value="cid"></s:param>
						<s:property value="cname"/>
					</s:a>
					<span class="label label-danger">
						<s:property value="goods.size"/>件商品
					</span>
					</li>
				</s:iterator>
				</div>
			</div>
			<div class="col-md-7">
				<div class="list-group">
					<s:if test="category != null">
						<br>
						当前显示类别:
						<label><s:property value="category.cname"/></label>
					</s:if>
					<s:iterator value="#request.goods">
					<s:if test="visible == 1">
						<li class="list-group-item">
							编号：<s:property value="gid"/>
							<br>
							商品名:
							<s:a action="detail" namespace="/store/goods">
								<s:param name="good.gid" value="gid"></s:param>
								<s:property value="gname"/>
							</s:a>
							
							<br>
							图片:
							<div class="row">
							 	<s:if test="imgs.size < 1">
									<img class="img-thumbnail" alt="<s:property value="gname"/>">
								</s:if>
								<s:iterator value="imgs">
									<div class="col-md-3">
										<img class="img-thumbnail" src='<s:property value="imgUrl"/>'>
									</div>
								</s:iterator>
							</div>
							<div>
								<del>
								￥<s:property value="price"/>
								</del>
								<b>
								￥<s:property value="nowprice"/>
								</b>
								折扣:<s:property value="(nowprice/price*100).intValue()"/>%
								<br>
								库存:<s:property value="quantity"/>
								<br>
								所属类别:
									<u>
									<s:property value="category.cname"/>
									</u>
							</div>
						</li>
						</s:if><!-- visible -->
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>