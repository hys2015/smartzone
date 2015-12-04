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
    <s:set var="pageTitle">商品管理</s:set>
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
					<s:param name="shop.sid" value="shop.sid"></s:param>
					<<商店首页
				</s:a>
				<s:include value="categorymanage.jsp"></s:include>
			</div>
			<div class="col-md-7">
				<div class="list-group">
					<s:if test="category != null">
						<s:a action="goodManage" namespace="/store/goods">
							<s:param name="shop.sid" value="category.shop.sid"></s:param>
							全部商品
						</s:a>
						<label><s:property value="category.cname"/></label>
					</s:if>
					<p>温馨提示：添加商品时，请先添加好类别再添加商品!</p>
					<s:iterator value="#request.goods">
						<li class="list-group-item">
							<span class="pull-right">
								<s:a cssClass="delete text-danger" action="del" namespace="/store/goods">
									<s:param name="good.gid" value="gid"></s:param>
									删除	</s:a>
								<s:a cssClass="update" action="toUpdate" namespace="/store/goods">
									<s:param name="good.gid" value="gid"></s:param>
									编辑	</s:a>
							</span>
							编号：<s:property value="gid"/>
							<br>
							商品名:<s:property value="gname"/>
							<s:if test="visible == 1">
								<span class="label label-danger">在架上</span>
								<s:a cssClass="confirm text-danger" action="awayShelf" namespace="/store/goods">
									<s:param name="good.gid" value="gid"></s:param>
									下架	</s:a>
							</s:if>
							<s:else>
								<span class="label label-default">未上架</span>
								<s:a cssClass="onfirm text-danger" action="onShelf" namespace="/store/goods">
									<s:param name="good.gid" value="gid"></s:param>
									上架	</s:a>
							</s:else>
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
					</s:iterator>
				</div>
			</div>
			<s:if test="category == null">
			<div class="col-md-1">
				<s:a cssClass="btn btn-default" action="toAdd" namespace="/store/goods">
					<s:param name="shop.sid" value="shop.sid"></s:param>
					新增商品</s:a>
			</div>
			</s:if>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>