<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/5
  Time: 8:20
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
<a href="${path }FindAllServlet?num=1"><h1>返回首页</h1></a>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <c:forEach items="${requestScope.list}" var="p">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">${p.articleTitle}</div>
                    <div class="layui-card-body">
                            ${p.summary}
                        <a href="<%=request.getContextPath()%>/Rewrite?draftId=${p.draftId}" style="color: #0baefa">重新编辑>></a>
                    </div>
                </div>
            </div>

        </c:forEach>


    </div>
</div>
</body>
</html>
