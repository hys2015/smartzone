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
    <s:set var="pageTitle">板块管理</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  <script type="text/javascript">
  	$(function(){
  		$("#updateBoard").hide();
  		$("#newBoard").hide();
  		$("#addBoard").click(function(){
  			$("#newBoard").toggle(100);
  		});
  		$(".update").click(function(){
  			//alert( $(this).parent().find("span.boardName").val());
  			$("#updateBoard").show();
  			$("#updateBoard").find("#boardId")
  				.val($(this).parent().parent().attr("data"));
  			$("#updateBoard").find("#boardName")
  				.val($(this).parent().parent().find("span.boardName").text().trim())
  				.focus();
  			$("#updateBoard").find("#represent")
  				.val($(this).parent().parent().find("span.represent").text().trim());
  		});
  		bindDelete();
  		
  	})
  	function validate(form){
			form.getElementsByTagName("input");
			for( var i = 0 ; i < form.length ; ++i ){
				if(form[i].value == null || form[i].value.trim() == "" ){
					alert("请将需要填写的内容填写上");
					return false;
				}
			}
			return true;
		}
  </script>
  
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<div>
				<h2>${pageTitle }</h2>
				<div class="text-right" id="addBoard">
					<a href="javascript:void(0)">添加新版块
					<i class="glyphicon glyphicon-plus"></i>
					</a>
				</div>
			</div>
			<s:form id="newBoard" onsubmit="return validate(this);"  action="addBoard" namespace="/bbs" cssClass="form-inline">
				<input class="form-control" type="text" name="board.boardName" placeholder="添加新版块">
				<input class="form-control" type="text" name="board.represent" placeholder="新版块描述">
				<input class="btn btn-default" type="submit" value="添加">
			</s:form>
			<hr>
			<label>当前板块</label>
			<div class="list-group">
				<s:iterator value="#request.boardlist">
					<li class="list-group-item"  data='<s:property value="boardId"/>'>
						<span class="boardName">
							<s:property value="boardName"/>
						</span>
						<s:if test="postCount">
						<span class="label label-danger">
							<s:property value="postCount"/>
						</span>
						</s:if>
						<s:url var="delURL" action="deleteBoard" namespace="/bbs">
							<s:param name="board.boardId" value="boardId"></s:param>
						</s:url>
						<span class="text-right pull-right">
						<a class="text update" href="javasript:void(0)">修改</a>
						<s:if test="postCount < 1">
							<a class="text-danger delete" href="${delURL }">删除</a>
						</s:if>
						<s:else>
							<small class="text-muted">
							板块内无内容时才可删除
							</small>
						</s:else>
						</span>
						<p>
						<small class="text-muted">
							<span class="represent">
							<s:property value="represent"/>
							</span>
						</small>
						</p>
					</li>
				</s:iterator>
				<a name="bottom"></a>
				<li id="updateBoard" class="list-group-item">
					<s:form action="updateBoard" namespace="/bbs">
						<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<div class="form-group">
							<label>板块名称</label>
							<input type="hidden" id="boardId" name="board.boardId">
							<input class="form-control" type="text" id="boardName" name="board.boardName">
						</div>
						<div class="form-group">
							<label>描述</label>
							<input class="form-control" type="text" id="represent" name="board.represent">
						</div>
						<input type="submit" class="btn btn-primary center-block" value="保存">
					</s:form>
				</li>
			</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>