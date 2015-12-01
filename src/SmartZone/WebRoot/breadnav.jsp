<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session.breadcrumb != null">
<ol class="breadcrumb">
	<s:iterator value="#session.breadcrumb" var="breaditem">
		<li>
			<a href='<s:property value="url"/>'>
				<s:property value="word"/>
			</a>
		</li>
	</s:iterator>
	<s:if test="category != null">
		<li>
			<s:a action="detail" namespace="/store">
				<s:param name="shop.sid" value="category.shop.sid"/>
				<s:property value="category.shop.sname"/>
			</s:a>
		</li>
	</s:if>
	<s:if test="good != null">
		<li>
			<s:a action="detail" namespace="/store">
				<s:param name="shop.sid" value="good.category.shop.sid"/>
				<s:property value="good.category.shop.sname"/>
			</s:a>
		</li>
	</s:if>
		<li>
			${pageTitle}
		</li>
</ol>
</s:if>
