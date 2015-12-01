<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="list-group">
	<s:if test="#request.boardlist != null">
		<li class="list-group-item list-group-item-info">
			<label>
			导航
			</label>
		</li>
		<s:iterator value="#request.boardlist">
			<s:url var="boardURL" action="showPosts" namespace="/bbs">
				<s:param name="board.boardId" value="boardId"></s:param>
			</s:url>
			<a class="list-group-item" href="${boardURL }">
				<s:property value="boardName"/>
				<span class="badge"><s:property value="postCount"/></span>
			</a>
		</s:iterator>
	</s:if>	
	<s:else>
		<li class="list-group-item">还没有板块</li>
	</s:else>
</div>
