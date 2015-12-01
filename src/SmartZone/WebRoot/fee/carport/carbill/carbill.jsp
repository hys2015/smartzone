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
    <s:set var="pageTitle" >缴费</s:set>
    <title>${pageTitle }</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<s:include value="/boot.html"></s:include>
	<link href="/SmartZone/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
  </head>
  
<body>
<s:include value="/nav.jsp"></s:include>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h2>${pageTitle }</h2>
				<s:if test="needFee > 0">
					<s:if test="#request.bill !=null">
						上次缴费到期时间是:
						<span class="text-danger">
							<s:date name="#request.bill.endtime" format="yyyy-MM-dd"/>
						</span>
					</s:if>
					<s:form action="addCarbill" namespace="/fee/carport/carbill">
						<div class="form-group">
							<label>车位号</label>
							<input class="form-control" type="number" readonly="true" name="carport.carportId" value='<s:property value="carport.carportId"/>'>
							费用:￥
							<span id="fee">
							<s:property value="carport.fee"/>
							</span>
							元/月
						</div>
						<div class="form-group">
			                <label for="begintime" class="control-label">开始日期</label>
			                <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="begintime" data-link-format="yyyy-mm-dd">
			                    <input class="form-control" size="16" type="text" value=" " readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
							<input type="hidden" name="carbill.begintime" id="begintime" value="" />
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
							<input id="endtime" readonly="true" class="form-control" name="carbill.endtime">
						</div>
						<div class="form-group">
							<label>总计</label>
							<span id="total">0</span>
							元
						</div>
						<input type="submit" class="center-block btn btn-primary" value="生成订单">
					</s:form>
				</s:if>
				<s:else>
					<p class="text-center">
						<b>
							<s:property value="carport.carportId"/>号车位
						</b>
						不需要缴费,缴费到期时间为:
						<span class="text-danger">
							<s:date name="#request.bill.endtime" format="yyyy-MM-dd"/>
						</span>
					</p>
				</s:else>
			</div>
		</div>
	</div>
<script type="text/javascript" src="/SmartZone/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="/SmartZone/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
	
</body>
<s:include value="/foot.html"></s:include>
</html>