<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<style type="text/css">
		.detailpane{
			background-color:#eee;
		}
		.thumbpane{
			padding:0;
		}
		.thumb{
			border:1px solid #eee;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("img.thumb").bind("mouseover",function(){
				$(this).parent().parent().find("img#view").attr("src",$(this).attr("src"));
			})
		})
	</script>	
</head>
<div class="col-md-10">
<div class="list-group">
	<s:iterator value="#request.goods">
		<div class="col-md-3">
			<div class="thumbnail">
				<s:if test="imgs.size < 1">
					<img class="img-thumbnail" alt="<s:property value="gname"/>">
				</s:if>
				<s:else>
					<s:iterator value="imgs">
						<div class="col-md-3 thumbpane">
						<img class="img-responsive thumb" src='<s:property value="imgUrl"/>'>
						</div>
					</s:iterator>
				 	<p>
					<img id="view" class="img-thumbnail" src='<s:property value='imgs[0].imgUrl'/>'>
				</s:else>
				<div>
					<s:property value="gid"/>
					<s:a action="detail" namespace="/store/goods">
						<s:param name="good.gid" value="gid"></s:param>
						<s:property value="gname"/>
					</s:a>
					<br>
					<del>
					￥<s:property value="price"/>
					</del>
					<b>
					￥<s:property value="nowprice"/>
					</b>
					<br>
					<span class="badge">
						<s:property value="(nowprice/price*100).intValue()"/>折
					</span>
					<br>
					库存:<s:property value="quantity"/>
				</div>
			</div>
		</div>
	</s:iterator>
</div>
</div> 
<div class="col-md-2">
	<label>
	分类浏览
	</label>
	<div class="list-group">
		<s:iterator value="#request.categorys">
			<s:a cssClass="list-group-item" action="showCategory" namespace="/store/goods">
				<s:param name="category.cid" value="cid"></s:param>					
				<s:property value="cname"/>
			</s:a>
		</s:iterator>
	</div> 
</div>