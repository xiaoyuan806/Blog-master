<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/6
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<header><%@include file="component.jsp"%></header>

<h1 style="text-align:center ;margin-bottom: 50px;margin-top: 50px">${requestScope.sortname}</h1>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <c:forEach items="${requestScope.list}" var="p">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">${p.articleTitle}</div>
                    <div class="layui-card-body">
                            ${p.summary}
                        <a href="GetArticle?articleId=${p.articleId }" style="color: #0baefa">阅读全文>></a>
                    </div>
                </div>
            </div>

        </c:forEach>


    </div>
</div>

</body>
</html>
