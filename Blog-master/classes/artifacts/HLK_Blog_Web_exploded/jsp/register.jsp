<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/4
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="<%=request.getContextPath()%>/register">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户爱好</label>
        <div class="layui-input-block">
            <input type="text" name="hobby" lay-verify="required" placeholder="请输入爱好" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">擅长领域</label>
        <div class="layui-input-block">
            <input type="text" name="sortname" lay-verify="required" placeholder="请输入擅长领域" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">个人简介</label>
        <div class="layui-input-block">
            <textarea name="resume" placeholder="请输入个人简介" lay-verify="required" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
    </div>
</form>
<div style="color: red">
    <% request.setCharacterEncoding("UTF-8");
        if (request.getAttribute("message")!=null){
            out.print("注册失败");
        }
    %>
</div>
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
