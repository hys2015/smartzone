<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <s:set var="pageTitle" value="'报修清单'"/>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		$(function(){
			bindDelete();
		})
	</script>
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="h4">报修记录</div>
				<table class="table table-hover">
					<thead >
						<tr> 
							<th>
							内容
							</th>
							<th>
							地址
							</th>
							<th>
							时间
							</th>
						<s:if test="#session.logindata.obj.isAdmin > 0">
							<th>发布人</th>
						</s:if>
							<th>-</th>
						</tr>
					</thead>
					<tbody>
					<s:iterator value="#request.repairlist" var="list">
						<tr>
							<td>
								<s:url var="detailURL" action="detail.action">
									<s:param name="repair.rno" value="rno"></s:param>
								</s:url>
								<a href="${detailURL }"><s:property value="rtitle"/></a>
								<s:if test="rstate == 1">
									<i class="label label-primary">未审核</i>
								</s:if>
								<s:if test="rstate == 2">
									<i class="label label-warning">已审核</i>
								</s:if>
								<s:if test="rstate == 3">
									<i class="label label-success">正在维修</i>
								</s:if>
								<s:if test="rstate == 4">
									<i class="label label-info">已完成</i>
								</s:if>
							</td>
							<td>
								<s:property value="raddr"/>
							</td>
							<td>
								<s:date name="rtime" format="yyyy-MM-dd" />
							</td>
							<s:if test="#session.logindata.obj.isAdmin > 0">
								<td>
									<s:url var="userURL" action="detail" namespace="/user">
										<s:param name="user.username" value="ruser"></s:param>
									</s:url>
									<a href="${userURL }">
										<s:property value="ruser"/>
									</a>
								</td>
							</s:if>
							<td>
								<s:url var="delURL" action="delete">
									<s:param name="repair.rno" value="rno"></s:param>
								</s:url>
								<a class="delete btn btn-danger" href="${delURL }">删除</a>
							</td>
						</tr>
					</s:iterator>
					</tbody>
				</table>
					<!-- 分页 -->
					<s:if test="#session.adminName != null">
						<s:set name="showAction" value="'showAll'"></s:set>
					</s:if>
					<s:if test="#session.userName != null">
						<s:set name="showAction" value="'show'"></s:set>
					</s:if>
				    <nav class="text-center">
					  	<ul class="pagination">
					    <s:if test="pager.curPage>1">
					    	<s:url var="firPageURL" action="%{showAction}">
					    		<s:param name="pager.curPage" value="1"></s:param>
					    	</s:url>
					    	<li><a href="${firPageURL }">首页</a></li>
					    	<s:url var="prePageURL" action="%{showAction}">
					    		<s:param name="pager.curPage" value="%{pager.curPage-1}"></s:param>
					    	</s:url>
					    	<li><a href="${prePageURL }">上一页</a></li>
					    </s:if>
					 	<li>
					 		<a>
				    		<s:property value="pager.curPage"/>
						    /
				 		    <s:property value="pager.pageCount"/>
					 		</a>
					 	</li>
				    	<li>
				    	<a>共${pager.itemCount}项(每页<s:property value="pager.pageSize"/>项)</a>
				    	</li>
					  	<s:if test="pager.curPage<pager.pageCount">
					  		<s:url var="nxtPageURL" action="%{showAction}">
					    		<s:param name="pager.curPage" value="%{pager.curPage+1}"></s:param>
					    	</s:url>
					    	<li>
					    	<a href="${nxtPageURL}">下一页</a>
					    	</li>
					    	<li>
					    	<s:url var="finPageURL" action="%{showAction}">
					    		<s:param name="pager.curPage" value="%{pager.pageCount}"></s:param>
					    	</s:url>
					    	<a href="${finPageURL}">尾页</a>
					    	</li>
					  	</s:if>
				  	</ul>
				  	</nav>
				  	<!-- 分页 end -->
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>