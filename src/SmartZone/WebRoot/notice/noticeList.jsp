<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <s:set var="pageTitle" value="'公告板'"/>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"/>
	
	</head>
  
  <body >
  	<s:include value="/nav.jsp"></s:include>
  	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="h3">
					<s:if test="pager != null">
						<!-- 判断是否为搜索结果页面，noticetable也有相似的语句 -->
						<s:property value="#request.notice[0].series.seriesName"/>
					</s:if>
					<s:else>
						搜索结果
					</s:else>
				
				</div>
				<s:include value="noticeSearch.jsp"></s:include>
				<hr>
				<s:if test="#request.notice.size > 0 ">
					<s:include value="noticetable.jsp"></s:include>
		    		<s:include value="noticepager.jsp"></s:include>
				</s:if>
				<s:else>
					<div class="h3 text-muted">没有要显示的内容</div>
				</s:else>
			</div>
		</div>
	</div>
  </body>
  <s:include value="/foot.html"></s:include>
</html>
