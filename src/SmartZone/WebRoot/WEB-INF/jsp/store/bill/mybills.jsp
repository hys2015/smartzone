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
    <s:set var="pageTitle">账单</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			bindConfirm();
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
				<label>当前店铺:
					<s:property value="shop.sname"/>
				</label>
				<s:if test="#request.bills.size < 1">
					您的店还没有账单
				</s:if>	
				<s:iterator value="#request.bills">
					<div class="list-group-item">
						<span class="pull-right">
							收货人:
							<br>
							<s:property value="recaddr.name"/>
							<s:property value="recaddr.phone"/>
							<br>
							<s:property value="recaddr.addr"/>
						</span>
					
						商品编号:
						<s:property value="item.good.gid"/>
						<br>
						名称:
						<s:property value="item.good.gname"/>
						<br>
						数量:
						<s:property value="item.quantity"/>
						<hr>
							<span class="pull-right">
								<div class="btn-group">
								<s:if test="state != 1">
								<s:a cssClass="confirm btn btn-danger" action="sent" namespace="/store/bill">
									<s:param name="bill.bid" value="bid"></s:param>
									发货
								</s:a>
								</s:if>
								<s:if test="state != 2">
								<s:a cssClass="confirm btn btn-danger" action="arrived" namespace="/store/bill">
									<s:param name="bill.bid" value="bid"></s:param>
									已发到
								</s:a>
								</s:if>
								</div>
							</span>
							<span class="h3 text-danger">
							￥<s:property value="price"/>
							</span>
							<br>
						状态:
						<s:if test="state == 0">
							已付款
							<br>
							<span class="text-muted h6">
							付款时间:
							<s:date name="createtime" format="yyyy-MM-dd HH:mm:ss"/>
							</span>
							</s:if>
						<s:if test="state == 1">
							在路上
							<br>
							<span class="text-muted h6">
							<s:date name="updatetime" format="yyyy-MM-dd HH:mm:ss"/>
							</span>
						</s:if>
						<s:if test="state == 2">
							已送达
							<br>
							<span class="text-muted h6">
							<s:date name="updatetime" format="yyyy-MM-dd HH:mm:ss"/>
							</span>
						</s:if>
							<br>
					</div>
					<br>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>