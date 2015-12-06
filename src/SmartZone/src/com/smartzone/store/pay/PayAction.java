package com.smartzone.store.pay;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.smartzone.store.biz.OrderBiz;
import com.smartzone.store.entity.Order;

public class PayAction extends ActionSupport implements RequestAware {
	private Map<String, Object> request;

	/**
	 * //测试商户：商户编号
		String accountID = "10001126856";
		//测试商户：密钥
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
	 */
	
	//测试商户：商家ID
	private String p1_MerId = "10001126856";
	//测试商户：商家密钥
	private String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
	
	private String r0_Cmd ;      //业务类型
	private String r1_Code;    //扣款结果。1:扣款成功
	private String r2_TrxId;  //易宝交易订单号
	private String r3_Amt;      //扣款金额。交易结束后，易宝交易系统将实际扣款金额返回给商户
	private String r4_Cur;      //交易币种。人民币为CNY
	private String r5_Pid;      //商品ID
	private String r6_Order;  //商户订单号
	private String r7_Uid;      //易宝会员ID
	private String r8_MP;        //商户扩展信息。可任意填写1K的字符串，交易返回时将原样返回
	private String r9_BType;  //交易结果通知类型。1:交易成功回调(浏览器重定向)，2:交易成功主动通知(服务器点对点通讯)
	private String hmac;          //MD5交易签名
	
	
	public String payResult(){
		boolean result = PaymentUtil.verifyCallback(
				hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,
				r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		
		if (result) {
			if ("1".equals(r1_Code)) {
				
				SetOrderPayed();

				StringBuffer message = new StringBuffer();
				message.append("订单号为：" + r6_Order + " 的订单支付成功，"); //此时数据库中订单支付状态应为已支付，否则容易出现"无限刷点卡"的BUG
				message.append("用户支付了" + r3_Amt + "元。<br/>");
				message.append("交易结果通知类型：");
				if ("1".equals(r9_BType)) {
					message.append("浏览器重定向。<br/>");
				} else if ("2".equals(r9_BType)) {
					message.append("易宝支付网关后台程序通知。<br/>");
				}
				message.append("易宝订单系统中的订单号为：" + r2_TrxId);
				request.put("message", message);
			} else {
				request.put("message", "用户支付失败");
			}
		} else {
			request.put("message", "数据来源不合法");
		}
		return SUCCESS;
	}

	private OrderBiz orderBiz;
	
	private void SetOrderPayed() {
		Integer oid = Integer.parseInt(r6_Order);
		Order order = new Order();
		order.setOid(oid);
		order.setTrxId(r2_TrxId);
		orderBiz.payed(order);
	}

	private String orderID ;       //获取订单号
	private String amount;          //获取支付金额
	private String pd_FrpId; //获取用户所选择的银行
	
	public String pay(){
		
		//测试商户：商户接收支付成功数据的地址
		String accountCallbackURL = "http://localhost:8080/SmartZone/pay/payResult";

		String businessType = "Buy";  //业务类型。Buy为在线支付
		String currency = "CNY";      //交易币种。CNY为人民币
		String productDesc = "";      //商品描述
		String productCategory = "";  //商品种类
		String productID = "";        //商品ID
		String addressFlag = "0";     //送货地址。0为不需要，1为需要
		String accountMoreInfo = "";  //商户扩展信息
		String pr_NeedResponse = "0"; //应答机制
		
		String md5hmac = PaymentUtil.buildHmac(
				businessType, p1_MerId, orderID, amount, currency, productID, productCategory,
				productDesc, accountCallbackURL, addressFlag, accountMoreInfo, pd_FrpId,
				pr_NeedResponse, keyValue);
		
		request.put("businessType", businessType);
		request.put("accountID", p1_MerId);
		request.put("orderID", orderID);
		request.put("amount", amount);
		request.put("currency", currency);
		request.put("productID", productID);
		request.put("productCategory", productCategory);
		request.put("productDesc", productDesc);
		request.put("accountCallbackURL", accountCallbackURL);
		request.put("addressFlag", addressFlag);
		request.put("accountMoreInfo", accountMoreInfo);
		request.put("accountBankID", pd_FrpId);
		request.put("needResponse", pr_NeedResponse);
		request.put("md5hmac", md5hmac);
		
		return SUCCESS;
	}
	
	public String choseBank(){
		return SUCCESS;
	}
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getP1_MerId() {
		return p1_MerId;
	}

	public void setP1_MerId(String p1_MerId) {
		this.p1_MerId = p1_MerId;
	}

	public String getR0_Cmd() {
		return r0_Cmd;
	}

	public void setR0_Cmd(String r0_Cmd) {
		this.r0_Cmd = r0_Cmd;
	}

	public String getR1_Code() {
		return r1_Code;
	}

	public void setR1_Code(String r1_Code) {
		this.r1_Code = r1_Code;
	}

	public String getR2_TrxId() {
		return r2_TrxId;
	}

	public void setR2_TrxId(String r2_TrxId) {
		this.r2_TrxId = r2_TrxId;
	}

	public String getR3_Amt() {
		return r3_Amt;
	}

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public String getR4_Cur() {
		return r4_Cur;
	}

	public void setR4_Cur(String r4_Cur) {
		this.r4_Cur = r4_Cur;
	}

	public String getR5_Pid() {
		return r5_Pid;
	}

	public void setR5_Pid(String r5_Pid) {
		this.r5_Pid = r5_Pid;
	}

	public String getR6_Order() {
		return r6_Order;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	public String getR7_Uid() {
		return r7_Uid;
	}

	public void setR7_Uid(String r7_Uid) {
		this.r7_Uid = r7_Uid;
	}

	public String getR8_MP() {
		return r8_MP;
	}

	public void setR8_MP(String r8_MP) {
		this.r8_MP = r8_MP;
	}

	public String getR9_BType() {
		return r9_BType;
	}

	public void setR9_BType(String r9_BType) {
		this.r9_BType = r9_BType;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public String getHmac() {
		return hmac;
	}

	public void setHmac(String hmac) {
		this.hmac = hmac;
	}

	public OrderBiz getOrderBiz() {
		return orderBiz;
	}

	public void setOrderBiz(OrderBiz orderBiz) {
		this.orderBiz = orderBiz;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
}
