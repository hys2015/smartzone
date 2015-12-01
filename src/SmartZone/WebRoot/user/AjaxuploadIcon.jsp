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
    
    <title>上传头像</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.form.js"></script>      
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
				<s:form action="uploadIcon" namespace="/user" method="post" enctype="multipart/form-data">
				    <input type="file" placeholder="请选择头像预览" name="upload" label="File" onchange="loadFile(event)"/>
				    <input type="hidden" name="x">
				    <input type="hidden" name="y">
				    <input type="hidden" name="width">
				    <input type="hidden" name="height">
				    <input class="btn btn-default btn-xs" type="submit" value="上传"/>
				</s:form>
				<s:form id="confirm" action="update" namespace="/user" method="post">
					<input type="hidden" name="user.img">
					<input class="btn btn-default" type="submit" disabled="disabled" value="保存头像"/>
				</s:form>
				<div class="progress">
				  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%; min-width:2em">
				    <span class="percent">0%</span>
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
//上传前预览
	var loadFile = function(event) {
    var output = $('#preview');
    if(output.size()==0){
    	output = $("<img/>",{
    		"id":"target"	
    	});
    	$(".progress").after($("<div/>",{
    		style:"overflow:auto;height:480px"
    	}).append(output));
    	var img = $("<img/>",{
    		"width":100,
    		"height":100,
    		"id":"preview"	
    	});
    	
    	var pre_panel = $("<div/>",{
    		"height":100,
    		"width":100,
			"id":"preview-pane"
    	});
    	pre_panel.append($("<div/>",{
    		"class":"preview-container"
    	}).append(img));
    	
    	output.parent().before(pre_panel);
    	pre_panel.before($("<span/>",{text:"预览(100*100)"}));
    }
    output.attr("src", URL.createObjectURL(event.target.files[0]));
    img.attr("src", URL.createObjectURL(event.target.files[0]));
    jcrop();
  	};
  	
//事件绑定  	
$(function(){

	var bar = $('.progress-bar');
	var percent = $('.percent');
	var status = $('#status');
	$('form:eq(0)').ajaxForm({ 
	    dataType: 'json',
	    beforeSubmit:function(formData, jqForm, options){
	    	for(var i =0 ; i < formData.length ; ++i){
	    		if(!formData[i].value){
	    			alert("请选择头像并选出区域!");
	    			return false;
	    		} 
	    	}
	    },
		beforeSend: function() {
	        status.empty();
	        var percentVal = '0%';
	        bar.width(percentVal);
	        percent.html(percentVal);
	    },
	    uploadProgress: function(event, position, total, percentComplete) {
	        var percentVal = percentComplete + '%';
	        bar.attr("aria-valuenow",percentComplete);
	        bar.width(percentVal);
	        percent.html(percentVal);
	    },
	    complete: function(xhr){
			var r = xhr.responseJSON;
			var path = "/SmartZone/upload/img/"+r.message;
			var $pre = $(".progress").parent().children("img");
			if($pre.size() < 1){
				$(".progress").after($pre=$("<img/>",{
					"src":path,
					"width":50,
					"height":50,
					css:{display:"block"}
				}));
				$pre.before($("<span/>",{text:"头像(50x50)"}));
			}
			$pre.attr("src",path);
			
			$("#confirm input[type='submit']").removeAttr("disabled");
		}
	});
})
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