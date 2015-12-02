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
    <s:set var="pageTitle">编辑商家信息</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  <script type="text/javascript">
  	$(function(){
  		bindDelete();
  		shoptagsFunc();
  		shopimgsFunc();
  	})
  </script>
  
<body>
<s:include value="/nav.jsp"></s:include>
<s:include value="tagmodalform.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>${pageTitle }</h2>
				<hr>
				<s:actionerror cssClass="text-danger"/>
				<s:form onsubmit="return validateNecessary(this);" action="addShop" namespace="/store">
					<s:if test="#request.shop != null">
						<div>
							<input type="hidden" name="shop.sid" value='<s:property value="shop.sid"/>' >
						</div>
						<s:include value="shopimgs.jsp"></s:include>
						<s:include value="shoptags.jsp"></s:include>
					</s:if>
					<p>
						<b class="text-danger">带*的项必填</b>
					</p>
					<div class="form-group">
						<label>店铺名称*</label>
						<input type="text" class="form-control necessary" value="${shop.sname }" name="shop.sname">
					</div>
					<div class="form-group">
						<label>店铺地址*</label>
						<input type="text" class="form-control necessary" value="${shop.addr }" name="shop.addr">
					</div>
					<div class="form-group">
						<label>联系电话*</label>
						<input type="text" class="form-control necessary" value="${shop.phone }" name="shop.phone">
					</div>
					<div class="form-group">
						<label>微信号</label>
						<input type="text" class="form-control" value="${shop.wechat }" name="shop.wechat">
					</div>
					<div class="form-group">
						<label>QQ号</label>
						<input type="number" class="form-control" value="${shop.qq }" name="shop.qq">
					</div>
					<div class="form-group">
						<label>店铺简介</label>
						<input type="text" class="form-control" name="shop.represent" value="${shop.represent }">
					</div>
					<input type="submit" class="btn btn-primary" value="提交">
				</s:form>
			</div> 
		</div>
	</div>
	
</body>
<s:include value="/foot.html"></s:include>
</html>