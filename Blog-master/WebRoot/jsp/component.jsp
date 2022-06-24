<%@ page import="cn.edu.ldu.bean.Author" %><%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/2
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
    <style>
        .search{
            width: 300px;
            height: 40px;
            background-color: #2c4454;
            border: 2px solid white;
            color: white;
            border-bottom-left-radius:30px ;
            border-top-left-radius:30px ;
        }
        .enter{
            width: 70px;
            border: 2px solid white;
            background-color: #2c4454;

            color: white;
            height: 40px;
            border-bottom-right-radius:30px ;
            border-top-right-radius:30px ;
        }
    </style>

</head>
<body><ul class="layui-nav layui-bg-cyan">
    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/FindAllServlet?num=1">首页</a></li>
    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/write_title.jsp">写文章</a></li>
    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/findDraft">草稿箱</a></li>

    <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/servlet/GetDiaryListServlet">备忘录</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">分类</a>
        <dl class="layui-nav-child">
            <dd><a href="<%=request.getContextPath()%>/sort?sort=1">Python</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=2">java</a></dd>

            <dd><a href="<%=request.getContextPath()%>/sort?sort=3">c/c++</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=4">前端</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=5">数据库</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=6">计算机基础</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=7">移动</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=8">AI</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=9">区块链</a></dd>
            <dd><a href="<%=request.getContextPath()%>/sort?sort=10">其他</a></dd>
        </dl>
    </li>
    <input placeholder="请输入您想搜索的内容" type="text" id="insert" class="search"/><input type="button" onclick="search()" class="enter" value="搜索"/>
    <li class="layui-nav-item" style="float: right">
        <% Author author= (Author) session.getAttribute("author");
            String authorName=author.getAuthorName();
            int authorId=author.getAuthorId();%>
        <a href="javascript:;"><%=authorName%></a>
        <dl class="layui-nav-child">
            <dd><a href="<%=request.getContextPath()%>/personalDetails">个人信息设置</a></dd>
            <dd><a href="<%=request.getContextPath()%>/ShowFriends">好友列表</a></dd>
            <dd><a href="<%=request.getContextPath()%>/ShowMyPassages">文章管理</a></dd>
            <dd><a href="<%=request.getContextPath()%>/ArticleBrowseHistory">历史浏览记录</a></dd>

        </dl>
    </li>
<%--    <div style="float: right">--%>
<%--        --%>
<%--        <p></p>--%>
<%--    </div>--%>
</ul>

<%--<nav class="topnav" id="topnav">--%>
<%--    <a href="${path}servlet/DoIndex"><span>首页</span><span class="en">Home Page</span></a>--%>
<%--    <a href="${path}write_title.jsp"><span>写文章</span><span class="en">write</span></a>--%>
<%--    <a href="${path }jsp/about.jsp"><span>关于我</span><span class="en">About Me</span></a>--%>
<%--    <a href="${path }servlet/GetTitleListServlet"><span>技术干货</span><span class="en">Life</span></a>--%>
<%--    <a href="${path }jsp/knowledge.jsp"><span>资料分享</span><span class="en">Learn</span></a>--%>
<%--    <a href="${path }servlet/GetDiaryListServlet"><span>碎言碎语</span><span class="en">Diary</span></a>--%>
<%--    <a href=""><span>精彩相册</span><span class="en">Photo</span></a>--%>
<%--    <a href="${path}jsp/message_board.jsp"><span>留言板</span><span class="en">Board</span></a>--%>
<%--</nav>--%>
<script>
    function search() {
var value=document.getElementById("insert").value;
console.log(value);
window.location.href="<%=request.getContextPath()%>/search?search="+value;
    }
</script>
</body>
</html>
