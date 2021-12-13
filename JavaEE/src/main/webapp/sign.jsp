<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/7
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
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
    <script src="js/jquery-3.6.0.js"></script>
    <script src="layui/layui.js"></script>
</head>
<script type="text/javascript">
    window.onload=function () {
       var sumbit=document.getElementById('sumbit');
       sumbit.onclick=function () {
           var regpassword=document.getElementById('regpassword');
           var rpassword=document.getElementById('rpassword');

       }
    }
</script>
<body body background="images/bg.jpg"
      style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div class="container" >
    <div class="page-header ">
        <h1>第一组  <small><font color="black">&nbsp;校园生活系统</font></small></h1>
    </div>
    <div class="form row" id="myLogin" >
        <div class="form row">
            <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form" action="user/sign" method="post">
                <br>
                <div class="col-md-offset-3 col-sm-offset-3">
                    <h3 class="form-title" >请注册您的账户 </h3>
                </div>
                <div class="col-sm-9 col-md-9">
                    <div class="form-group" style="margin-top: 30px;">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="请输入包含大小英文字母六到二十位" name="username"
                        pattern="[A-z]{6,20}" oninvalid="setCustomValidity('账号格式错误')" oninput="setCustomValidity('')" required="required"/>
                    </div>
                    <div class="form-group" style="margin-top: 30px;">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="请输入大小写英文字母和数字六到二十位" id="password" name="password"
                        pattern="[A-z0-9]{6,20}" oninvalid="setCustomValidity('密码格式错误')" oninput="setCustomValidity('')" required="required"/>
                    </div>
                    <div class="form-group" style="margin-top: 30px;">
                        <i class="fa fa-check fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="请再次输入密码" name="rpassword" id="rpassword" required="required"/>
                    </div>

                    <div class="form-group">
                        <input class="radio-inline"  type="radio" value="0" name="usertype">用户
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="radio-inline col-md-offset-4" type="radio" value="1" name="usertype">管理员
                    </div>
                    <br>
                    <div class="layui-row">
                        <div class="layui-col-md5 layui-col-md-offset2">
                            <a href="login.jsp" class="layui-btn">去登录</a>
                        </div>
                        <div class="layui-col-md4 layui-col-md-offset1">
                            <input type="submit" class="layui-btn" id="sumbit" value="注册"/>
                        </div>
                    </div>
                    <div class="form-group">
                    </div>
                </div>
            </form>
        </div>


    </div>
</div>
</body>

</html>
