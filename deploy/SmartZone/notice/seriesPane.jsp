<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="table table-hover">
	<s:if test="#request.notices.size < 1">
		<tr><td>还没有消息</td></tr>
	</s:if>
	<s:iterator value="#request.notices">
		<s:if test="valiable != 0">
		<tr>
			<td width="85%">
				<s:url var="detailURL" action="noticeDetail" namespace="/notice">
					<s:param name="tid" value="tid"></s:param>
				</s:url>
				<a href="${detailURL }">
					<s:property value="title"/>
				</a>
				<s:if test="createtime.date == new java.util.Date().date && createtime.month == new java.util.Date().month">
					<small class="label label-danger">new</small>
				</s:if>
				<s:if test="priority > 5">
					<small class="label label-primary">置顶</small>
				</s:if>
			</td>
			<td width="15%">
				<small class="text-muted">
					<s:date name="createtime" format="MM-dd"/>
				</small>
			</td>
		</tr>
		</s:if>
	</s:iterator>
</table>