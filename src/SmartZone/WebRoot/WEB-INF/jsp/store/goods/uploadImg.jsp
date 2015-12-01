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
    <s:set var="pageTitle">上传图片</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<s:form onsubmit="return formvalidate(this, '请选择需要上传的图片');" enctype="multipart/form-data" action="addImg" namespace="/store/goods">
					<div class="form-group">
						<input type="hidden" name="good.gid" value='<s:property value="good.gid"/>' >
						<label>请选择图片文件(.jpg/.bmp/.png)</label>
					    <input type="file" name="upload" onchange="loadFile(event)" accept=".jpg,.bmp,.jpeg,.png" />
					</div>
					<input type="submit" class="btn btn-primary" value="确认上传">
				</s:form>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	var loadFile = function(event) {
    var output = $('#target');
    if(output.size()==0){
    	output = $("<img/>",{
    		"id":"target"	
    	});
    	
    	$prev = $("<div/>",{
    		"id":"preview",
    		css:{height:"40em",overflow:"auto"}
    	}).append(output);
    	
    	$prev.insertAfter($("form"));
    }
    output.attr("src", URL.createObjectURL(event.target.files[0]));
  	};
</script>
</body>
<s:include value="/foot.html"></s:include>
</html>