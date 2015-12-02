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
    <s:set var="pageTitle">新商品</s:set>
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
			$("a.addImg").bind("click",function(){
				var newId = $("form input[type='file']:last()").attr("id");
				if(newId == "" || newId == undefined){
					newId = 1;
				}else{
					newId ++;
				}
				var newFileInput = $("<input>",{
					"type":"file",
					"name":"upload",
					"id":newId
				});
				//<a type="button" class="close removeFile" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				var closeBtn = $("<a>",{
					"type":"button",
					"class":"close",
					"aria-label":"Close"
					}).append($("<span>",{
							    "aria-hidden":"true",
							    html:"&times;"							    
							  }));
				
				var newFormGroup = $("<div>",{
					"class":"form-group",
				})
				.append(closeBtn)
				.append(newFileInput);
				
				$("form .fileinputs").append(newFormGroup);
				//bind event
				newFileInput.bind("change",fileChangeFunc);
				closeBtn.bind("click",function(){
					var prevId = "p" + $(this).parent().find("input").attr('id');
					$(".preview").find("#"+prevId).parent().remove();
					$(this).parent().remove();
				})
			})
		})
		
		var fileChangeFunc = function(event){
				var imgURL = URL.createObjectURL(event.target.files[0]);
				var fid = 'p' + $(this).attr("id");
				var val  = $(this).val();
				var pos = val.lastIndexOf("\\")+1;
				val = val.substr(pos);
				var po = $("form .preview").find("#"+fid);
				if( po.length < 1){
					var newthumb = $("<img>",{
						attr:{"class":"img-thumbnail",
							  "src":imgURL
						},
						id:fid
					});
					var newname = $("<small>",{
						"class":"text-center text-muted",
						text:val
					})
					var newgrid = $("<div>",{"class":"col-md-3"})
								     .append(newthumb)
								     .append(newname);
					$("form .preview").append(newgrid);
				}else{
					po.attr("src",imgURL);
					po.parent().find("small").text(val);
				}
			}
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
			<s:form action="add" namespace="/store/goods" enctype="multipart/form-data">
				<div class="form-group list-group-item">
					<label>图片</label>
					<span class="pull-right">
						<a href="javascript:void(0)" class="addImg btn btn-default">添加图片</a>
					</span>
					<p>图片预览</p>
					<div class="preview form-group row"></div>
					<div class="fileinputs"></div>
				</div>
				<div class="form-group">
					<label>商品名称</label>
					<input type="text" class="form-control" name="good.gname">
				</div>
				<div class="form-group">
					<label>分类</label>
					<div class="dropdown">
					  <button class="btn btn-default dropdown-toggle" data-target="idselect" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
					    	<s:if test="#request.categorys.size > 0">
								<input type="hidden" name="category.cid" value='<s:property value="#request.categorys[0].cid"/>'>
							    <txt>
							    	<s:property value="#request.categorys[0].cname"/>
							    </txt>
					    	</s:if>
					    	<s:else>
								请先添加类别
					    	</s:else>
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
					<label>价格</label>
					<input type="number" class="form-control" name="good.price" min="0" step="any">
				</div>
				<div class="form-group">
					<label>折后价</label>
					<input type="number" class="form-control" name="good.nowprice" min="0" step="any">
				</div>
				<div class="form-group">
					<label>库存量</label>
					<input type="number" class="form-control" name="good.quantity">
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