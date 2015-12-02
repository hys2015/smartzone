<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="shopimgs row">
	<p>当前店铺图片</p>
	<s:if test="#request.shop.imgs.size < 1">
		<div class="col-md-4 col-xs-6">
			<div class="thumbnail">
				<img src='<s:property value="defaultImg"/>' title="默认图片"> 
				<div class="caption">
					<p class="text-muted text-center">默认图片</p>
				</div>
			</div>
		</div>
	</s:if>
	<s:iterator value="#request.shop.imgs">
		<div class="col-md-4 col-xs-6">
			<div class="thumbnail">
				<img src='<s:property value="imgUrl"/>' style="border:1px solid #eee;" title="自定义图片"> 
				<div class="caption">
					<p class="delImg text-center">
						<s:a cssClass="delete" action="delImg" namespace="/store">
							<s:param name="shop.sid" value="#request.shop.sid"></s:param>
							<s:param name="idx" value="idx"></s:param>
							<span class="label label-danger">
							<i class="glyphicon glyphicon-remove"></i>
							</span>
						</s:a>
					</p>
					<p class="text-center text-muted">
						<s:property value="brief"/>
					</p>
				</div>
			</div>
		</div>
	</s:iterator>
</div>
<p>
	<s:a cssClass="btn btn-default" action="toUploadImg" namespace="/store">
		<s:param name="shop.sid" value="#request.shop.sid"></s:param>
	上传新图片</s:a>
	<a id="delImg" class="btn btn-default" href="javascript:void(0)">删除图片</a>
</p>
<head>
<script type="text/javascript">
	var shopimgsFunc = function(){
		$(".delImg").hide();
		$("#delImg").bind("click",function(){
			$(".delImg").toggle(100);
		});
	}
</script>
</head>
