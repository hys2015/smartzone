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
    <s:set var="pageTitle" value="'上传头像'"/>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.Jcrop.min.js"></script>      
	<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.Jcrop.min.css"></link>      
</head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h2>更改头像</h2>
				<p class="text-muted">请选择一个图片，裁剪预览满意后，选择保存即可</p>
					预览(50*50)
				<div id="preview-pane">
					<div class="preview-container">
						<img alt="请选择图片">
					</div>
				</div>
				<s:form action="uploadIcon" namespace="/user" method="post" enctype="multipart/form-data" onsubmit="return validate()">
					<div class="form-group">
						<label>请选择图片文件(.jpg/.bmp/.png)</label>
					    <input type="file" name="upload" onchange="loadFile(event)" accept=".jpg,.bmp,.jpeg,.png" />
					</div>
				    <input type="hidden" name="x">
				    <input type="hidden" name="y">
				    <input type="hidden" name="width">
				    <input type="hidden" name="height">
				    <input class="btn btn-default" type="submit" value="保存"/>
				</s:form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	var validate = function(){
		var $inputs = $('form input');
		for( var i = 0 ; i < $inputs.length; ++i){
			if($inputs[i].value==""){
				alert("请选择图片并裁剪后保存");
				return false;
			}
		}
	}

//上传前预览
	var loadFile = function(event) {
    var output = $('#target');
    var img = $('.preview-container img');
    if(output.size()==0){
    	output = $("<img/>",{
    		"id":"target"	
    	});
    	
    	$prev = $("<div/>",{
    		"id":"preview",
    		css:{height:"300",overflow:"auto"}
    	}).append(output);
    	
    	$prev.insertAfter($("form"));
    }
    output.attr("src", URL.createObjectURL(event.target.files[0]));
    img.attr("src", URL.createObjectURL(event.target.files[0]));
    jcrop();
  	};
  	
//Jcrop插件
var jcrop = function(){
  // Create variables (in this scope) to hold the API and image size
  var jcrop_api,
  boundx,
  boundy,
  
  // Grab some information about the preview pane
  $preview = $('#preview-pane'),
  $pcnt = $('#preview-pane .preview-container'),
  $pimg = $('#preview-pane .preview-container img'),
  
  $x = $('input[name="x"]'),
  $y = $('input[name="y"]'),
  $height = $('input[name="height"]'),
  $width = $('input[name="width"]'),
  
  
  xsize = $pcnt.width(),
  ysize = $pcnt.height();
  
  console.log('init',[xsize,ysize]);

  $('#target').Jcrop({
    onChange: updatePreview,
    onSelect: updatePreview,
    aspectRatio: xsize / ysize
  },function(){
    // Use the API to get the real image size
    var bounds = this.getWidgetSize();
    boundx = bounds[0];
    boundy = bounds[1];
    console.log([boundx,boundy]);
    // Store the API in the jcrop_api variable
    jcrop_api = this;
    
    // Move the preview into the jcrop container for css positioning
    //$preview.appendTo(jcrop_api.ui.holder);
  });
  
  function updatePreview(c){
    $x.val( c.x < c.x2 ? c.x : c.x2);
    $y.val( c.y < c.y2 ? c.y : c.y2);
    $width.val( Math.abs(c.x - c.x2));
    $height.val( Math.abs(c.y - c.y2));
    if (parseInt(c.w) > 0) {
      
      var rx = xsize / c.w;
      var ry = ysize / c.h;
      
      $pimg.css({
        width: Math.round(rx * boundx) + 'px',
        height: Math.round(ry * boundy) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
      });
    }
  };
}

</script>

<s:include value="/foot.html"></s:include>
</html>