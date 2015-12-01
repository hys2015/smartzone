<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
  <head>
		<style type="text/css">
		.title{
			display:inline-block;
			width:60%;
			white-space:nowrap;
			overflow:hidden;
			text-overflow:ellipsis;
		}
	</style>	
  </head>
<label>发帖达人</label>
<div class="list-group">
	<s:iterator value="#request.replystar">
		<s:url var="vuserURL" action="detail" namespace="/user">
			<s:param name="user.username" value="username"></s:param>
		</s:url>
		<a class="list-group-item" title='<s:property value="username"/>' href="${vuserURL }">
			<img class="user_icon" src='<s:property value="img"/>'/>
			<span class="title">
				<s:property value="username"/>
				<s:if test="username == #session.logindata.obj.username">
					<i class="label label-primary">我</i>
				</s:if>
			</span>
		</a>
	</s:iterator>
</div>