<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<s:set var="pageTitle" value="'回复留言'"/>
    <title>${pageTitle }</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    
    
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/ueditor/lang/zh-cn/zh-cn.js"></script>
    <s:include value="/boot.html"></s:include>
    <!-- 
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
     -->
</head>
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<s:if test="#request.reply != null">
		    	<h1>编辑回复</h1>
		    	<s:url var="replyURL" action="update" namespace="/reply"></s:url>
			</s:if>
			<s:else>
		    	<h1>发表回复</h1>
			    <s:url var="replyURL" action="reply" namespace="/feedback"></s:url>
			</s:else>
		    <s:fielderror cssClass="text-danger"></s:fielderror>
			<form action="${ replyURL}" method="post">
				<s:if test="#request.reply == null">
					<input type="hidden" value="${fno}" name="feedback.fno">
				</s:if>
				<s:else>
					<input type="hidden" value="${url }" name="url">
					<input type="hidden" value="${reply.reno }" name="reply.reno">
				</s:else>
				<div class="form-group">
					<label class="control-label">内容</label>
			    	<script id="editor" name="reply.recontent" type="text/plain" style="height:300px"></script>
			    </div>
			    <div class="text-center">
				   	<input class="btn btn-default" type="submit" value="发布">
			    </div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    window.UEDITOR_HOME_URL = "/SmartZone/ueditor/";
    var ue = UE.getEditor('editor',{
    	initialContent:'${reply.recontent}',
    	autoHeight:false,
		maximumWords:1000
    });
</script>
</body>
<s:include value="/foot.html"></s:include>
</html>