<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
	<script type="text/javascript">
		function validate(form){
			form.getElementsByTagName("input");
			for( var i = 0 ; i < form.length ; ++i ){
				if(form[i].value == null || form[i].value.trim() == "" ){
					alert("请输入搜索内容");
					return false;
				}
			}
			return true;
		}
	</script>
</head>
<div>
	<s:form id="search" onsubmit="return validate(this);" cssClass="form-inline text-center" action="search" namespace="/notice" >
		<div class="btn-group">
		    <input type="text" name="keyword" class="btn btn-default" id="keyword" value='<s:property value='keyword'/>' placeholder="输入内容，搜索一下">
			<input type="submit" class="btn btn-default" value="搜索">
		</div>
	</s:form>
</div>