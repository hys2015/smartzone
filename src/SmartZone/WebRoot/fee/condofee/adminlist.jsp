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
    <s:set var="pageTitle">物业费管理</s:set>
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
				<p>
				<b>以下显示的为当前小区(<s:property value="#session.logindata.obj.community.communityname"/>)的所有用户</b>
				</p>
				<hr>
				<s:include value="condofeeForm.jsp"></s:include>
				<div class="list-group">
					<s:if test="#request.fees.size < 0">
						<li class="list-group-item">
						没有物业费信息
						</li> 
					</s:if>
					<s:else>
					<li class="list-group-item active">
						当前信息
					</li>
					</s:else>
					<s:iterator value="#request.fees">
						<li class="list-group-item" bid='<s:property value="bid"/>'>
							用户:
							<span class="username">
							<s:property value="user.username"/>
							</span>
							开始日期:
							<span class="begintime">
							<s:date name="begintime" format="yyyy-MM-dd"/>
							</span>
							结束日期:
							<span class="endtime">
							<s:date name="endtime" format="yyyy-MM-dd"/>
							</span>
							费用总计:￥
							<b>
							<span class="price">
							<s:property value="price"/>
							</span>
							</b>
							状态:
							<s:if test="ispayed > 0">
								<span class="text-success">已支付</span>
							</s:if>
							<s:else>
								<span class="text-danger">未支付</span>
							</s:else>
							<span class="pull-right">
								<s:if test="!ispayed">
									<a class="update" href="javascript:void(0)">
									编辑
									</a>
								</s:if>
							</span>
						</li>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>