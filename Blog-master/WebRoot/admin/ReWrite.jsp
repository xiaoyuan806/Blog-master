<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/6
  Time: 20:19
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
<form class="layui-form layui-form-pane" action="<%=request.getContextPath()%>/ReUpdateUser">

    <div class="layui-form-item">
        <label class="layui-form-label">用户Id</label>
        <div class="layui-input-inline">
            <input type="text" name="authorId" readonly="readonly" lay-verify="required" value="${requestScope.author.authorId}"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${requestScope.author.authorName}" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required" value="${requestScope.author.password}" autocomplete="off" placeholder="请输入密码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户爱好</label>
        <div class="layui-input-block">
            <input type="text" name="hobby" lay-verify="required" value="${requestScope.author.authorHobby}" placeholder="请输入爱好" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">擅长领域</label>
        <div class="layui-input-block">
            <input type="text" name="sortname" lay-verify="required" value="${requestScope.author.sortName}" placeholder="请输入擅长领域" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">个人简介</label>
        <div class="layui-input-block">
            <input name="resume" placeholder="请输入个人简介" value="${requestScope.author.authorResume}" lay-verify="required" class="layui-textarea"></input>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
    </div>
</form>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        form.on('submit(demo2)', function(data){


        });
    })</script>
</body>
</html>
