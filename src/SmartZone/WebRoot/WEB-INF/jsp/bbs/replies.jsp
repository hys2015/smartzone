<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

	<s:set var="pageTitle" value="'帖子'"/>
    <title>${pageTitle }</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	<style type="text/css">
		.pui{
			margin-top:1em;
			display:inline-block;
		}
		.pui img{
			height:80px;
			width:80px;
		}
		.table {
			table-layout:fixed;
		}
		.content-pane{
			width:100%;
			overflow:auto;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			bindDelete();
		})
	</script>
</head>

<table class="table table-bordered replies-wrapper f11">
<s:if test="#request.list.size!=0">
	<s:iterator value="#request.list" status="sta">
		<tr>
		<td width="20%" class="text-center">
			<a class="pui" href="${userURL }">
				<img src='<s:property value="user.img"/>'>
			</a>
			<div>
				<a href="${userURL }">
					<s:property value="user.username"/>
				</a>
			</div>
		</td>
		<td>
			<div>
				<s:set var="stair" value="idx+1"/>
				<a name="${stair }"></a>
				<p class="text-right">
					<small class="text-muted">
						<s:if test="#sta.index > 0">
						<s:if test="#session.logindata.obj.username == user.username || #session.logindata.obj.isAdmin > 0">
							<s:url var="delURL" action="deleteReply" namespace="/bbs">
								<s:param name="reply.replyId" value="replyId"></s:param>
							</s:url>
							<a class="delete text-danger" href="${delURL }">删除</a>
						</s:if>
						</s:if>	
						<s:if test="#session.logindata.obj.username == user.username">
							<s:url var="updURL" action="toUpdateReply" namespace="/bbs">
								<s:param name="reply.replyId" value="replyId"></s:param>
							</s:url>
							<a class="text-primary" href="${updURL }">编辑</a>
						</s:if>
			  			<s:date name="replyCreatetime" format="yyyy-MM-dd HH:mm:ss"/> 
					</small>
						#${stair }
				</p>
			</div>
			<div class="content-pane">
	  			<s:set var="content" value="replyContent"/> 
	  			${content }
			</div>
		</td>
		</tr>
  	</s:iterator>
</s:if>
<s:else>
	还没有回复。。
</s:else>
</table>

