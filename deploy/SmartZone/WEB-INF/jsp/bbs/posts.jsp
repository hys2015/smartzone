<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>

<head>
	<style type="text/css">
		.table{
			table-layout:fixed;
		}
		td{
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		bindDelete();
		$(".preview").each(function(){
			var text = $(this).text();
			var imgs = $(this).find("img");
			if(imgs.length>0){
				$("<span>[图片]</span>").replaceAll(imgs);
			}
			console.log(text);
		});
	})
	</script>
	
</head>

<s:if test="#session.message != null">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<s:property value="#session.message"/>
		<%session.removeAttribute("message"); %>
	</div>
</s:if>

<div class="panel panel-default">
	<div class="panel-heading">
  			<label>
  			${pageTitle }
  			</label>
	</div>
	<table class="table table-hover">
	<s:if test="#request.list!=null">
		<s:if test="#request.list.size!=0">
			<s:iterator value="#request.list" var="str" >
			<tr>
				<!-- title -->
				<td width="20%">
				<s:url action="showReplies" var="postURL">
					<s:param name="post.postId" value="postId"></s:param>
				</s:url>
		   		<a title='<s:property value="postTitle"/>' href="${postURL}">
		   			<s:if test="postTitle == ''">
		   				<span class="text-muted">
		   				[无标题]
		   				</span>
		   			</s:if>
		   			<s:property value="postTitle"/>
		   		</a>
		   		<div>
			   		<small class="text-muted preview">
			   			<s:set var="preview" value="replies[0].replyContent"/>
			   			${preview }
			   		</small>
		   		</div>
				</td>
				<!-- user -->
				<td  width="25%">
		   		<s:url var="userURL" action="/detail" namespace="/user">
		   			<s:param name="user.username" value="user.username"></s:param>
		   		</s:url>
		   		<a href="${userURL }">
			   		<s:property value="user.username"/>
		   		</a>
		   		<br>
		   		<small>
		   	 	<s:date name="postCreatetime" format="MM-dd HH:mm:ss"/>
		   		</small>
				</td>
				<td  width="25%">
		   	 	最新回复：<s:date name="postReplytime" format="MM-dd HH:mm:ss"/>
				</td>
				<td  width="15%">
		   	 	回复数：<s:property value="postReplytimes"/>
		   	 	</td>
		   	 	<s:if test="#session.logindata.obj.isAdmin > 0">
			   	 	<td width="10%">
			   	 	<s:a title="删除主题" cssClass="text-danger delete" action="deletePost" namespace="/bbs">
			   	 		<s:param name="post.postId" value="postId"></s:param>
			   	 		<span class="glyphicon glyphicon-trash"></span>
			   	 	</s:a>
			   	 	</td>
		   	 	</s:if>
			</tr>
	   		</s:iterator>
		</s:if>
		<s:else>
			<tr>
			<td>
			还没有帖子。。
			</td>
			</tr>
		</s:else>
	</s:if>
	</table>
</div>