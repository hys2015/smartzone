<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<head>
	<style type="text/css">
		#carousel-newgoods{
			border: 1px solid #eee;
			min-height:22em;
		}
		#carousel-newgoods img{
			height:22em;
		}
		#carousel-newgoods .carousel-caption a{
			display:inline-block;
			color:#fff;
		}
		#carousel-newgoods .carousel-caption a:hover{
			border-radius:5px;
			text-decoration:none;
			background-color:rgba(105,181,241,0.7);
		}
	</style>
</head>
<label>最新上架</label>
<s:a action="userShow" namespace="/store">去商店逛逛 <span class="glyphicon glyphicon-gift"></span> </s:a>
<div id="carousel-newgoods" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-newgoods" data-slide-to="0" class="active"></li>
	    <s:iterator value="#request.goods" status="sta">
		    <li data-target="#carousel-newgoods" data-slide-to='<s:property value="#sta.count"/>'></li>
	    </s:iterator>
	  </ol>
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img class="center-block" src="img/newgoods2.jpg" alt="2">
	      <div class="carousel-caption">
	      	<h1>
	      	新品上架
	      	</h1>
	      </div>
	    </div>
	    <s:iterator value="#request.goods">
    	 <div class="item">
    	  <s:if test="imgs.size > 0">
		      <img class="center-block" src='<s:property value='imgs[0].imgUrl'/>' alt='<s:property value='gname'/>'>
    	  </s:if>
	      <div class="carousel-caption">
	      	<h3>
	      		<s:a action="detail" namespace="/store/goods">
	      			<s:param name="good.gid" value="gid"></s:param>
	      			<b>
	      			<s:property value="gname"/>
	      			</b>
	      			<br>
		      		￥<s:property value="price"/>
	      		</s:a>
	      	</h3>
	      </div>
	    </div>
	    </s:iterator>
	  </div>
	  
	  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-newgoods" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-newgoods" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div><!-- carousel -->