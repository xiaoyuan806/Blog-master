<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huawei
  Date: 2022/1/5
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FriendsList</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
    <style>
        /*.overflow {*/
        /*    width: 50px;*/
        /*    height: 80px;*/
        /*    background-color: pink;*/
        /*    margin: 100px auto;*/
        /*    !*强制文字在一行文本框内*!*/
        /*    white-space: nowrap;*/
        /*    !*溢出部分文字隐藏*!*/
        /*    overflow: hidden;*/
        /*    !*溢出部分省略号处理*!*/
        /*    text-overflow: ellipsis;*/
        /*}*/
        table {
            table-layout:fixed;
        }
        table tbody td {
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

    </style>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>好友列表/通讯录</legend>
</fieldset>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">温馨提示</div>
            <div class="layui-card-body">
                点击查看个人主页下方的链接<br>
                可以查看好友的个人信息页面
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
                <th>好友编号</th>
                <th>好友姓名</th>
                <th>好友简介</th>
                <th>好友爱好</th>
                <th>查看个人主页</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.friendList}" var="friend">
                <tr>
                    <td>${1}</td>
                    <td>${friend.authorName}</td>
                    <td>${friend.authorHobby}</td>
                    <td class="overflow">${friend.authorResume}</td>

                    <td>
                        <a href="<%=request.getContextPath()%>/ShowDetails?id=${friend.authorId}">点这里！</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
