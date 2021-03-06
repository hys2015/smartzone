<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- 分页 -->
<s:if test="pager != null">
    <nav class="text-center">
	  	<ul class="pagination">
	    <s:if test="pager.curPage>1">
	    	<s:url var="firPageURL" action="/showNotice.action">
	    		<s:param name="pager.curPage" value="1"></s:param>
	    		<s:param name="seriesId" value="seriesId"></s:param>
	    	</s:url>
	    	<li><a href="${firPageURL }">首页</a></li>
	    	<s:url var="prePageURL" action="/showNotice.action">
	    		<s:param name="pager.curPage" value="%{pager.curPage-1}"></s:param>
	    		<s:param name="seriesId" value="seriesId"></s:param>
	    	</s:url>
	    	<li><a href="${prePageURL }">上一页</a></li>
	    </s:if>
	 	<li>
	 		<a>
    		<s:property value="pager.curPage"/>
		    /
 		    <s:property value="pager.pageCount"/>
	 		</a>
	 	</li>
    	<li>
    	<a>共${pager.itemCount}项(每页<s:property value="pager.pageSize"/>项)</a>
    	</li>
	  	<s:if test="pager.curPage<pager.pageCount">
	  		<s:url var="nxtPageURL" action="/showNotice.action">
	    		<s:param name="pager.curPage" value="%{pager.curPage+1}"></s:param>
	    		<s:param name="seriesId" value="seriesId"></s:param>
	    	</s:url>
	    	<li>
	    	<a href="${nxtPageURL}">下一页</a>
	    	</li>
	    	<li>
	    	<s:url var="finPageURL" action="/showNotice.action">
	    		<s:param name="pager.curPage" value="%{pager.pageCount}"></s:param>
	    		<s:param name="seriesId" value="seriesId"></s:param>
	    	</s:url>
	    	<a href="${finPageURL}">尾页</a>
	    	</li>
	  	</s:if>
  	</ul>
  	</nav>
<!-- 分页 end -->
</s:if>