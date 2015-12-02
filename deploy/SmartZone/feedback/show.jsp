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
    <s:set var="pageTitle" value="'留言板'"/>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<s:if test="#request.myFeedback != null">
					<h3>我的留言</h3>
				</s:if>
				<s:else>
					<h3>留言板</h3>
				</s:else>
				<p class="text-muted">
					<b>
					大家对本小区有任何方面的意见或者建议，都可以留言告诉我们，我们将尽我们所能解决您的问题。
					</b>
				</p>
				<s:iterator value="#request.feedbackList" var="item">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="h4">
								<s:property value="ftitle"/>
							</div>
								<small class="text-muted">
								<s:url var="userURL" action="detail" namespace="/user">
									<s:param name="user.username" value="fauthor"></s:param>
								</s:url>
								<a href="${userURL }">
									<s:property value="fauthor"/> 
								</a>
								发布于 <s:date name="ftime" format="yyyy-MM-dd HH:mm:ss"/>
								<s:if test="#session.logindata.obj.isAdmin > 0 || #session.logindata.obj.username == fauthor">
									<s:url var="updURL" action="toUpdate" namespace="/feedback">
										<s:param name="feedback.fno" value="fno"></s:param>
									</s:url>
										<a href="${updURL }">编辑</a> |
									<s:url var="delURL" action="delete" namespace="/feedback">
										<s:param name="feedback.fno" value="fno"></s:param>
									</s:url>
										<a class="text-danger pull-right" href="${delURL }">删除</a>
								</s:if>
								<s:url var="replyURL" action="toReply" >
									<s:param name="feedback.fno" value="fno"></s:param>
								</s:url>
								<a href="${replyURL }">回复</a>
								</small>
						</div>
						<div class="panel-body">
								<div>
									<s:set var="content" value="fcontent"/>
									${content }
								</div>
							<s:if test="replies.size > 0">
								<div class="panel panel-default">
									<table class="table">
										<tbody>
										<s:iterator value="replies" var="reply">
												<tr>
													<td>
														<small class="text-muted">
														<s:url var="userURL" action="detail" namespace="/user">
															<s:param name="user.username" value="#reply.reauthor"></s:param>
														</s:url>
														<a href="${userURL }">
															<s:property value="#reply.reauthor"/>
														</a>
														<s:date name="#reply.retime" format="MM-dd HH:mm:ss"/>
														<s:if test="#reply.reauthor == #session.logindata.obj.username || #session.logindata.obj.isAdmin > 0">
															<s:url var="updURL" action="toUpdate" namespace="/reply" >
																<s:param name="reply.reno" value="#reply.reno"></s:param>
																<s:param name="url" value="#request.url"></s:param>
															</s:url>
															<a href="${updURL }"><small>编辑</small></a>
															<s:url var="delReplyURL" action="delete" namespace="/reply" >
																<s:param name="reply.reno" value="#reply.reno"></s:param>
																<s:param name="url" value="#request.url"></s:param>
															</s:url>
															<a class="text-danger pull-right" href="${delReplyURL }"><small>删除</small></a>
														</s:if>
														</small>
														<p>
															<s:set var="recontent" value="#reply.recontent"/>
															${recontent }
														</p>
													</td>
												</tr>
										</s:iterator>
										</tbody>
									</table>
								</div>
							</s:if>
						</div>
					</div>
				</s:iterator>
				<!-- 分页 -->
				<s:set var="pageAction" value="'show.action'" />
				<nav class="text-center">
				  	<ul class="pagination">
				    <s:if test="pager.curPage>1">
				    	<s:url var="firPageURL" action="%{pageAction}">
				    		<s:param name="pager.curPage" value="1"></s:param>
				    	</s:url>
				    	<li><a href="${firPageURL }">首页</a></li>
				    	<s:url var="prePageURL" action="%{pageAction}">
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
				  		<s:url var="nxtPageURL" action="%{pageAction}">
				    		<s:param name="pager.curPage" value="%{pager.curPage+1}"></s:param>
				    	</s:url>
				    	<li>
				    	<a href="${nxtPageURL}">下一页</a>
				    	</li>
				    	<li>
				    	<s:url var="finPageURL" action="%{pageAction}">
				    		<s:param name="pager.curPage" value="%{pager.pageCount}"></s:param>
				    	</s:url>
				    	<a href="${finPageURL}">尾页</a>
				    	</li>
				  	</s:if>
			  	</ul>
			  	</nav>
			  	<!-- 分页 end -->
			</div>
			
			<div class="col-md-2">
				<s:url var="addURL" action="toAdd"></s:url>
				<a class="btn btn-primary" href="${addURL }">新留言</a>
				
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>