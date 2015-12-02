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
    <s:set var="pageTitle" value="'分类管理'"></s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  <script type="text/javascript">
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
		$(function(){
			bindDelete();
			$("#updateModal").bind("shown.bs.modal",function(event){
				 var button = $(event.relatedTarget);
				 $(this).find("#seriesId").val(button.parent().parent().attr("data"));
				 $(this).find("#seriesName")
				 	.val(button.parent().parent().find("span#seriesName").text().trim());
			});
		})
		
	</script>
  
<body>
<s:include value="/nav.jsp"></s:include>
<s:include value="seriesModalForm.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>${pageTitle }</h2>
				<s:if test="#session.message != null">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<s:property value="#session.message"/>
						<%session.removeAttribute("message"); %>
					</div>
				</s:if>
				<s:form cssClass="form-inline text-center" onsubmit="return validate(this);"  action="addSeries" namespace="/notice">
					<input class="form-control" type="text" name="series.seriesName">
					<input class="btn btn-default" type="submit" value="添加">
				</s:form>
				<label>
					当前分类
				</label>
				<div class="list-group">
					<s:iterator value="#request.series">
						<li class="list-group-item" data='<s:property value="seriesId"/>'>
						<span id="seriesName">
							<s:property value="seriesName"/>
						</span>
						<s:url var="delURL" action="deleteSeries" namespace="/notice">
							<s:param name="series.seriesId" value="seriesId"></s:param>
						</s:url>
							<span class="pull-right">
								<a data-toggle="modal" data-target="#updateModal">修改</a>
								<a class="delete text-danger" href="${delURL }">删除</a>
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