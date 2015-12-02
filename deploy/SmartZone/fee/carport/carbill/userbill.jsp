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
    <s:set var="pageTitle">用户订单</s:set>
    <title>${pageTitle }</title>
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
			<div class="col-md-8 col-md-offset-2">
				<h2>${pageTitle }</h2>
				<div class="list-group">
					<s:if test="#request.list.size < 1">
						<li class="list-group-item">
							您还没有停车费订单
						</li>
					</s:if>
					<s:iterator value="#request.list">
						<li class="list-group-item">
							订单号:
							<s:property value="bid"/>
							车位号:
							<s:property value="carport.carportId"/>
							价格:
							￥
							<s:property value="carport.fee"/>/月
							生效时间:
							<s:date name="begintime" format="yyyy-MM-dd"/>
							到期时间：
							<s:date name="endtime" format="yyyy-MM-dd"/>
							总计:
							<s:property value="fee"/>元
							<s:if test="ispayed > 0">
								<span class="text-muted">已支付</span>
							</s:if>
							<s:else>
								<span class="text-danger">未支付</span>
								<span class="pull-right">
									<s:url var="topayURL" action="toPay" namespace="/fee">
										<s:param name="carbill.bid" value="bid"></s:param>
									</s:url>
									<a href="${topayURL }">去支付</a>
								</span>
							</s:else>
						</li>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>