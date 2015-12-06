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
    <s:set var="pageTitle">欢迎注册智慧社区-SMARTZONE</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	
	<style type="text/css">
		.tip{
			color:red;
		}
	</style>
	
	<script type="text/javascript">
	
		var validateLenFunc = function(){
			 	var	val = $(this).val();
			 	if(val.trim() == "" ){
					$(this).parent().find(".tip").text("不能为空");
					$(this).attr("validate","false");
					return false;
				}
				if(val.length > 10 || val.length < 4){
					$(this).parent().find(".tip").text("长度需要在4到10之间");
					$(this).attr("validate","false");
					return false;
				}
				$(this).parent().find(".tip").text("");
				$(this).attr("validate","true");
				return true;
			}
			
			var validatePwdFunc = function(){
				var pwd = $("input[name='user.userpwd']").val();
				var checkpwd = $("input[name='checkPwd']").val();
				if(pwd != checkpwd){
					 $("input[name='checkPwd']").parent().find(".tip").text("密码和确认密码必须一致");
					 $("input[name='checkPwd']").attr("validate","false");
					 return false;
				}
				$(this).parent().find(".tip").text("");
				$(this).attr("validate","true");
				return true;
			}
	
		$(function(){
			$("input[name='user.username'],"
			   + "input[name='checkPwd'],"
			   + "input[name='user.userpwd']").bind("change",validateLenFunc);
			
			$("input[name='checkPwd']").bind("blur",validatePwdFunc);
			$(".dropdown-menu > li").bind("click",function(){
				//alert($(this).children().attr("data"));
				var o = $(this).children();
				$("#dropdownMenu1 > span:eq(0)").html(o.text());
				$("#dropdown-input").val(o.attr("data"));
				$("#addr").text("所在地址:" + o.attr("addr"));
			});
		})
		
		var regvalidate = function(form){
			var flag = true;
			$(form).find("input[type!='hidden']").each(validateLenFunc);
			$("input").each(function(){
				if($(this).attr("validate") == "false"){
					if(flag == true){
						$(this).focus();
					}
					flag = false;
				}
			});
			if(flag && validatePwdFunc()){
				return true;
			};
			return false;
		}
	</script>
	
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<s:form onsubmit="return regvalidate(this);" action="register" namespace="/user">
					<div class="h3">
					注册信息
					</div>
						<s:actionmessage cssClass="text-center text-danger nav"/>
						<s:fielderror cssClass="text-center text-danger nav">
							<s:param>user.username</s:param>			
							<s:param>user.userpwd</s:param>
						</s:fielderror>
					<div class="form-group">
						<label class="control-label">用户名</label>
						<input type="text" name="user.username" class="form-control" placeholder="可以是中文，长度4-10位" />
						<span class="tip"></span>
					</div>
					<div class="form-group">
						<label class="control-label">密码</label>
						<input type="password" name="user.userpwd" class="form-control" placeholder="密码" />
						<span class="tip"></span>
					</div>
					<div class="form-group">
						<label class="control-label">重复密码</label>
						<input type="password" name="checkPwd" class="form-control" placeholder="密码" />
						<span class="tip"></span>
					</div>
					<div class="form-group">
						<label class="control-label">所属小区</label>
						<div class="dropdown">
						  <input id="dropdown-input" type="hidden" name="user.community.communityno" value="${communities[0].communityno }">
						  <button value="1" validate="true" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						        <span>
						        	${communities[0].communityname}
						        </span>
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<s:iterator value="#request.communities" var="comm">
								<li><a addr='<s:property value="communityaddr"/>' data='<s:property value="communityno"/>'>
								   <s:property value="communityname"/></a></li>
							</s:iterator>
						  </ul>
						<span id="addr" class="text-muted"></span>
						</div>
					</div>
					<button type="submit" class="btn btn-default center-block">保存</button>
				</s:form>
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>