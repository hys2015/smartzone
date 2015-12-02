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
    <s:set var="pageTitle">分类浏览</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript">
		$(function(){
			bindDelete();
			bindConfirm();
		})
	</script>	
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
		.badge{
			background-color: #d9534f;
		}
	</style>
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container">
		<div class="row">
			<h2>${pageTitle }</h2>
			<hr>
			<div class="col-md-2">
				<s:a action="detail" namespace="/store">
					<s:param name="shop.sid" value="category.shop.sid"></s:param>
					<<商店首页
				</s:a>
				<div class="list-group">
				<s:iterator value="#request.categorys">
					<li class="list-group-item">
						<s:param name="category.cid" value="cid"></s:param>
					<s:a  title="点击查看该类别下的商品" action="showCategory" namespace="/store/goods">
						<s:param name="category.cid" value="cid"></s:param>
						<s:property value="cname"/>
					</s:a>
					</li>
				</s:iterator>
				</div>
			</div>
			<div class="col-md-10">
				<div class="list-group">
					<s:if test="category != null">
						<br>
						当前显示类别:
						<label><s:property value="category.cname"/>
						</label>
					</s:if>
					<div class="container-fluid">
					
					<s:iterator value="#request.goods">
					<s:if test="visible == 1">
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
						</s:if><!-- visible -->
					</s:iterator>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>