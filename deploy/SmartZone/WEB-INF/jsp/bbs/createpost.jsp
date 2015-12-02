<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<head>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>
	</head>

    	<form onsubmit="return formvalidate(this,'请不要留下空白部分');" class="text-center" action="createPost.action" method="post">
    		<input type="hidden" name="board.boardId" value="${board.boardId }"/>
    		<div class="form-group text-left">
    			<label>发帖</label>
    			<div class="input-group">
				  <span class="input-group-addon" id="basic-addon1">标题</span>
				  <input type="text" class="form-control" name="post.postTitle" placeholder="请输入标题" aria-describedby="basic-addon1">
				</div>
    		</div>
    		<div class="form-group">
    			<script id="editor" name="post.postContent" type="text/plain" style="height:200px"></script>
    		</div>
   			<input class="btn btn-primary" type="submit" value="发表主题" />
    	</form>
    	
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    window.UEDITOR_HOME_URL = '${pageContext.request.contextPath}/ueditor/';
	var ue = UE.getEditor('editor',{
		initialContent:'${post.postContent}',
		autoHeight:false,
		maximumWords:1000
	});
</script> 	
