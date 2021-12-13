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
                    url:"admin/scholarship_manage",
                    dataType:"json",
                    type:"post",
                    success:function (resp){
                        $.each(resp,function (i,n){
                            $("tbody").append("<tr id='"+n.sno+"'><td>"+n.sno+"</td><td>"+n.username+"</td><td>"+n.level+"</td><td>"+
                                "<button type='button' name='"+n.sno+"' class='layui-btn layui-btn-normal' onclick='approve(1,"+'"'+n.sno+'"'+")'>通过</button>"+
                                "<button type='button' name='"+n.sno+"' class='layui-btn layui-btn-danger' onclick='approve(2,"+'"'+n.sno+'"'+")'>不通过</button></td></tr>")
                        })
                    }
                })
            })
        </script>
        <style type="text/css">
            a:visited{
                color:#393D49;
            }
            a:hover{
                color:#009688;
            }
            a:active{
                color: black;
            }
        </style>
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

            <form class="form-inline">
                <select name="myselect">
                    <option value="0">按学号查找</option>
                    <option value="1">按名字查找</option>
                    <option value="2">按奖学金等级查找</option>
                </select>
                <div class="form-group">
                    <input type="text" class="form-control" id="input" placeholder="请输入">
                </div>
                <div class="form-group">
                    <input type="button" class="layui-btn" value="查询" onclick="selectScho()">
                </div>
                <div class="form-group layui-col-md-offset7">
                    <a href="admin/scholarship_approved.jsp" style="font-size: 20px">已审批</a>
                </div>
            </form>
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
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <script type="text/javascript">
                layui.use("laypage",function (){
                    var laypage = layui.laypage;
                    laypage.render({
                        elem:"page",
                        count:100
                    });
                })
            </script>

            <div id="page" style="text-align: center;">

            </div>
        </div>
        <script type="text/javascript">
            function selectScho(){
                var type = $("select>option:selected").val();
                var data = $("#input").val();
                var reg = /^.{1,8}$/;
                if(!reg.test(data)){
                    alert("限制输入1-8位")
                }else {
                    $.post("admin/scholarship_query",{type:type,data:data},function (resp){
                        $("tbody").empty();
                        $.each(resp,function (i,n){
                            $("tbody").append("<tr id='"+n.sno+"'><td>"+n.sno+"</td><td>"+n.username+"</td><td>"+n.level+"</td><td>"+
                                "<button type='button' name='"+n.sno+"' class='layui-btn layui-btn-normal' onclick='approve(1,"+'"'+n.sno+'"'+")'>通过</button>"+
                                "<button type='button' name='"+n.sno+"' class='layui-btn layui-btn-danger' onclick='approve(2,"+'"'+n.sno+'"'+")'>不通过</button></td></tr>")
                        })
                    },"json")
                }
            }
            function approve(state,sno){
                $.post("admin/scholarship_approve",{state:state,sno:sno},function (resp){
                    if(resp != 0){
                        alert("审批成功")
                        $("#"+sno).remove();
                    }
                },"json")
            }
        </script>
    </body>
</html>
