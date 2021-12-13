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
    </head>
    <script type="text/javascript">
        var $file=$("#file");
        $file.click(function(){
            console.log($flie.val());
        });
    </script>
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
            <!--上架图书表单-->
            <form class="layui-form" style="font-size: 20px" method="post" action="admin/booksadd" name="myform" enctype="multipart/form-data">
                <div class="row" style="text-align: center">
                    <h2>上架图书</h2>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <label>请输入书籍编号：</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="bid" id="bid" placeholder="请输入4位书籍编号" onblur="checkBid()">
                    </div>
                    <p id="bid_message"></p>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <label>请输入书籍名称：</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="bname" id="bname" placeholder="请输入1-10位的书籍名称" onblur="checkBname()">
                    </div>
                    <p id="bname_message"></p>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <label>请输入作者名称：</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="author" id="author" placeholder="请输入1-10位的作者名称" onblur="checkAuthor()">
                    </div>
                    <p id="author_message"></p>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <label>请输入书籍个数：</label>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" name="quantity" id="quantity" placeholder="请输入1-999999以内的数量" onblur="checkQuantity()">
                    </div>
                    <p id="quantity_message"></p>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-2">
                        <label>请选择参照图：</label>
                    </div>
                    <div class="col-md-4">
                        <input type="file" id="file" name="img">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-lg-offset-4">
                        <img src="images/dufu.jpg" id="img" name="img" width="240px" height="240px">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <input type="submit" class="layui-btn" onclick="return checkAll()" value="上架图书">
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript">
            function checkBid(){
                var reg = /^[0-9]{4}$/;
                var bid = $("#bid").val();
                var message = $("#bid_message");
                if(!reg.test(bid)){
                    message.text("× 格式错误 请重新输入!");
                    message.attr("style","color:red");
                    bid.focus();
                    return false;
                }else{
                    $.post("admin/books_check",{bid:bid},function (resp){
                        if(resp == "1"){
                            message.attr("style","color:#009688");
                            message.text("√ 输入正确 请继续输入")
                            bid.onblur();
                            return true
                        }else{
                            message.attr("style","color:red");
                            message.text("× 该编号已经存在 请重新输入!")
                            bid.focus();
                            return false;
                        }
                    },"json")
                }
            }
            function checkBname(){
                var reg = /^.{1,10}$/
                var bname = $("#bname").val();
                var message = $("#bname_message");
                if(!reg.test(bname)){
                    message.attr("style","color:red");
                    message.text("× 格式错误 请重新输入!");
                    bname.focus();
                    return false;
                }else{
                    message.attr("style","color:#009688");
                    message.text("√ 输入正确 请继续输入");
                    return true;
                }
            }
            function checkAuthor(){
                var reg = /^.{1,10}$/
                var author = $("#author").val();
                var message = $("#author_message");
                if(!reg.test(author)){
                    message.attr("style","color:red");
                    message.text("× 格式错误 请重新输入!");
                    author.focus();
                    return false;
                }else{
                    message.attr("style","color:#009688");
                    message.text("√ 输入正确 请继续输入");
                    return true;
                }
            }
            function checkQuantity(){
                var reg = /^[1-9][0-9]{0,5}$/;
                var quantity = $("#quantity").val();
                var message = $("#quantity_message");
                if(!reg.test(quantity)){
                    message.attr("style","color:red");
                    message.text("× 格式错误 请重新输入!");
                    quantity.focus();
                    return false;
                }else{
                    message.attr("style","color:#009688");
                    message.text("√ 输入正确 请继续输入");
                    return true;
                }
            }
            function checkAll(){
                var img = myform.img.value;
                var ext = img.substring(img.lastIndexOf(".")+1);
                if(ext.toLowerCase() == "jpg" || ext.toLowerCase() == "png"){
                    if(!checkBid() || !checkBname() || !checkAuthor() || !checkQuantity()){
                        alert("上传成功")
                        return true;
                    }else {
                        return false;
                    }
                }else{
                    alert("只能上传jpg、png图像!");
                    return false;
                }
            }
        </script>
    </body>
</html>
