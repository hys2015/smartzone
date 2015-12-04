<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<label>
看了又看
</label>
<s:if test="#request.recommandGoods.size < 1">
	<p>
	这家店没有其他商品了
		<p>
		<(￣^￣)> 
		</p>
	</p>
</s:if>
<div class="row">
	<s:iterator value="#request.recommandGoods">
		<div class="col-md-12">
			<s:a action="detail" namespace="/store/goods">
			<s:param name="good.gid" value="gid"></s:param>
				<div class="thumbnail text-center">
					<s:if test="imgs.size < 1">
						<img class="img-thumbnail" alt="<s:property value="gname"/>">
					</s:if>
					<s:else>
					 	<p>
						<img id="view" class="img-thumbnail" src='<s:property value='imgs[0].imgUrl'/>'>
					</s:else>
					<div>
						<s:property value="gname"/>
						<br>
						<b>
						￥<s:property value="nowprice"/>
						</b>
					</div>
				</div>
			</s:a>
		</div>
	</s:iterator>
</div>