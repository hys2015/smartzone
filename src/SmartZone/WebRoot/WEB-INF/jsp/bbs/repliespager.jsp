<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='/struts-tags' prefix='s' %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<s:set var="pageAction" value="'showReplies.action'" />
	<nav class="text-center">
	  	<ul class="pagination">
	    <s:if test="pager.curPage>1">
	    	<s:url var="firPageURL" action="%{pageAction}">
	    		<s:param name="pager.curPage" value="1"></s:param>
	    		<s:param name="post.postId" value="post.postId"></s:param>
	    	</s:url>
	    	<li><a href="${firPageURL }">首页</a></li>
	    	<s:url var="prePageURL" action="%{pageAction}">
	    		<s:param name="pager.curPage" value="%{pager.curPage-1}"></s:param>
	    		<s:param name="post.postId" value="post.postId"></s:param>
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
    	<a>共${pager.itemCount}项</a>
    	</li>
	  	<s:if test="pager.curPage<pager.pageCount">
	  		<s:url var="nxtPageURL" action="%{pageAction}">
	    		<s:param name="pager.curPage" value="%{pager.curPage+1}"></s:param>
	    		<s:param name="post.postId" value="post.postId"></s:param>
	    	</s:url>
	    	<li>
	    	<a href="${nxtPageURL}">下一页</a>
	    	</li>
	    	<li>
	    	<s:url var="finPageURL" action="%{pageAction}">
	    		<s:param name="pager.curPage" value="%{pager.pageCount}"></s:param>
	    		<s:param name="post.postId" value="post.postId"></s:param>
	    	</s:url>
	    	<a href="${finPageURL}">尾页</a>
	    	</li>
	  	</s:if>
  	</ul>
  	</nav>
  	<!-- 分页 end -->