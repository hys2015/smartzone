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
    <s:set var="pageTitle">附近商家管理</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
				<s:if test="#request.shops.size < 1">
					<p class="text-center text-muted">附近还没有店铺</p>
				</s:if>
				<s:iterator value="#request.shops">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="pull-right">
								<s:if test="visible == 0 ">
									<span class="label label-default">未审核</span>
									<s:a cssClass="confirm text-success" action="open" namespace="/store">
										<s:param name="shop.sid" value="sid"></s:param>
										审核通过</s:a>
								</s:if>
								<s:else>
									<span class="label label-success">已审核</span>
									<s:a cssClass="confirm text-danger" action="close" namespace="/store">
										<s:param name="shop.sid" value="sid"></s:param>
										下线</s:a>
								</s:else>
							</span>
							店铺编号：
							<s:property value="sid"/>
							店铺名称:
							<s:property value="sname"/>
							店主:
							<s:a action="detail" namespace="/user">
								<s:param name="user.username" value="user.username"></s:param>
								<s:property value="user.username"/>
							</s:a>
						</div>
						<div class="panel-body">
							店铺地址:
							<b>
							<s:property value="addr"/>
							</b>
							联系电话:
							<b>
							<s:property value="phone"/>
							</b>
							微信号:
							<b>
							<s:property value="wechat"/>
							</b>
							QQ:
							<b>
							<s:property value="qq"/>
							</b>
							<br>
							<p>
							简介:
								<s:property value="represent"/>
							</p>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>