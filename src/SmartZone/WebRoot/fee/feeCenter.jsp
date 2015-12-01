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
    <s:set var="pageTitle">缴费服务大厅</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
			<h2>${pageTitle }</h2>
				<div>
			      <ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active"><a href="#carportfee" aria-controls="carportfee" role="tab" data-toggle="tab">停车费</a></li>
				    <li role="presentation"><a href="#condofee" aria-controls="condofee" role="tab" data-toggle="tab">物业费</a></li>
				  </ul>
				  <div class="tab-content">
				  	<div role="tabpanel" class="tab-pane active" id="carportfee">
				    	<s:include value="carportFeePage.jsp"></s:include>
				    </div>
				  	<div role="tabpanel" class="tab-pane" id="condofee">
						<s:include value="userCondobills.jsp"></s:include>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>