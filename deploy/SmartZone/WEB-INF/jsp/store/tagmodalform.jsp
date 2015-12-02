<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="modal fade bs-example-modal-lg" id="newtag" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加新标签</h4>
    </div>
    <s:form action="addTag" namespace="/store" onsubmit="return formvalidate(this,'请不要留空白');">
      <div class="modal-body">
      	目前所有标签
      	<div class="panel panel-default">
      		<div class="panel-body">
      			<s:if test="#request.tags.size < 1">
      				暂无标签
      			</s:if>
      			<s:iterator value="#request.tags">
      				<span class="label label-danger">
      					<s:property value="title"/>
      				</span>
      			</s:iterator>
      		</div>
      	</div>
      	本店已有标签
      	<div class="panel panel-default">
      		<div class="panel-body">
      			<s:if test="#request.shop.tags.size < 1">
      				暂无标签
      			</s:if>
      			<s:iterator value="#request.shop.tags">
      				<span class="label label-danger">
      					<s:property value="title"/>
      				</span>
      			</s:iterator>
      		</div>
      	</div>
		<div class="form-group">
			<input type="hidden" name="shop.sid" value="${shop.sid }">
			<label>新标签</label>
			<input type="text" name="tag.title" class="form-control">
		</div>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="提交" ></button>
      </div>
    </s:form>
    </div>
  </div>
</div>
