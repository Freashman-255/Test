<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/7
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+'/';
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    #myLogin{
        width: 800px;
        height: 450px;
        position:absolute;
        top:50%;
        left:50%;
        margin:-225px 0 0 -400px;
    }
</style>
<head>
    <title>第一组校园生活系统</title>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mycss.css">
    <script src="js/jquery-3.6.0.js"></script>
    <script src="layui/layui.js"></script>
    <!--
    <script type="text/javascript">
        function login(){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            if(username.length<6 || username.length>30 ){
                for(var i=0;i<username.length;i++){
                    var c = username.charAt(i);
                    if(c<='A' || c>= 'z'){
                        alert("请重新输入正确的姓名");
                        return false;
                    }
                }
            }
        }
    </script>
    -->
</head>
<body body background="images/bg.jpg"
      style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div class="container" >
    <div class="page-header ">
        <h1>第一组  <small><font color="black">&nbsp;校园生活系统</font> </small></h1>
    </div>
    <div class="form row" id="myLogin" >
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3"  name="myform" method="post" action="user/login">
            <div class="col-md-offset-3 col-sm-offset-3">
                <h3 class="form-title" id="head">请登录您的账户</h3>
            </div>

            <br>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="请输入大小写英文字母六到二十位" name="username" id="username"
                    pattern="[A-z0-9]{6,30}" oninvalid="setCustomValidity('账号格式错误')" oninput="setCustomValidity('')" required="required"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="请输入大小写英文字母和数字六到二十位"  name="password" id="password"
                    pattern="[A-z0-9]{6,30}" oninvalid="setCustomValidity('密码格式错误')" oninput="setCustomValidity('')" required="required"/>
                </div>
                <br>
                <div class="layui-row">
                    <div class="layui-col-md4 layui-col-md-offset2">
                        <a href="sign.jsp" id="register_btn" class="layui-btn">注册</a>
                    </div>

                    <div class="layui-col-md3 layui-col-md-offset2">
                        <input type="submit" class="layui-btn" value="登录"/>
                    </div>
                </div>
                <div class="layui-row">
                    <div>
                        <h3 style="text-align: center">${error}</h3>
                    </div>
                </div>
            </div>
        </form>

    </div>

</div>

</body>

</html>
