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
    <s:set var="pageTitle">编辑商品信息</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>
	
	
	<s:include value="/boot.html"></s:include>
	
	<script type="text/javascript">
		$(function(){
			bindDelete();
			$("#delImg").bind("click",function(){
				$(".removeIcon").toggleClass("hidden");
			})
		});
	</script>
	
	<style type="text/css">
		.fileinputs .form-group{
			background-color:#eee;
		}
	</style>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h2>${pageTitle }</h2>
			<hr>
			<s:if test="#session.message != null">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<s:property value="#session.message"/>
				</div>
				<s:set name="#session.message" value="null"/>
			</s:if>
			<s:form onsubmit="return validateNecessary(this);" action="update" namespace="/store/goods">
				<div class="form-group list-group-item">
					<label>图片</label>
					<span class="pull-right">
						<a href="javascript:void(0)" id="delImg" class="btn btn-danger">删除图片</a>
						<s:a action="toAddImg" cssClass="btn btn-default">
							<s:param name="good.gid" value="good.gid"></s:param>
							添加图片</s:a>
					</span>
					<p>图片预览</p>
					<div class="preview form-group row">
						<s:if test="good.imgs.size < 1">
							<p class="text-muted">暂无图片</p>
						</s:if>
						<s:iterator value="good.imgs">
							<div class="col-md-3">
								<img class="img-thumbnail" src='<s:property value="imgUrl"/>'>
								<p class="text-center hidden removeIcon">
									<s:a cssClass="delete text-danger" action="delImg" namespace="/store/goods">
										<s:param name="good.gid" value="good.gid"></s:param>
										<s:param name="imgIdx" value="idx"></s:param>
										<span class="glyphicon glyphicon-remove"></span>
									</s:a>
								</p>
							</div>
						</s:iterator>
					</div>
				</div>
				<div class="form-group">
					<label class="text-warning">带*的项目必填</label>
					<input type="hidden" name="good.gid" value='<s:property value='good.gid'/>'>
					<br>
					<label>商品名称*</label>
					<input type="text" class="necessary form-control" name="good.gname" value='<s:property value='good.gname'/>'>
				</div>
				<div class="form-group">
					<label>分类</label>
					<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" data-target="idselect" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							<input type="hidden" class="necessary" name="category.cid" value='<s:property value="good.category.cid"/>'>
						    <txt>
						    	<s:property value="good.category.cname"/>
						    </txt>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					  	<s:iterator value="#request.categorys">
						    <li><a data='<s:property value="cid"/>'>
						    	<s:property value="cname"/>
						    </a></li>
					  	</s:iterator>
					  </ul>
					</div>
				</div>
				<div class="form-group">
					<label>价格*</label>
					<input type="number" class="necessary form-control" name="good.price" value='<s:property value='good.price'/>' min="0" step="any">
				</div>
				<div class="form-group">
					<label>折后价</label>
					<input type="number" class="form-control" name="good.nowprice" value='<s:property value='good.nowprice'/>' min="0" step="any">
				</div>
				<div class="form-group">
					<label>库存量*</label>
					<input type="number" class="necessary form-control" name="good.quantity"  value='<s:property value='good.quantity'/>'>
				</div>
				<div class="form-group">
					<label>详细信息</label>
					<script id="editor" name="good.detail" type="text/plain" style="height:300px"></script>
				</div>
				<input type="submit" class="btn btn-default center-block" value="提交">
			</s:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    window.UEDITOR_HOME_URL = '${pageContext.request.contextPath}/ueditor/';
	var ue = UE.getEditor('editor',{
		initialContent:'${good.detail}',
		autoHeight:false,
		maximumWords:1000
	});
	
	$(function(){
		$(".dropdown-menu li a").bind("click",function(){
			var cid = $(this).attr("data");
			var cname = $(this).text().trim();
			$(".dropdown-toggle txt").text(cname);
			$("input[name='category.cid']").val(cid);
		})
	})
</script>
</body>
<s:include value="/foot.html"></s:include>
</html>