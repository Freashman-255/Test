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
                $.post("admin/snacksindex_manage",{type:"0"},function (resp){
                    $.each(resp,function (i,n){
                        $("tbody").append("<tr id='"+n.gid+"'><td>"+n.gid+"</td><td>"+n.gname+"</td><td><img src='"+n.img+"'></td><td>"+n.price+"</td><td>"+n.remain+"</td><td>"+
                            "<button type='button'  class='layui-btn layui-btn-normal'  onclick='change("+n.gid+")'>修改</button>"+
                            "<button type='button'  class='layui-btn layui-btn-danger'  onclick='del("+n.gid+")'>删除</button></td></tr>")
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
            <!--零食表格-->
            <form class="form-inline">
                <div class="form-group">
                    <label>请输入物品名:<input type="text" class="form-control" id="queryText"></label>
                </div>
                <div class="form-group">
                    <input type="button" class="layui-btn" value="查询" id="queryBtn">
                </div>
                <div class="form-group layui-col-md-offset7">
                    <a href="admin/goods_manage/snacks_add.jsp" style="font-size: 20px">上新</a>
                </div>
            </form>
            <table class="layui-table">
                <colgroup>
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="200">
                </colgroup>
                <thead>
                <tr style="text-align:center">
                    <th>编号</th>
                    <th>名称</th>
                    <th>参考图片</th>
                    <th>价格</th>
                    <th>余量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <br/>
            <!--分页-->
            <div class="text-center" id="snacksPage">

                <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(0)">首页</button>
                <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(1)">上一页</button>
                <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(2)">下一页</button>
                <button class="layui-btn layui-btn-primary layui-btn-sm" onclick="searchPage(3)">尾页</button>

<%--                <span>跳转到第</span>--%>
<%--                <input id="searchCurrentPage()" type="text" style="width: 35px;height: 25px;">--%>
<%--                <span>页</span>--%>
            </div>
            <br/><br/>
        </div>
        <script type="text/javascript">
            //分页函数 type用来传递参数 代表此时点击的是 首页/上一页/下一页/尾页 的哪一个
            function searchPage(type){
                $.post("admin/snacksindex_manage",{type:type},function (resp){
                    if(resp == null && type == 1){
                        alert("当前为首页 没有上一页")
                    }else if(resp == null && type == 2){
                        alert("当前为尾页 没有下一页")
                    }else{
                        $("tbody").empty();
                        $.each(resp,function (i,n){
                            $("tbody").append("<tr id='"+n.gid+"'><td>"+n.gid+"</td><td>"+n.gname+"</td><td><img src='"+n.img+"'></td><td>"+n.price+"</td><td>"+n.remain+"</td><td>"+
                                "<button type='button'  class='layui-btn layui-btn-normal'  onclick='change("+n.gid+")'>修改</button>"+
                                "<button type='button'  class='layui-btn layui-btn-danger'  onclick='del("+n.gid+")'>删除</button></td></tr>")
                        })
                    }
                },"json")
            }

            //模糊查询函数
            $("#queryBtn").click(function (){
                var data = $("#queryText").val();
                var reg = /^.{1,15}$/;
                if(!reg.test(data)){
                    alert("限制输入1-15位")
                }else {
                    $.ajax({
                        url:"admin/snacksindex_query",
                        data:{
                            "data":data
                        },
                        dataType:"json",
                        success:function (resp){
                            $("tbody").empty();
                            $("#snacksPage").remove();//模糊查询时 删除分页功能
                            $.each(resp,function (i,n){
                                $("tbody").append("<tr><td>"+n.gid+"</td><td>"+n.gname+"</td><td><img src='"+n.img+"'></td><td>"+n.price+"</td><td>"+n.remain+"</td><td>"+
                                    "<button type='button'  class='layui-btn layui-btn-normal' value='1'>修改</button>"+
                                    "<button type='button'  class='layui-btn layui-btn-danger' value='2'>删除</button></td></tr>"
                                )
                            })
                        },
                        type:"post"
                    })
                }
            })

            //根据商品id 删除商品
            function del(gid){
                $.ajax({
                    url:"admin/goodsdelete",
                    data:{
                        "gid":gid
                    },
                    success:function (resp){
                        if(resp==1){
                            $("#"+gid).remove();
                            alert("删除成功！")
                        }
                    },
                    type: "post"
                })
            }
        </script>
    </body>
</html>
