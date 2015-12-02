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
    <s:set var="pageTitle">${good.gname}</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			$("img.thumb").bind("mouseover",function(){
				$("img#view").attr("src",$(this).attr("src"));
			});
			$("a.addToCart").bind("click",function(){
				var quantity = $("input#quantity").val();
				if(quantity == "" || quantity == undefined){
					quantity = 1;
				}
				$.ajax({
					url:"/SmartZone/store/cart/add.action",
					dataType:"json",
					method:"post",
					data:{
					"good.gid":$(this).attr("data"),
					"cartitem.quantity":quantity
					},
					success:function(data){
							if(data.status == 'success'){
								alert("添加成功");
								$("#cartsize").text(data.cartsize);
							}else{
								alert("添加失败");
							}
						},
					error:function(data){
						alert("添加失败");
						}
					});			
			});
		})
	</script>	
	<style type="text/css">
		.thumbpane{
			padding:0;
		}
		.thumb{
			border:1px solid #eee;
		}
	</style>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h2>${pageTitle }</h2>
				<div class="col-md-4">
					<s:if test="#request.good.imgs.size < 1">
						暂无图片
					</s:if>
					<s:else>
							<div class="row">
								<s:iterator value="#request.good.imgs">
									<div class="col-md-3 thumbpane">
										<img class="img-responsive thumb" src='<s:property value='imgUrl'/>'>
									</div>
								</s:iterator>
							</div>
							<p></p>
							<img id="view" class="img-thumbnail" src='<s:property value='#request.good.imgs[0].imgUrl'/>'>
					</s:else>
				</div>
				<div class="col-md-8">
					<div>
						<h4>
							<s:a action="detail" namespace="/store">
								<s:param name="shop.sid" value="#request.good.category.shop.sid"></s:param>
								<s:property value="#request.good.category.shop.sname"/> >>
								<span class="glyphicon glyphicon-home">
							</s:a>
						</h4>
						<h3>
							<b>
							<s:property value="#request.good.gname"/>
							</b>
						</h3>
						类别
						<span class="label label-danger">
						<s:property value="#request.good.category.cname"/>
						</span>
						<br><br>
						<p>
						库存:<s:property value="#request.good.quantity"/>
						</p>
						<s:if test="#request.good.nowprice != #request.good.price">
						<p class="h5">
							原价
							<del>
							<s:property value="#request.good.price"/>
							</del>
						</p>
						</s:if>
						<p class="h4">
							现价
							<b class="h3 text-danger">
								<s:property value="#request.good.nowprice"/>
							</b>
							<s:if test="#request.good.nowprice < #request.good.price">
								<span class="label label-danger h5">
									立减	<s:property value="((#request.good.price-#request.good.nowprice)*100).intValue()/100"/>元		
								</span>
							</s:if>
						</p>
						<hr>
						<span class="pull-right">
							<a class="addToCart btn btn-danger" data='<s:property value='#request.good.gid'/>' href="javascript:void(0)">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								加入购物车</a>
							<s:a cssClass="btn btn-primary" action="toAdd" namespace="/store/order">
								<s:param name="gids" value="#request.good.gid"></s:param>
								
								立即购买
							</s:a>
						</span>
					</div>
				</div>
				<div class="col-md-12">
					 <ul class="nav nav-tabs" role="tablist">
					   <li role="presentation" class="active">
					   		<a href="#detail" aria-controls="carportfee" role="tab" data-toggle="tab">
					   		<span class="glyphicon glyphicon-list-alt"></span>
					   		商品详情</a></li>
					   <li role="presentation">
					   		<a href="#comments" aria-controls="condofee" role="tab" data-toggle="tab">
					   		<span class="glyphicon glyphicon-pencil"></span>
					   		买家评论</a></li>
					 </ul>
					 <div class="tab-content">
					 	<div role="tabpanel" class="tab-pane active" id="detail">
					 		<p></p>
					 		<div class="list-group-item">
								<s:property value="#request.good.detail" escapeHtml="false"/>
							</div>
				    	</div>
					 	<div role="tabpanel" class="tab-pane" id="comments">
					 		<p></p>
							<s:include value="comments.jsp"></s:include>
					    </div>
					 </div>
						
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>