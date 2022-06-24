<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huawei
  Date: 2022/1/6
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Own passages</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>管理我的文章内容</legend>
</fieldset>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">温馨提示</div>
            <div class="layui-card-body">
                可以删除 可以删除！！！！
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
                <th>文章编号</th>
                <th>文章标题</th>
                <th>文章作者id</th>
                <th>文章摘要</th>
                <th>文章类别</th>
                <th>文章阅读量</th>
                <th>文章发布时间</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.myOwnPassage}" var="passage">
                <tr>
                    <td>${1}</td>
                    <td>${passage.articleTitle}</td>
                    <td>${passage.authorId}</td>
                    <td>${passage.summary}</td>
                    <td>${passage.sortId}</td>
                    <td>${passage.readAmount}</td>
                    <td>${passage.articleDate}</td>
                    <td>
<%--                        <a href="PersonalPassageManageServlet?article_id=${passage.articleId}">删除</a>--%>
                        <a href="<%=request.getContextPath()%>/PersonalPassageManage?article_id=${passage.articleId}">删除</a>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>
</div>

<script>

</script>

</body>
</html>
