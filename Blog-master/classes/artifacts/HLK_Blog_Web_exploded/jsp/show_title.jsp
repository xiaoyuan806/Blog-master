
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>

<html>
	<head>
		<title>文章分享</title>
		<link href="${path }css/knowledge.css" rel="stylesheet" type="text/css">
		<link href="${path }css/index.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>

		<!-- 引入 layui.js -->
		<script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
		<style>
			#ds-recent-visitors .ds-avatar img {
				width: 78px !important;
				height: 78px !important;
			}
			.ds-avatar {
				float: left;
			}
			.in{
				width: 300px;
				height: 40px;
				background-color: #2c4454;
				border: 2px solid white;
				color: white;
				border-bottom-left-radius:30px ;
				border-top-left-radius:30px ;
			}
			.but{
				width: 70px;
				border: 2px solid white;
				background-color: #2c4454;

				color: white;
				height: 40px;
				border-bottom-right-radius:30px ;
				border-top-right-radius:30px ;
			}
		</style>
	</head>
	<body>
		<header>
<%--		    <%@include file="component.jsp"%>--%>
		</header>
		<article class="blogs">
			<h1 class="t_nav">
			  	<span>您当前的位置：
			  		<a href="${path }FindAllServlet?num=1">首页</a>&nbsp;&gt;&nbsp;
				  	<a>文章列表</a>&nbsp;&gt;&nbsp;
				  	<a>文章分享</a>
					<a href="AddF?articleId=${requestScope.article.articleId}">关注该用户</a>
			  	</span>
			  	<a href="${path }FindAllServlet?num=1" class="n1">网站首页</a>
			  	<a class="n2">阅读全文</a>
			</h1>
		  	<div class="index_about">
			    <h2 class="c_titile">${requestScope.article.articleTitle }</h2>
			    <p class="box_c">
			    		<span class="d_time">发布时间：${requestScope.article.articleDate }</span>
			    		<span></span><span>阅读量：${requestScope.article.readAmount }</span>
			    </p>
			    <ul class="infos">
			      ${requestScope.article.articleContent }
			      <p>
			      	<img src="${path}images/knowledge.png">
			      </p>
			    </ul>
		    <div class="keybq">
		    	<p><span>关键字词</span>：Java、Web、考研资料</p>
		    </div>
		    <div class="ad"> </div>
		    <div class="nextinfo">
		      <p>上一篇：<a href="GetArticle?articleId=${requestScope.pre_article.articleId }">${requestScope.pre_article.articleTitle }</a></p>
		      <p>下一篇：<a href="GetArticle?articleId=${requestScope.next_article.articleId }">${requestScope.next_article.articleTitle }</a></p>
		    </div>
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					<legend>写评论</legend>
				</fieldset>
				<input placeholder="请输入您的评论" id="comm" class="in" /><input class="but" onclick="comment()" type="button" value="发布"/>
				<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					<legend>评论列表</legend>
				</fieldset>

				<div>
					<c:forEach items="${requestScope.comment}" var="com">
						<p><a>${com.authorId}</a>---<a>${com.commentcontent}</a></p>
					</c:forEach>
				</div>
		    <div class="otherlink">
		      <h2>相关文章</h2>
		      <ul>
		        <li><a>如何使用Ajax做一个百度分享</a></li>
		        <li><a>javascript中常用的正则表达式</a></li>
		        <li><a>MySQL的增删改查</a></li>
		        <li><a>java反射的实用示例</a></li>
		        <li><a>爱情没有永远，地老天荒也走不完</a></li>
		        <li><a>爱情的失去者</a></li>
		      </ul>
		    </div>
		  </div>
		  <aside class="right">
		  	<div class="rnav">
				<h2>栏目导航</h2>
      			<ul>
			      	<li class="rnav1"><a>Html5|CSS3</a></li>
			      	<li class="rnav2"><a>推荐工具</a></li>
			      	<li class="rnav3"><a>心得笔记</a></li>
			      	<li class="rnav4"><a>经验分享</a></li>
					<li class="rnav5"><a>经典书籍</a></li>
					<li class="rnav6"><a>软件安装</a></li>
    			</ul>
    		</div>
		    <!-- Baidu Button BEGIN -->

		    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
		    <script type="text/javascript" id="bdshell_js"></script> 
		    <script type="text/javascript">
			document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
			</script>
			  <script>
				  function comment() {
var comm=document.getElementById("comm").value;
					  window.location.href="<%=request.getContextPath()%>/addcomm?comment="+comm+"&articleId="+${requestScope.article.articleId};
				  }
			  </script>
		    <!-- Baidu Button END -->
		    <div class="blank"></div>

		  </aside>
		</article>
		<footer>

		</footer>
		<script src="js/silder.js"></script>
	</body>
</html>