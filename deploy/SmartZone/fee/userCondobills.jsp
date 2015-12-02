<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="h3">
	物业费交纳
</div>
<hr>
<s:if test="#session.message != null">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<s:property value="#session.message"/>
	</div>
</s:if>
<div class="list-group">
	<s:if test="#request.condobills.size < 1">
		<li class="list-group-item">
			还没有您的物业费信息。
		</li>
	</s:if>
	<s:else>
		<li class="list-group-item active">
			您的物业费信息
		</li>
	</s:else>
	<s:iterator value="#request.condobills">
		<li class="list-group-item">
			有效期限:
			<s:date name="begintime" format="yyyy-MM-dd"/>至
			<s:date name="endtime" format="yyyy-MM-dd"/>
			价格总计:
			<s:property value="price"/>
			<s:if test="ispayed > 0">
				<span class="text-success">已付款</span>
			</s:if>
			<s:else>
				<span class="text-danger">未付款</span>
			</s:else>
			<span class="pull-right">
				<s:if test="ispayed < 1">
					<s:url var="toPay" action="toPay" namespace="/fee">
						<s:param name="condobill.bid" value="bid"></s:param>
					</s:url>
					<a href="${toPay }">去付款</a>
				</s:if>
			</span>
		</li>
	</s:iterator>
</div>