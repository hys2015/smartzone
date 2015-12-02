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
    <s:set var="pageTitle">订单</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	<style type="text/css">
		.glyphicon{
			top:0;
		}
		.upctrl:hover{
			cursor:hand;
		}
		.dnctrl:hover{
			cursor:hand;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("span.upctrl").bind("click",function(){
				var input = $(this).parent().find("input[name='quantity']");
				var max = $(this).attr("limit");
				if(parseInt(input.val())+1 > max){
					alert("不能再多了！");
					return;
				}
				input.val(parseInt(input.val())+1);
				calcuTotal();
			})
			$("span.dnctrl").bind("click",function(){
				var input = $(this).parent().find("input[name='quantity']");
				input.val(input.val() < 2 ? 1: parseInt(input.val()) - 1);
				calcuTotal();
			})
			calcuTotal();
		})
		var calcuTotal = function(){
			$("span.sum").each(function(){
				var quantity = $(this).parent().parent().find("input.quantity").val();
				quantity = parseInt(quantity);
				var price = $(this).parent().parent().find("span.price").text().trim();
				price = parseFloat(price);
				$(this).text((quantity * price).toFixed(2));
			})
			var total = 0;
			$("span.sum").each(function(){
				var sum = $(this).text().trim();
				sum = parseFloat(sum);
				total += sum;
			})
			$("span.total").text(total);
			$("input#total").val(total);
		}
	</script>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>${pageTitle }</h2>
				<hr>
				<s:form onsubmit="return formvalidate(this);" action="add" namespace="/store/order">
					<h3>收货地址
						<span class="h5 pull-right">
							<s:a action="show" namespace="/store/order/recaddr">
								管理收货地址
							</s:a>
						</span>
					</h3>
					<hr>
					<div class="row">
						<s:iterator value="#request.recaddrs" status="sta">
							<div class="col-md-4">
								<div data='<s:property value='rid'/>' class="list-group-item">
									<input type="radio" name="recaddr.rid" value='<s:property value='rid'/>'
										<s:if test="#sta.index == 0"> checked</s:if> >
									<br>
									<s:property value="name"/>,
									<s:property value="phone"/>
									<br>
									<s:property value="addr"/>
								</div>
							</div>
						</s:iterator>
					</div>
					<hr>
					<h3>所购商品</h3>
					<s:iterator value="goods">
					<li class="list-group-item">
						<s:a action="detail" namespace="/store">
							<s:param name="shop.sid" value="category.shop.sid"></s:param>
							<s:property value="category.shop.sname"/> >>
						</s:a>
						<br>
						<s:property value="gid"/>
						<s:property value="gname"/>
						￥
						<span class="price">
							<s:property value="nowprice"/>
						</span>
						库存:
						<span>
							<s:property value="quantity"/>
						</span>
						<div class="form-group">
							<label>数量</label>
							<div class="input-group">
								<span class="dnctrl glyphicon glyphicon-minus input-group-addon"></span>
								<input type="hidden" name="gids" value='<s:property value='gid'/>'>
								<input class="quantity form-control" name="quantity" type="number" readonly="true" step="1" value='1'>
								<span limit='<s:property value='quantity'/>' class="upctrl glyphicon glyphicon-plus input-group-addon"></span>
							</div>
						</div>
						<div class="text-right">
							小计:<span class="sum"></span>
						</div>
					</li>
					</s:iterator>
					<div class="text-right">
						<br>
						<span class="h3 text-warning">总价:
						<span class="total"></span>
						</span>
						<br>
						<input id="total" name="order.price" type="hidden"> 
						<input class="btn btn-primary" type="submit" value="下单">
					</div>
				</s:form>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>