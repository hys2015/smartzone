<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
 .badge{
 	background-color:#d9534f;
 }
</style>
<h4>分类导航</h4>
<s:if test="tag != null">
	<s:a cssClass="list-group-item" action="index" namespace="/store">全部店家</s:a>
</s:if>
<div class="list-group">
	<s:if test="#request.navTags.size < 1">
		<li class="list-group-item">暂无标签</li>
	</s:if>
	<s:iterator value="#request.navTags">
		<li class="list-group-item">
			<s:a action="tagShop" namespace="/store">
				<s:param name="tag.tid" value="tid"></s:param>
				<s:property value="title"/>
			</s:a>
			<span class="badge">
				<s:property value="shops.size"/>
				家店
			</span>
		</li>
	</s:iterator>
</div>