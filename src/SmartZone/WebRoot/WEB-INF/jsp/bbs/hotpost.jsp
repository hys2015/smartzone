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
<label>热门top10</label>
<div class="list-group">
	<s:if test="#request.hotpost == null || #request.hotpost.size < 1">
		<li class="list-group-item">
			请
			<a href="#createPost">
			发帖
			</a>
		</li>
	</s:if>
	<s:iterator value="#request.hotpost">
		<s:url var="vpostURL" action="showReplies">
			<s:param name="post.postId" value="postId"></s:param>
		</s:url>
		<a class="list-group-item" title='<s:property value="postTitle"/>' href="${vpostURL }">
			<span class="title">
			<s:property value="postTitle"/>
			</span>
			<i class="pull-right label label-danger">
				heat
				<s:property value="postReplytimes"/>
			</i>
		</a>
	</s:iterator>
</div>