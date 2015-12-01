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
    <s:set var="pageTitle">修改回复</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

	<s:include value="/boot.html"></s:include>

	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>

	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
				<s:url var="updURL" action="updateReply" namespace="/bbs">
				</s:url>
				<form action="${updURL }" method="post">
			   		<input type="hidden" name="reply.replyId" value='<s:property value="reply.replyId"/>' />
			   		<div class="form-group">
			   			<label>编辑回复</label>
				   		<script id="editor" name="reply.replyContent" type="text/plain" style="height:200px"></script>
			   		</div>
			   		<input class="btn btn-primary center-block" type="submit" value="提交" />
			   	</form>
		</div>
	</div>
</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    window.UEDITOR_HOME_URL = '${pageContext.request.contextPath}/ueditor/';
	var ue = UE.getEditor('editor',{
		initialContent:'${reply.replyContent}',
		autoHeight:false,
		maximumWords:1000
	});
</script> 	
</body>
<s:include value="/foot.html"></s:include>
</html>