<%--
  Created by IntelliJ IDEA.
  User: TR
  Date: 2022/1/5
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <style>
        .but{background-color: #0baefa;
            color: white;
        border: 1px solid #0baefa}
        a{
            color: #6f6b6a;
            font-family: "微软雅黑", Arial, Helvetica, sans-serif
        }
        /*li{color: #6f6b6a;*/
        /*    font-family: "微软雅黑", Arial, Helvetica, sans-serif}*/
        .in{
            border: 1px solid #6f6b6a;
        }


    </style>

</head>
<body>
<div style="text-align: center; color: #6f6b6a;  font-family: '微软雅黑', Arial, Helvetica, sans-serif">
    当前第${page.currentPageNum}页/一共${page.totalPageNum}页/ <a
        href="${pageContext.request.contextPath}/${page.url}?num=1">首页</a> <a
        href="${pageContext.request.contextPath}/${page.url}?num=${page.prePageNum}">上一页</a>
    <c:forEach begin="${page.startPage}" end="${page.endPage}"
               var="pagenum">
        <a
                href="${pageContext.request.contextPath}/${page.url}?num=${pagenum}">${pagenum}</a>
    </c:forEach>

    <a
            href="${pageContext.request.contextPath}/${page.url}?num=${page.nextPageNum}">下一页</a>
    <a
            href="${pageContext.request.contextPath}/${page.url}?num=${page.totalPageNum}">末页</a>
    <input type="text" id="pagenum" name="pagenum" size="1" class="in"/><input class="but"
        type="button" value="前往" onclick="jump()" />
    <script type="text/javascript">
        function jump(){
            var totalpage = ${page.totalPageNum};
            var pagenum = document.getElementById("pagenum").value;
            //判断输入的是一个数字
            var reg =/^[1-9][0-9]{0,1}$/;
            if(!reg.test(pagenum)){
                //不是一个有效数字
                alert("请输入符合规定的数字");
                return ;
            }
            //判断输入的数字不能大于总页数
            if(parseInt(pagenum)>parseInt(totalpage)){
                //超过了总页数
                alert("不能大于总页数");
                return;
            }
            //转向分页显示的Servlet
            window.location.href="${pageContext.request.contextPath}/${page.url}?num="+pagenum;
        }
    </script>
</div>
</body>
</html>
