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
    <s:set var="pageTitle">收货地址管理</s:set>
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
				<h3>
				现有地址
				</h3>
				<s:if test="#session.message != null">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<s:property value="#session.message"/>
						<s:set name="#session.message" value="null"></s:set>
					</div>
				</s:if>
				
				<s:if test="#request.recaddrs.size < 1">
					<li class="list-group-item">还没有收货地址，去<a href="#add">添加一个吧</a></li>
				</s:if>
				<div class="row">
				<s:iterator value="#request.recaddrs">
					<div class="col-md-6">
						<li class="list-group-item">
							<span class="pull-right">
								<s:a action="del" cssClass="delete text-muted" namespace="/store/order/recaddr">
									<s:param name="recaddr.rid" value="rid"></s:param>
									<span class="glyphicon glyphicon-remove"></span>
								</s:a>
							</span>
							收货人：							
							<s:property value="name"/>
							<s:property value="phone"/>
							<br>
							地址：
							<s:property value="addr"/>
						</li>
					</div>
				</s:iterator>
				</div>
				<a name="add"></a>
				<p class="h3">添加新收货地址</p>
				<s:form onsubmit="return formvalidate(this);" action="add" namespace="/store/order/recaddr">
					<div class="form-group">
						<label>收货人姓名</label>
						<input placeholder="不要为空" type="text" class="form-control" size="20" name="recaddr.name">
					</div>
					<div class="form-group">
						<label>收货地址</label>
						<input placeholder="不要为空" type="text" class="form-control" name="recaddr.addr">
					</div>
					<div class="form-group">
						<label>联系电话</label>
						<input placeholder="不要为空" type="number" class="form-control" size="11" name="recaddr.phone">
					</div>
					<input type="submit" class="center-block btn btn-primary" value="添加">
				</s:form>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>