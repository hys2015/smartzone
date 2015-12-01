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
    <s:set var="pageTitle">确认支付</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<script type="text/javascript">
	$(function(){
		bindConfirm();
	})
</script>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<img src="/SmartZone/img/wechatpay.png" class="img-responsive" alt="微信支付">
					<s:url var="payURL" action="payCarbill" namespace="/fee/carport/carbill">
						<s:param name="carbill.bid" value="carbill.bid"></s:param>
					</s:url>
				<s:if test="condobill != null">
					<s:url var="payURL" action="payCondobill" namespace="/fee/condofee">
						<s:param name="condobill.bid" value="condobill.bid"></s:param>
					</s:url>
				</s:if>
				<a class="center-block btn btn-danger confirm" href="${payURL }">确认支付</a>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>