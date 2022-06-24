<%@page import="cn.edu.ldu.bean.Diary"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>闲言碎语</title>
		
		<link href="${path }css/index.css" rel="stylesheet">
		<link href="${path }css/mood.css" rel="stylesheet">
	</head>
	<body>
		<header>

		</header>
		<div class="moodlist">
		  <h1 class="t_nav">
		  	<span>删删写写，回回忆忆，一步一步，慢慢向前走。</span>
		  	<a href="${path }FindAllServlet?num=1" class="n1">网站首页</a>
		  	<a href="/" class="n2">碎言碎语</a>
			  <a href="<%=request.getContextPath()%>/jsp/write_diary.jsp" class="n1">写备忘录</a>
		  </h1>
		  <div class="bloglist">
		  	<%int sum=0; %>
		  	<c:forEach items="${requestScope.diaries}" var="diary">
			  	<ul class="arrow_box">
				    <img src="../images/<%=(sum%4)+1%>.png">
				    <%sum=sum+1; %>
				    <p>${diary.dirary_content }</p>
				    <span class="dateview">${diary.dirary_timeDate }</span>
				</ul>
		  	</c:forEach>
		  </div>
		  <br/>
		  <!-- 分页显示 -->
		  <div align="center">
			<c:choose>
				<c:when test="${page.hasPrepage}">
				  <a href="GetDiaryListServlet?currentPage=1">首页</a> | 
				  <a href="GetDiaryListServlet?currentPage=${page.currentPage-1 }">上一页</a>
				</c:when>
				<c:otherwise>
					首页 | 上一页
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page.hasNextPage}">
				<a href="GetDiaryListServlet?currentPage=${page.currentPage + 1 }">下一页</a> | 
			<a href="GetDiaryListServlet?currentPage=${page.totalPage }">尾页</a>
			</c:when>
			<c:otherwise>
				下一页 | 尾页
			</c:otherwise>
			</c:choose>
			当前为第${page.currentPage}页,共${page.totalPage}页
		  </div>
		</div>
		<br/>

	</body>
</html>