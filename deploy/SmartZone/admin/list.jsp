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
    <s:set var="pageTitle" value="'后台管理'"/>
    <title>后台管理</title>
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
				<h3>后台管理</h3>
				<div id="myTabs">
				  <!-- Nav tabs -->
				  <ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active"><a href="#user" aria-controls="admin" role="tab" data-toggle="tab">用户</a></li>
				    <li role="presentation"><a href="#admin" aria-controls="admin" role="tab" data-toggle="tab">管理员</a></li>
				    <li role="presentation"><a href="#community" aria-controls="community" role="tab" data-toggle="tab">小区</a></li>
				    <li role="presentation"><a href="#company" aria-controls="company" role="tab" data-toggle="tab">公司</a></li>
				  </ul>
				
				  <!-- Tab panes -->
				  <div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="user">
				    	<div>
				    		<h3>用户(共<s:property value="#request.users.size"/>名)</h3>
					    	<table class="table table-hover">
					    		<thead>
					    			<tr>
					    				<th>用户名</th>
					    				<th>联系方式</th>
					    				<th>地址</th>
					    				<th>所在小区(编号)名称</th>
					    			</tr>
					    		</thead>
					    		<tbody>
									<s:iterator value="#request.users">
					    			<tr>
					    				<td>
					    					<img width="50" height="50" src='<s:property value="img"/>'>
					    					<s:property value="username"/>
					    					<s:if test="isAdmin">
					    						<i class="label label-primary">管理员</i>
					    					</s:if>
					    					</td>
					    				<td><s:property value="userphone"/> </td>
					    				<td><s:property value="useraddr"/> </td>
					    				<td>
					    				(<s:property value="community.communityno"/>)
					    				<s:property value="community.communityname"/> </td>
					    				<td>
					    				<s:url var="roleURL" action="roleChange" namespace="/">
					    					<s:param name="user.username" value="username"></s:param>
					    				</s:url>
					    				<a class="btn btn-default" href="${roleURL }">
					    					<s:if test="isAdmin > 0">撤销</s:if>	<s:else>设为</s:else>管理员
					    				</a>
					    				</td>
					    			</tr>
									</s:iterator>
					    		</tbody>
					    	</table>
				    	</div>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="admin">
				    	<div>
					    	<table class="table table-hover">
					    		<thead>
					    			<tr>
					    				<th>管理员(共<s:property value="#request.admins.size"/>名)</th>
					    			</tr>
					    		</thead>
					    		<tbody>
									<s:iterator value="#request.admins">
					    			<tr>
					    				<td><s:property value="adminName"/></td>
					    			</tr>
									</s:iterator>
					    		</tbody>
					    	</table>
				    	</div>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="community">
						<div>
					    	<table class="table table-hover">
					    		<thead>
					    			<tr>
					    				<th>小区编号</th>
					    				<th>小区名称</th>
					    				<th>小区地址</th>
					    				<th>所属公司</th>
					    			</tr>
					    		</thead>
					    		<tbody>
									<s:iterator value="#request.communities">
					    			<tr>
					    				<td><s:property value="communityno"/></td>
					    				<td><s:property value="communityname"/></td>
					    				<td><s:property value="communityaddr"/></td>
					    				<td><s:property value="company.cname"/></td>
					    			</tr>
									</s:iterator>
					    		</tbody>
					    	</table>
				    	</div>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="company">
				    	<div>
					    	<table class="table table-hover">
					    		<thead>
					    			<tr>
					    				<th>公司编号</th>
					    				<th>名称</th>
					    				<th>地址</th>
					    				<th>电话</th>
					    				<th>邮箱</th>
					    			</tr>
					    		</thead>
					    		<tbody>
									<s:iterator value="#request.companys">
					    			<tr>
					    				<td><s:property value="cno"/></td>
					    				<td><s:property value="cname"/></td>
					    				<td><s:property value="caddr"/></td>
					    				<td><s:property value="cphone"/></td>
					    				<td><s:property value="cemail"/></td>
					    			</tr>
									</s:iterator>
					    		</tbody>
					    	</table>
				    	</div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>