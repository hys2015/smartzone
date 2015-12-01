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
    <s:set var="pageTitle">选择银行</s:set>
    <title>${pageTitle}</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<s:include value="/boot.html"></s:include>
	
	<style type="text/css">
		.table{
			table-layout:fixed;
		}
		td>img{
			width:85%;
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
			<s:form action="pay" namespace="/pay">
				<table class="table table-hover" align="center" width="600" cellspacing="0" cellpadding="2">
					<tr>
						<td class="bg-danger" align="center" colspan="4">
							<b>订单号：</b><input type="text" readonly name="orderID" value='<s:property value='#session.order.oid'/>'>    
							<b>应付金额：￥</b><input type="text" readonly name="amount" size="6" value='0.01'><b>元</b>
						</td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td colspan="4" >请选择在线支付银行</td>
					</tr>
					<tr>
			        	<td height="25" width="24%"><input type="radio" name="pd_FrpId" value="ICBC-NET">
			        		<img src="/SmartZone/img/bank/gongshang_bank.gif" alt="工商银行" title="工商银行">
			        		</td>
						<td height="25" width="24%"><input type="radio" name="pd_FrpId" value="CMBCHINA-NET">
							<img src="/SmartZone/img/bank/zhaoshang_bank.gif" alt="招商银行" title="招商银行">
							</td>
			        	<td height="25" width="24%"><input type="radio" name="pd_FrpId" value="ABC-NET">
			        		<img src="/SmartZone/img/bank/nongye_bank.gif" alt="农业银行" title="农业银行">
			        		</td>
			        	<td height="25" width="28%"><input type="radio" checked name="pd_FrpId" value="CCB-NET">
			        		<img src="/SmartZone/img/bank/jianshe_bank.gif" alt="建设银行" title="建设银行">
			        		</td>
					</tr>
					<tr>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="CEB-NET" >
			        		<img src="/SmartZone/img/bank/guangda_bank.gif" alt="光大银行" title="光大银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="BOCO-NET">
			        		<img src="/SmartZone/img/bank/jiaotong_bank.gif" alt="交通银行" title="交通银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="CMBC-NET">
			        		<img src="/SmartZone/img/bank/jiaotong_bank.gif" alt="民生银行" title="民生银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="SDB-NET">
			        		<img src="/SmartZone/img/bank/shenzhenfazhan_bank.gif" alt="深圳发展银行" title="深圳发展银行">
			        	</td>
					</tr>
					<tr>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="BCCB-NET">
			        		<img src="/SmartZone/img/bank/beijing_bank.gif" alt="北京银行" title="北京银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="CIB-NET">
			        		<img src="/SmartZone/img/bank/xingye_bank.gif" alt="兴业银行" title="兴业银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="ECITIC-NET">
			        		<img src="/SmartZone/img/bank/zhongxin_bank.gif" alt="中信银行" title="中信银行">
			        	</td>
			        	<td height="25"><input type="radio" name="pd_FrpId" value="SPDB-NET">
			        		<img src="/SmartZone/img/bank/pufa_bank.gif" alt="浦东发展银行" title="浦东发展银行">
			        	</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><input class="btn btn-primary" type="submit" value="  确认支付  "/></td>
					</tr>
				</table>
			</s:form>
			
			</div>
		</div>
	</div>
</body>
<s:include value="/foot.html"></s:include>
</html>