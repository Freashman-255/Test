<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/25
  Time: 11:14
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

<script type="text/javascript">
    $(function (){
        $.post("admin/seats_index","",function (resp){
            for(var i=0;i<10;i++){
                $("table").append("<tr class='col-md-10 col-md-offset-1'></tr>")
                for(var j=0;j<10;j++){
                    if(resp[10*i+j].seat_state == 3){
                        $("tr:last").append("<td><button onclick='change("+resp[10*i+j].seat_row+","+resp[10*i+j].seat_col+","+resp[i*10+j].seat_state+")'><img src='images/seat/freeseat.jpg' width='50' height='50' id='"+(10*i+j)+"'></button></td>")
                    } else{
                        $("tr:last").append("<td><button onclick='change("+resp[10*i+j].seat_row+","+resp[10*i+j].seat_col+","+resp[i*10+j].seat_state+")'><img src='images/seat/damageseat.jpg' width='50' height='50' id='"+(10*i+j)+"'></button></td>")
                    }
                }
            }
        })
    })
</script>

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

        <div class="row">
            <h2 align="center">修改教室状态信息</h2>
            <div class="col-md-1 col-md-offset-2">
                <img src="images/seat/damageseat.jpg" width="50px" height="50px">
            </div>
            <div class="col-md-2">
                <p style="font-size: 30px;text-align: center;">损坏</p>
            </div>
            <div class="col-md-1 col-md-offset-2">
                <img src="images/seat/freeseat.jpg" width="50px" height="50px">
            </div>
            <div class="col-md-2">
                <p style="font-size: 30px;text-align: center;">完好</p>
            </div>
        </div>
        <hr class="layui-border-black">
        <div  class="row layui-anim layui-anim-upbit" id="div">
            <table class="layui-table"></table>
        </div>
    </div>
    <script type="text/javascript">
        function change(row,col,state){
            $.post("admin/seats_change",{row:row,col:col,state:state},function (resp){
                if(resp == 1){
                    var seat = row*10+col;
                    alert("修改成功")
                    if(state == 3){
                        $("button:eq("+seat+")").attr("onclick","change("+row+","+col+","+1+")");
                        $("#"+seat).attr("src","images/seat/damageseat.jpg");
                    }else{
                        $("button:eq("+seat+")").attr("onclick","change("+row+","+col+","+3+")");
                        $("#"+seat).attr("src","images/seat/freeseat.jpg");
                    }
                }
            },"text")
        }
    </script>
</body>
</html>
