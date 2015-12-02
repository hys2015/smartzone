<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	<div class="h3">
		停车费交纳
		<span class="pull-right">
			<s:url var="carURL" action="toUnbind" namespace="/fee/carport"/>
			<a class="btn btn-default" href="${carURL }">解绑车位</a>
			<s:url var="carURL" action="toBind" namespace="/fee/carport"></s:url>
			<a class="btn btn-default" href="${carURL }">绑定车位</a>
			<s:url var="userbillURL" action="userCarbill" namespace="/fee/carport/carbill"></s:url>
			<a class="btn btn-default" href="${userbillURL }">停车费订单</a>
		</span>
	</div>
	<hr>
	<s:if test="#session.message != null">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<s:property value="#session.message"/>
		</div>
	</s:if>
	<div class="list-group">
		<s:if test="#request.mycarports.size < 1">
			<li class="list-group-item">
				您还没有
				<a href="${carURL }">
				绑定车位
				</a>
			</li>
		</s:if>
		<s:iterator value="#request.mycarports">
			<li class="list-group-item">
				<s:property value="carportId"/>号车位
				,费用:
				￥<s:property value="fee"/>/月
				<span class="pull-right">
					<s:url var="billURL" action="tobill" namespace="/fee/carport/carbill">
						<s:param name="carport.carportId" value="carportId"></s:param>
					</s:url>
					<a href="${billURL }">缴费</a>
				</span>
			</li>
		</s:iterator>
	</div>