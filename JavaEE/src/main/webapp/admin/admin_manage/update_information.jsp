<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/12/3
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>第一组校园生活系统</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mycss.css">
    <script src="js/jquery-3.6.0.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
    <div class="layui-row">
        <div class="layui-col-md-offset4 layui-col-md4" style="margin-top: 50px;">
            <h3 align="center">修改账户信息</h3><br/><br>
            <form name="myform" class="layui-form" method="post" action="update_password" lay-filter="example" style="margin-left: 25px;">
                <div class="layui-inline">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <div id="username">${sessionScope.username}</div>
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">原密码</label>
                    <div class="layui-input-block">
                        <input type="text" name="oldpassword" id="oldpassword" lay-verify="required"  autocomplete="off" placeholder="请输入原密码" class="layui-input" onblur="checkOld()">
                        <p id="old_message"></p>
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="text" name="newpassword" placeholder="请输入新密码" class="layui-input" onblur="checkNew()">
                        <p id="new_message"></p>
                    </div>
                </div>
                <br/><br/>
                <div class="layui-form-item">
                    <div class="layui-input-inline" style="margin-left: 150px;">
                        <button type="submit" class="layui-btn">提交</button>
                        <h5>${requestScope.message}</h5>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        //检查旧密码是否正确
        function checkOld(){
            var reg = /^[A-z0-9]{6,30}$/;
            var oldpassword = document.myform.oldpassword;
            var message = $("#old_message");
            if(!reg.test(oldpassword.value)){
                message.text("× 格式错误 请重新输入!");
                message.attr("style","color:red");
                oldpassword.focus();
                alert("false")
                return false;
            }else{
                $.post("check_password",{password:oldpassword.value},function (resp){
                    if(resp == "1"){
                        message.attr("style","color:#009688");
                        message.text("√ 输入正确 请继续输入")
                        alert("true")
                        return true
                    }else{
                        message.attr("style","color:red");
                        message.text("× 密码错误 请重新输入!")
                        oldpassword.focus();
                        alert("false")
                        return false;
                    }
                },"json")
            }
        }
        function checkNew(){
            var reg = /^[A-z0-9]{6,30}$/;
            var newpassword = document.myform.newpassword;
            var oldpassword = document.myform.oldpassword;
            var message = $("#new_message");
            if(!reg.test(newpassword.value) || newpassword.value == oldpassword.value){
                message.text("× 格式错误 请重新输入!");
                message.attr("style","color:red");
                newpassword.focus();
                alert("false")
                return false;
            }else{
                message.attr("style","color:#009688");
                message.text("√ 输入正确 请继续输入")
                alert("true")
                return true
            }
        }
        /*
        function checkAll(){
            if(!checkOld() || !checkNew()){
                alert("请将信息填写正确")
                return false;
            }else {
                alert("修改成功")
                return true;
            }
        }
         */
    </script>
</body>
</html>
