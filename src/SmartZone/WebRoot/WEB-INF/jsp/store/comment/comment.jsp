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
    <s:set var="pageTitle">发表评论</s:set>
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
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<s:form action="add" namespace="/store/comments" onsubmit="return formvalidate(this);" >   
					<div class="form-group">
						<input type="hidden" name="comment.gid" value='<s:property value='comment.gid'/>'>
						<label>评价内容</label>
					   	<script id="editor" name="comment.content" type="text/plain" style="height:300px"></script>
					</div>
					<input class="center-block btn btn-primary" type="submit" value="发布">
				</s:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
    window.UEDITOR_HOME_URL = '${pageContext.request.contextPath}/ueditor/';
	var ue = UE.getEditor('editor',{
		initialContent:'',
		autoHeight:false,
		maximumWords:1000
	});
</script>
	
</body>
<s:include value="/foot.html"></s:include>
</html>