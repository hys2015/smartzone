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
  	<s:set var="pageTitle" value="'写报修'"/>
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
		    <h1>报修
		    	<s:if test="#session.logindata.Type == 'user'">
				    <a class="btn btn-default pull-right" href="../repair/show.action">我的报修记录</a>
		    	</s:if>
		    </h1>
		    <s:fielderror cssClass="text-danger"></s:fielderror>
			<form onsubmit="return formvalidate(this);" action="../repair/add.action" method="post">
				<s:if test="#request.repair != null">
					<input type="hidden" value="${repair.rno }" name="repair.rno">
					<input type="hidden" value="${repair.ruser }" name="repair.ruser">
					<input type="hidden" value="${repair.communityno }" name="repair.communityno">
				</s:if>
				<div class="form-group">
					<label class="control-label">简述</label>
					<input type="text" value="${repair.rtitle }" class="form-control" name="repair.rtitle" placeholder="请简述维修项目">
				</div>
				<div class="form-group">
					<label class="control-label">手机</label>
					<input type="number" value="${repair.rphone }" class="form-control" name="repair.rphone" placeholder="请输入手机号码,11位数字">
				</div>
				<div class="form-group">
					<label class="control-label">地址</label>
					<input type="text" value="${repair.raddr }" class="form-control" name="repair.raddr" placeholder="请输入地址，长度大于4">
				</div>
				<div class="form-group">
					<label class="control-label">内容</label>
			    	<script id="editor" name="repair.rcontent" type="text/plain" style="height:300px"></script>
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
    	initialContent:'${repair.rcontent}',
    	autoHeight:false,
		maximumWords:1000
    });
</script>
</body>
<s:include value="/foot.html"></s:include>
</html>