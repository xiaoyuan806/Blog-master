<%--
  Created by IntelliJ IDEA.
  User: huawei
  Date: 2022/1/4
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>
    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">

            <div class="layui-card">
                <i class="layui-icon layui-icon-face-smile" style="font-size: 30px;"></i>
                <div class="layui-card-header" style="font-size: 30px">设置我的资料</div>
                <div class="layui-card-body" pad15>

                    <form class="layui-form layui-form-pane" method="post"
                          action="<%=request.getContextPath()%>/SetIfo">

                        <%--  这里是博主的id --%>
                        <div><input type="text" name="userId" id="userId"
                                    style="display: none"
                                    value="${requestScope.author.authorId}"/></div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username"
                                       value="${requestScope.author.authorName}"
                                       class="layui-input" lay-verify="id">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="password" required
                                       lay-verify="required" placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">一定要记好你的密码！</div>
                        </div>

                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">个人简介</label>
                            <div class="layui-input-block">
                                <textarea name="resume" placeholder="请输入内容"
                                          class="layui-textarea">
                                    ${requestScope.author.authorResume}
                                </textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">爱好</label>
                            <div class="layui-input-inline">
                                <input type="text" name="hobby"
                                       value="${requestScope.author.authorHobby}"
                                       class="layui-input" lay-verify="id">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">擅长领域</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="like[IT]" title="IT">
                                <input type="checkbox" name="like[WENXUE]" title="近代文学"
                                       checked>
                                <input type="checkbox" name="like[WENXUE2]" title="古典文学">
                                <input type="checkbox" name="like[dai]" title="法律">
                                <input type="checkbox" name="like[dai]" title="词典">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit
                                        lay-filter="setmyinfo">确认修改
                                </button>
                            </div>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        form.on('submit(setmyinfo)', function (data) {
        });
    })
</script>
</body>
</html>

