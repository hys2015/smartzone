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
    <s:set var="pageTitle">车位</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			bindDelete();
		})
		function validate(form){
			form.getElementsByTagName("input");
			for( var i = 0 ; i < form.length ; ++i ){
				if(form[i].value == null || form[i].value.trim() == "" ){
					alert("请输入内容");
					return false;
				}
			}
			return true;
		}
	</script>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>${pageTitle }</h2>
				<s:if test="#session.logindata.obj.isAdmin > 0">
					<s:include value="carportForm.jsp"></s:include>
				</s:if>
				<hr>
				<div class="list-group">
					<s:if test="#request.carports == null">
						<li class="list-group-item">
							无车位信息
						</li>
					</s:if>
					<s:iterator value="#request.carports">
						<li class="list-group-item">
							<i class="glyphicon glyphicon-ok"></i>
							<span id="id">
								<s:property value="carportId"/>
							</span>号车位
							费用:
							<s:if test="fee == null">
								<small class="text-muted">暂无</small>
							</s:if>
							<s:else>
								￥
								<span id="fee">
								<s:property value="fee"/>
								</span>
								/月
							</s:else>
							<s:if test="user == null">
								<small class="text-muted">暂无用户使用</small>
							</s:if>
							<s:else>
								所有者:<s:property value="user.username"/>
							</s:else>
							<s:if test="#session.logindata.obj.isAdmin > 0">
								<span class="pull-right">
									<a href="javascript:void(0)" class="update" data-target="#updateCarport" data-toggle="modal">编辑</a>
									<s:if test="user == null">
										<s:url var="delURL" action="delete" namespace="/fee/carport">
											<s:param name="carport.carportId" value="carportId"></s:param>
										</s:url>
										<a class="delete text-danger" href="${delURL }">删除</a>
									</s:if>
								</span> 
							</s:if>
						</li>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>