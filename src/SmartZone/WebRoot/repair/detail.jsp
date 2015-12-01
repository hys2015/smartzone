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
    <s:set var="pageTitle" value="#request.detail.rtitle"/>
    <title>报修详情-${pageTitle }</title>
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
			<div class="col-md-6 col-md-offset-3">
				<h3>报修详情</h3>
				<div>
					<small class="text-muted">(报修单在审核之后将不可修改)</small>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="h3">${detail.rtitle }
							<small>
							<s:if test="#request.detail.rstate == 1">
								<i class="label label-default">未审核</i>
							</s:if>
							<s:if test="#request.detail.rstate == 2">
								<i class="label label-warning">已审核</i>
							</s:if>
							<s:if test="#request.detail.rstate == 3">
								<i class="label label-success">正在维修</i>
							</s:if>
							<s:if test="#request.detail.rstate == 4">
								<i class="label label-info">已完成</i>
							</s:if>
							</small>
						</div>
						<small>
							<s:url var="delURL" action="delete">
								<s:param name="repair.rno" value="#request.detail.rno"></s:param>
							</s:url>
							<s:if test="#request.detail.rstate < 2 || #session.logindata.obj.isAdmin > 0">
								<s:url var="updURL" action="toUpdate" namespace="/repair">
									<s:param name="repair.rno" value="#request.detail.rno"></s:param>
								</s:url>
								<a href="${updURL }">编辑</a>
								<a class="pull-right text-danger" href="${delURL }">删除</a>
							</s:if>
						</small>
					</div>
					<div class="panel-body">
						<p>
							<s:url var="userURL" action="detail" namespace="/user">
								<s:param name="user.username">${detail.ruser }</s:param>
							</s:url>
								报修人:
							<a href="${userURL }">
								${detail.ruser }
							</a>
						</p>
						<p>
						时间:${detail.rtime }</p>
						<p>联系方式:<lead>${detail.rphone }</lead></p>
						<p>地址:${detail.raddr }</p>
						<div class="panel panel-primary">
							<div class="panel-body">
								<p>${detail.rcontent }
							</div>
						</div>
						<p>最后修改时间:${detail.rlastupdate }</p>
						<p>最后状态修改人(管理员)：
							<s:if test="#request.detail.rlastupdatorId != null">
								<s:url var="userURL" action="detail" namespace="/user">
									<s:param name="user.username">${detail.rlastupdatorId }</s:param>
								</s:url>
								<a href="${userURL }">
									<s:property value="#request.detail.rlastupdatorId"/>
								</a>
							</s:if>
							<s:else>
								<i class="label label-default">未查看</i>
							</s:else>
						</p>
						<s:if test="#session.logindata.obj.isAdmin > 0">
						<div class="text-center">
							<s:url var="opURL" action="changeState">
								<s:param name="repair.rno" value="#request.detail.rno"></s:param>
							</s:url>
							<div class="btn-group" role="group" aria-label="...">
								<s:if test="#request.detail.rstate != 1">
									<a class="btn btn-default" href="${opURL}&toState=1">未审核</a>
								</s:if>
								<s:if test="#request.detail.rstate != 2">
									<a class="btn btn-warning" href="${opURL}&toState=2">已审核</a>
								</s:if>
								<s:if test="#request.detail.rstate != 3">
									<a class="btn btn-success" href="${opURL}&toState=3">正在维修</a>
								</s:if>
								<s:if test="#request.detail.rstate != 4">
									<a class="btn btn-info" href="${opURL}&toState=4">已完成</a>
								</s:if>
							</div>
						</div>
						</s:if>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>