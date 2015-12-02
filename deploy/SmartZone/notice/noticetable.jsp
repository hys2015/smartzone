<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table class="table table-hover">
	<thead >
		<tr> 
			<th>公告名称	</th>
		<s:if test="pager == null">
			<th>板块</th>
		</s:if>
			<th>发布者</th>
			<th>发布时间	</th>
			<th>阅读量</th>
		<s:if test="#session.logindata.obj.isAdmin > 0">
			<th>最近修改时间</th>
			<th>操作	</th>
		</s:if>
		</tr>
	</thead>
	<tbody>
	<s:iterator value="#request.notice" var="not">
		<tr>
			<td>
				<s:url var="detURL" action="noticeDetail.action">
					<s:param name="tid" value="%{tid}"></s:param>
				</s:url>
				<a href="${detURL}">
					<s:property value="title"/>
				</a>
				<s:if test="priority == 10">
					<i class="label label-primary">置顶</i>
				</s:if>
				
				<s:if test="valiable == 0">
					<i class="label label-danger">已失效</i>
				</s:if>
			</td>
		<s:if test="pager == null">
			<td>
				<s:property value="series.seriesName"/>
			</td>
		</s:if>
			<td>
				<s:url var="userURL" action="detail" namespace="/user">
					<s:param name="user.username" value="author"></s:param>
				</s:url>
				<a href="${userURL }">
					<s:property value="author"/>
				</a>
			</td>
			<td>
				<s:date name="createtime" format="yyyy-MM-dd" />
			</td>
			<td>
				<s:property value="readcount"/>
			</td>
			
		<s:if test="#session.logindata.obj.isAdmin > 0">
			<td>
				<s:date name="modifiedtime" format="yyyy-MM-dd hh:mm:ss" />
			</td>
			<td>
			<s:url var="topURL" action="topNotice.action">
				<s:param name="tid" value="%{tid}"></s:param>
			</s:url>
			<s:url var="canURL" action="cancelNotice.action">
				<s:param name="tid" value="%{tid}"></s:param>
			</s:url>
			<s:url var="delURL" action="deleteNotice.action">
				<s:param name="tid" value="%{tid}"></s:param>
			</s:url>
			<s:url var="rstURL" action="resetNotice.action">
				<s:param name="tid" value="%{tid}"></s:param>
			</s:url>
			<s:if test="valiable > 0">
			<div class="btn-group">
				<s:if test="priority < 10">
					<a class="btn btn-default" href="${topURL }"><t class="text-primary">置顶</t></a>
				</s:if>
		    	<a class="btn btn-default" href="${canURL }">失效</a>
		    	<a class="btn btn-default" href="${rstURL }">重置</a>
		    	<a class="btn btn-danger"  href="${delURL }">删除</a>
			</div>
			</s:if>
			<s:else>
		    	<a class="btn btn-default" href="${rstURL }">重置</a>
				<a class="btn btn-danger"  href="${delURL }">删除</a>
			</s:else>
			</td>
		</s:if>
			
		</tr>
	</s:iterator>
	</tbody>
</table>