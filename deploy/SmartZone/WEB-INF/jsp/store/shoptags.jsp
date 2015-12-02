<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<style type="text/css">
		.glyphicon-remove{
			color:#fff;
		}
		.tooltip.right{
			margin-left:0;
			opacity:1;
			position:relative;
			display:inline-block;
		}
		.tooltip-inner{
			background-color:#d9534f;
		}
		.tooltip.right .tooltip-arrow{
			border-right-color:#d9534f;
		}
	</style>
	<script type="text/javascript">
		var shoptagsFunc = function(){
			$(".tooltip").hide();
			$("#delTag").bind("click",function(){
				$(".tooltip").toggle(100);
			})
		}
	</script>
</head>

<div class="shoptags">
	<p>本店当前已有标签</p>
	<s:if test="#session.message != null">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<s:property value="#session.message"/>
			<%session.removeAttribute("message"); %>
		</div>
	</s:if>
	<div class="panel panel-default">
		<div class="panel-body">
		<s:if test="#request.shop.tags.size < 1">
			目前还没有标签
		</s:if>
		<s:iterator value="#request.shop.tags">
			<span data-toggle="tooltip" class="tag label label-danger"><s:property value="title"/></span>
			<span class="tooltip right" role="tooltip">
			  <span class="tooltip-arrow"></span>
			  <span class="tooltip-inner">
				<s:a cssClass="delete" action="delTag" namespace="/store">
					<s:param name="shop.sid" value="#request.shop.sid"></s:param>
					<s:param name="tag.tid" value="tid"></s:param>
					<span class="glyphicon glyphicon-remove"></span>
				</s:a>
			  </span>
			</span>
		</s:iterator>
		<span class="pull-right">
			<a id="delTag" href="javascript:void(0)">删除</a>
			<a data-toggle="modal" data-target="#newtag" href="javascript:void(0)">添加</a>
		</span>
		</div>
	</div>
</div>
