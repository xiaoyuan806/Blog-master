<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huawei
  Date: 2022/1/6
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>history</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>浏览历史/历史记录</legend>
</fieldset>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">温馨提示</div>
            <div class="layui-card-body">
                点击查看文章标题<br>
                可以查看具体的文章内容！！试试看！href！！！！！
            </div>
        </div>


        <table class="layui-table" lay-even="" lay-skin="nob">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>历史记录编号</th>
                <th>文章标题</th>
                <th>文章作者</th>
                <th>文章摘要</th>
                <th>文章类别</th>
                <th>文章阅读量</th>
                <th>文章发布时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.browseHistory}" var="history">
                <tr>
                    <td>${1}</td>
                    <td><a href="GetArticle?articleId=${history.articleId }">${history.articleTitle}</a></td>
                    <td>${history.authorId}</td>
                    <td>${history.summary}</td>
                    <td>${history.sortId}</td>
                    <td>${history.readAmount}</td>
                    <td>${history.articleDate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>


</body>
</html>
