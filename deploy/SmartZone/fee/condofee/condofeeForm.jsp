<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<p>
<a class="btn btn-default" id="addcondobill">添加物业信息</a>
</p>
<div id="condobill" class="panel panel-default" >
<s:form onsubmit="return formvalidate(this,'请不要留空白');" cssClass="panel-body" action="saveFee" namespace="/fee/condofee">
<button type="button" value="0" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<p class="text-muted">选择用户并添加与他相关的物业费信息</p>
		<div class="form-group">
			<label>用户</label>
			<div class="dropdown" style="display:inline-block">
			  <input id="username" type="hidden" name="condofee.username">
			  <button value="1" class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			        <span>
			        	请选择
			        </span>
			    <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				<s:iterator value="#request.users">
					<li class="dropdown-item"><a><s:property value="username"/></a></li>
				</s:iterator>
			  </ul>
			</div>
		</div>
		<div class="form-group">
           <label for="begintime" class="control-label">开始日期</label>
           <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="begintime" data-link-format="yyyy-mm-dd">
               <input class="form-control" size="16" type="text" value=" " readonly>
               <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			   <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
           </div>
           <input type="hidden" name="condobill.begintime" id="begintime" value="" />
        </div>
		<div class="form-group">
			<label>周期</label>
			<div class="input-group">
				<input id="period" name="period" class="form-control" type="number">
				<span class="input-group-addon">
				个月
				</span>
			</div>
		</div>
		<div class="form-group">
			<label>到期时间</label>
			<input id="endtime" readonly="true" class="form-control" name="condobill.endtime">
		</div>
		<div class="form-group">
			<label>总计</label>
			<div class="input-group">
				<span class="input-group-addon">￥</span>
				<input class="form-control" type="number" name="condobill.price">
			</div>
		</div>
		<input type="submit" class="center-block btn btn-default" value="保存">
</s:form>
</div>
<head>
<script type="text/javascript" src="/SmartZone/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/SmartZone/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<link href="/SmartZone/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
    }).on("changeDate",function(){
    	if($("#period").val() != undefined && $("#period").val() > 0){
    			calculate();
    		}
    });
    
    var calculate = function(){
    	var sdate = $("#begintime").val();
		sdate = new Date(sdate);
		var month = sdate.getMonth();
		month = month + parseInt($("#period").val());
		sdate.setMonth(month);
		$("#endtime").val(sdate.getFullYear() +"-"+(sdate.getMonth()+ 1) + "-" + sdate.getDate());
		$("#total").text($("span#fee").text().trim() * $("#period").val());
    }
    
		$(function(){
			$("#condobill").hide();
			$("#addcondobill").bind("click",function(){
				$("#condobill").toggle(300);
			});
			$(".dropdown-item > a").bind("click",function(){
				var o = $(this);
				$("button.dropdown-toggle > span:eq(0)").text(o.text().trim());
				$("#username").val(o.text().trim());
			});
			$("input[type=number]").bind("change",function(){
				if($(this).val() < 0){
					$(this).val(0);
				}
			});
			$(".update").bind("click",function(){
				var root = $(this).parent().parent();
				$("button.dropdown-toggle > span:eq(0)")
					.text(root.find(".username").text().trim());
				$("input[name='condobill.price']")
					.val(root.find(".price").text().trim())
					.focus();
				var bid = root.attr("bid");
				
				var bid_ctrl = $("#condobill #bid");
				if(bid_ctrl.length < 1){
					bid_ctrl = $("<input>",{
					attr:{  type:"hidden",
							name:"condobill.bid",
							id:"bid",
							value:bid
							}
					});
					$("#condobill > form").prepend(bid_ctrl);
				}else{
					bid_ctrl.val(bid);
					bid_ctrl.removeAttr("disabled");
				}
				$("#condobill").show();
			});
			$(".close").bind("click",function(){
				$("#condobill").hide();
				$(this).parent().find("#bid").attr("disabled","true");
			})
			$("#period").bind("change",function(){
    		if($(this).val() < 0){
    			$(this).val(0);
    		}
    		if($("#begintime").val() != undefined){
    			calculate();
    		}
    	});
 		})
</script>
</head>