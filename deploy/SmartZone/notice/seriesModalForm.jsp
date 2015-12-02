<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改分类</h4>
      </div>
     <s:form onsubmit="return validate(this);" action="updateSeries" namespace="/notice">
      <div class="modal-body">
        	<div class="form-group">
        		<label>名称</label>
        		<input type="hidden" id="seriesId" name="series.seriesId">
        		<input type="text" class="form-control" id="seriesName" name="series.seriesName">
        	</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-default" data-dismiss="modal" value="1">取消</button>
      	<input type="submit"  class="btn btn-primary" value="保存">
      </div>
     </s:form>
    </div>
  </div>
</div>  
