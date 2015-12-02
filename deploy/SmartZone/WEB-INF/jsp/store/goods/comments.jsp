<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<h3>评论</h3>
<hr>
<s:if test="#request.comments.size < 1">
	<p class="text-muted">暂无评论</p>
</s:if>
<s:iterator value="#request.comments">
	<div class="list-group-item">
		<s:property value="username"/>
		<span class='pull-right'>
		<s:date name="createtime" format="MM-dd HH:mm"/>
		</span>
		<hr>
		<s:property value="content" escapeHtml="false"/>
	</div>
</s:iterator>