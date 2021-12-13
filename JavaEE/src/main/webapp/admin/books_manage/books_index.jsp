<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/25
  Time: 12:38
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
            $.post("admin/booksindex_manage",{type:"0"},function (resp){
                $.each(resp,function (i,n){
                    $("tbody").append("<tr id='"+n.bid+"'><td>"+n.bid+"</td><td>"+n.bname+"</td><td>"+n.author+"</td><td><img src='"+n.img+"'></td><td>"+n.quantity+"</td><td>"+n.borrow+"</td><td>"+
                        "<button type='button'  class='layui-btn layui-btn-normal'> <a href='admin/books_load?bid="+n.bid+"'>修改</a></button> "+
                        "<button type='button'  class='layui-btn layui-btn-danger' onclick='del("+'"'+n.bid+'"'+")' >删除</button></td></tr>")
                })
            },"json")
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
<body >
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
                <option value="0">按书名查找</option>
                <option value="1">按作者查找</option>
            </select>
            <div class="form-group">
                <input type="text" class="form-control" id="input" placeholder="请输入">
            </div>
            <div class="form-group">
                <input type="button" class="layui-btn" value="查询" onclick="selectBooks()">
            </div>
            <div class="form-group layui-col-md-offset7">
                <a href="admin/books_manage/books_add.jsp" style="font-size: 20px">引进图书 </a>
            </div>
        </form>
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="150">
                <col width="150">
                <col width="150">
                <col width="150">
                <col width="150">
            </colgroup>
            <thead>
                <tr style="text-align:center">
                    <th>编号</th>
                    <th>书名</th>
                    <th>作者</th>
                    <th>参考图片</th>
                    <th>总数</th>
                    <th>已借出</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table><br/>
        <!--分页-->
        <div class="text-center" >
            <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(0)">首页</button>
            <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(1)">上一页</button>
            <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(2)">下一页</button>
            <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(3)">尾页</button>
        </div>
        <br/><br/>
        ${requestScope.currentPage}
    </div>
    <script type="text/javascript">
        //分页函数 type用来传递参数 代表此时点击的是 首页/上一页/下一页/尾页 的哪一个
        function searchPage(type){
            $.post("admin/booksindex_manage",{type:type},function (resp){
                if(resp == null && type == 1){
                    alert("当前为首页 没有上一页")
                }else if(resp == null && type == 2){
                    alert("当前为尾页 没有下一页")
                }else {
                    $("tbody").empty();
                    $.each(resp, function (i, n) {
                        $("tbody").append("<tr id='" + n.bid + "'><td>" + n.bid + "</td><td>" + n.bname + "</td><td>" + n.author + "</td><td><img src='" + n.img + "'></td><td>" + n.quantity + "</td><td>" + n.borrow + "</td><td>" +
                            "<button type='button'  class='layui-btn layui-btn-normal' onclick='change("+'"'+n.bid+'"'+")' >修改</button>" +
                            "<button type='button'  class='layui-btn layui-btn-danger' onclick='del(" + '"' + n.bid + '"' + ")' >删除</button></td></tr>")
                    })
                }
            },"json")
        }

        function selectBooks(){
            var type = $("select>option:selected").val();
            var data = $("#input").val();
            var reg = /^.{1,15}$/
            if(!reg.test(data)){
                alert("限制输入1-15位")
            }else {
                $.post("admin/booksindex_query",{type:type,data:data},function (resp){
                    $("tbody").empty();
                    $.each(resp,function (i,n){
                        $("tbody").append("<tr><td>"+n.bid+"</td><td>"+n.bname+"</td><td>"+n.author+"</td><td><img src='"+n.img+"'></td><td>"+n.quantity+"</td><td>"+n.borrow+"</td><td>"+
                            "<button type='button'  class='layui-btn layui-btn-normal' value='1'>修改</button>"+
                            "<button type='button'  class='layui-btn layui-btn-danger' value='2'>删除</button></td></tr>")
                    })
                },"json")
            }
        }
        function del(bid){
            $.post("admin/booksdelete",{bid:bid},function (resp){
                if(resp == 1){
                    $("#"+bid).remove();
                    alert("删除成功")
                }
            },"text")
        }
    </script>
</body>
</html>
