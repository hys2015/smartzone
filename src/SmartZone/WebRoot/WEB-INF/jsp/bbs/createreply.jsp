<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

   	<form onsubmit="return formvalidate(this,'请输入内容');" action="createReply.action" method="post">
   		<input type="hidden" name="post.postId" value='<s:property value="post.postId"/>' />
   		<div class="form-group">
   			<label>发表回复</label>
	   		<script id="editor" name="reply.replyContent" type="text/plain" style="height:200px"></script>
   		</div>
   		<input class="btn btn-primary center-block" type="submit" value="提交" />
   	</form>
   	
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
