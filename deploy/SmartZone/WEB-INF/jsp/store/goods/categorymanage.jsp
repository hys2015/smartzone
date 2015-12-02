<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<h4>列别管理</h4>
<div class="list-group">
	<small class="text-muted">分类下<b>无商品</b>时方可删除</small>
	<s:iterator value="#request.categorys">
		<li class="list-group-item">
			<s:param name="category.cid" value="cid"></s:param>
		<s:a  title="点击查看该类别下的商品" action="goodCategory" namespace="/store/goods">
			<s:param name="category.cid" value="cid"></s:param>
			<s:property value="cname"/>
		</s:a>
		<span class="label label-danger">
			<s:property value="goods.size"/>件商品
		</span>
		<span class="pull-right">
			<s:if test="goods.size < 1">
			<s:a cssClass="delete text-danger" action="delCategory" namespace="/store/goods">
				<s:param name="category.cid" value="cid"></s:param>
				<s:param name="shop.sid" value="shop.sid"></s:param>
			删除</s:a>
			</s:if>
		</span>
		</li>
	</s:iterator>
	<s:form onsubmit="return formvalidate(this,'请填写类别名称');" action="addCategory" namespace="/store/goods">
		<div>
		<input type="hidden" name="shop.sid" value='<s:property value='shop.sid'/>'>
		<input type="text" class="form-control" name="category.cname" placeholder="添加类别"> 
		<input type="submit" class="btn btn-default" value="添加">
		</div>
	</s:form>
</div>