<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/6
  Time: 19:48
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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>用户管理</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>用户Id</th>
            <th>用户名</th>
            <th>用户简介</th>
           <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="u">
            <tr>
                <td>${u.authorId}</td>
                <td>${u.authorName}</td>
                <td>${u.authorResume}</td>
                <td><a href="<%=request.getContextPath()%>/ReUser?authorId=${u.authorId}">编辑</a></td>
                <td><a href="<%=request.getContextPath()%>/DelUser?authorId=${u.authorId}">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
