<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Input From UI Design</title>
    <style>
        body
        {
            margin:0;
            padding: 0;
            font-family: sans-serif;
            background: url(<%=request.getContextPath()%>/jsp/login_bg.jpg);
            background-size: cover;
        }
        .box
        {
            position: absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width:400px;
            padding: 40px;
            background: rgba(0,0,0,.8);
            box-sizing : border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.5);
            border-radius: 10px;
        }
        .box h2
        {
            margin:0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }
        .box .inputBox
        {
            position: relative;
        }
        .box .inputBox input
        {
            width:100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }
        .box .inputBox label
        {
            position: absolute;
            top:0;
            left: 0;
            padding: 10px 0;
            letter-spacing: 1px;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }
        .box .inputBox input:focus ~ label,
        .box .inputBox input:valid ~ label
        {
            top:-18px;
            left:0;
            color:#03a9f4;
            font-size: 12px;
        }
        .box input[type="submit"]
        {
            background: transparent;

            border: none;
            outline:none;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor:pointer;
            border-radius: 5px;
        }
        button{
            position: relative;
            left:190px;
            bottom: 35px;
            border: none;
            outline:none;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor:pointer;
            border-radius: 5px;

        }

    </style>
</head>
<body>
<div class="box">
    <h2>Login</h2>
    <form action="<%=request.getContextPath()%>/login">
        <div class="inputBox">
            <input type="text" name="username" required="">
            <label>Username</label>
        </div>
        <div class="inputBox">
            <input type="password" name="password" required="">
            <label>password</label>
        </div>
        <div style="color: red">
            <% request.setCharacterEncoding("UTF-8");
                if (request.getAttribute("message")!=null){
                    out.print("账号或密码错误");
                }
            %>
        </div>
        <input type="submit" name="" value="Submit">

    </form>
    <button onclick="javascrtpt:window.location.href='<%=request.getContextPath()%>/jsp/register.jsp'">Register</button>
</div>

</body>
</html>
