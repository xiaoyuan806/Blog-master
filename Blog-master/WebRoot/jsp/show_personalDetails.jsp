<%--
  Created by IntelliJ IDEA.
  User: huawei
  Date: 2022/1/6
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
    <style type="text/css">

        .ulStyle {
            list-style: none;
            width: 140px;
        }

        .ulStyle li {
            background-color: white;
            list-style: none;
        }
    </style>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>你好，${requestScope.author_own.authorName}，欢迎来到我的博客！</legend>
</fieldset>
<div class="layui-fluid">


    <div class="layui-bg-gray" style="padding: 30px;">
        <div class="layui-row layui-col-space15">
            <div class="layui-card">
                <div class="layui-card-header">我的博客</div>
                <div class="layui-card-body">
                    本栏目为个人信息展示界面
                </div>
            </div>

            <div class="layui-card">
                <div class="layui-card-header">我的博客</div>
                <div class="layui-card-body">
                    <table class="layui-table" lay-even="" lay-skin="nob">
                        <colgroup>
                            <col width="150">
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>博主姓名</th>
                            <th>博主爱好</th>
                            <th>博主的个人简介</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>${requestScope.author_friend.authorName}</th>
                            <th>${requestScope.author_friend.authorHobby}</th>
                            <th>${requestScope.author_friend.authorResume}</th>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>
