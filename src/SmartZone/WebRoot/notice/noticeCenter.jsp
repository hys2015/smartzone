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
    <s:set var="pageTitle">信息中心</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
	<style type="text/css">
		div.series-pane{
			min-height:270px;
		}
		.table{
			table-layout:fixed;
		}
		td{
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
		}
		.label{
			padding: 0.1em .3em .2em;
			position: relative;
    		bottom: 0.2em;
		}
	</style>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h1>信息中心
					<s:if test="#session.logindata.obj.isAdmin > 0">
						<div class="btn-group pull-right">
							<s:url var="addURL" action="toAddSeries" namespace="/notice"></s:url>
							<a class="btn btn-default" href="${addURL }">分类管理</a>
							<s:url var="addURL" action="toAdd" namespace="/notice"></s:url>
							<a class="btn btn-primary" href="${addURL }">信息发布</a>
						</div>
					</s:if>
				</h1>
				<s:include value="noticeSearch.jsp"></s:include>
				<hr>
				<s:if test="#request.series.size < 1">
					<h2 class="text-muted text-center">您所在的小区内没有找到信息</h2>
				</s:if>
				<s:iterator value="#request.series">
					<div class="col-md-6 series-pane">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div>
								<label>
									<s:property value="seriesName"/>
								</label>
								<span class="pull-right">
									<s:url var="moreURL" action="showNotice" namespace="/notice">
										<s:param name="seriesId" value="seriesId"></s:param>
									</s:url>
									<a class="btn btn-default" href="${moreURL }" title="查看全部">
										<i class="glyphicon glyphicon-menu-hamburger"></i>
									</a>
								</span>
								</div>
							</div>
							<s:action name="seriesPane" namespace="/notice" executeResult="true">
								<s:param name="series.seriesId" value="seriesId"></s:param>
							</s:action>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>