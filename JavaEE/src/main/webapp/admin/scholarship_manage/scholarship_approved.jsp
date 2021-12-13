<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/25
  Time: 12:41
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
        <script type="text/javascript">
            $(function (){
                $.ajax({
                    url:"admin/scholarship_approved",
                    dataType:"json",
                    type:"post",
                    success:function (resp){
                        var state = "审批不通过";
                        $.each(resp,function (i,n){
                            if(n.state == 1){
                                state = "审批通过"
                            }
                            $("tbody").append("<tr><td>"+n.sno+"</td><td>"+n.username+"</td><td>"+n.level+"</td><td>"+state+"</td></tr>")
                        })
                    }
                })
            })
        </script>
    </head>
    <body>
        <div class="container">
            <div class="page-header row">
                <h1>第一组  <small><font color="black">&nbsp;校园生活系统</font> </small></h1>
            </div>
            <!--导航栏-->
            <div class="row">
                <ul class="layui-nav">
                    <li class="layui-nav-item"><a href="admin/studyroom_manage.jsp">自习室状态管理</a></li>
                    <li class="layui-nav-item">
                        <a href="admin/books_manage/books_index.jsp">图书管理</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="admin/canteen_manage.jsp">食堂反馈</a>
                    </li>
                    <li class="layui-nav-item ">
                        <a href="javascript:;">校园超市</a>
                        <dl class="layui-nav-child">
                            <dd><a href="admin/goods_manage/snacks_index.jsp">零食专区</a></dd>
                            <dd><a href="admin/goods_manage/livinggoods_index.jsp">生活用品</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item ">
                        <a href="admin/scholarship_manage/scholarship_manage.jsp">审批奖学金</a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="admin/system_manage/grade.jsp">系统反馈</a>
                    </li>
                    <li class="layui-nav-item layui-col-xs-offset4  layui-icon" lay-unselect="">
                        <a href="javascript:;"><img src="images/myhead.jpg" class="layui-nav-img"></a>
                        <dl class="layui-nav-child">
                            <dd><a href="admin/admin_manage/update_information.jsp">修改账号密码</a></dd>
                            <dd style="text-align: center;"><a href="login.jsp">退出&#xe682;</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>

            <h3 align="center">已审批奖学金</h3>
            <br/>
            <table class="layui-table">
                <colgroup>
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                </colgroup>
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>申请类型</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </body>
</html>
