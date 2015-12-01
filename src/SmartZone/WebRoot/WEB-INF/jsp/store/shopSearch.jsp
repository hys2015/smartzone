<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:form cssClass="form-inline" onsubmit="return formvalidate(this,'请输入关键词');" action="searchShop" namespace="/store">
	<div class="btn-group">
		<input class="btn btn-default" name="shop.sname" type="text" placeholder="搜索店名" >
		<input class="btn btn-default" type="submit" value="搜索">		
	</div>
</s:form>
<s:if test="kwd != null">
	<p class="text-center">以下是搜索关键词"<b><s:property value="kwd"/></b>"的结果</p>
</s:if>