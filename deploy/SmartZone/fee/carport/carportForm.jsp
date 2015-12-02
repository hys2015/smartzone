<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="#session.message != null">
	<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<s:property value="#session.message"/>
		<%session.removeAttribute("message"); %>
	</div>
</s:if>

<s:form onsubmit="validate(this)" action="add" namespace="/fee/carport" cssClass="form-inline">
	<input class="form-control" type="number" name="carport.carportId" placeholder="车位号">
	<input class="form-control" type="number" name="carport.fee" placeholder="输入费用">
	<input class="btn btn-default" type="submit" value="添加">
</s:form>

<head>
	<script type="text/javascript">
		$(function(){
			$("#updateCarport").bind("shown.bs.modal",function(event){
				var button = $(event.relatedTarget);
				$(this).find("#carportId")
					.val(button.parent().parent().find("span#id").text().trim());
				$(this).find("#carportFee")
					.val(button.parent().parent().find("span#fee").text().trim());
			});
			bindDelete();
			bindConfirm();
		})
	</script>
</head>

<div class="modal fade bs-example-modal-lg" id="updateCarport" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑</h4>
      </div>
      <s:form onsubmit="return validate(this);" action="update" namespace="/fee/carport">
	      <div class="modal-body">
	      	<div class="form-group">
			<label>车位号</label>
	      	<input class="form-control" type="number" readonly="" id="carportId" name="carport.carportId">
	      	</div>
	      	<div class="form-group">
	      	<label>费用</label>
	      	<input class="form-control" id="carportFee" type="number" name="carport.fee">
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <input type="submit" class="btn btn-default" value="保存">
	      </div>
      </s:form>
    </div>
  </div>
</div>