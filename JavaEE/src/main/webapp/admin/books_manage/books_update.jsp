<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/12/4
  Time: 18:53
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
            $.post("",{})
        })
    </script>
</head>
<body>
    <div class="layui-row">
        <div class="layui-col-md-offset4 layui-col-md5" style="margin-top: 50px;">
            <h3 align="center">修改商品信息</h3><br/><br>
            <form name="myform" class="layui-form" method="post" action="admin/books_update" lay-filter="example" style="margin-left: 25px;">
                <div class="layui-inline ">
                    <label class="layui-form-label">图书编号</label>
                    <div class="layui-input-block" style="margin-top: 15px;">
                        <input type="hidden" name="bid" value="${requestScope.book.bid}">${requestScope.book.bid}
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">书籍名称</label>
                    <div class="layui-input-block ">
                        <input type="text" name="bname" value="${requestScope.book.bname}" class="layui-input" lay-verify="required"
                               pattern=".{2,15}" oninvalid="setCustomValidity('请输入2-15位')" oninput="setCustomValidity('')">
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">作者</label>
                    <div class="layui-input-block">
                        <input type="text" name="author" value="${requestScope.book.author}"  class="layui-input" lay-verify="required"
                               pattern=".{2,20}" oninvalid="setCustomValidity('请输入2-15位')" oninput="setCustomValidity('')">
                        <p id="old_message"></p>
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">书籍总个数</label>
                    <div class="layui-input-block">
                        <input type="text" name="quantity" value="${requestScope.book.quantity}" class="layui-input" lay-verify="required"
                               pattern="[1-9][0-9]{0,5}" oninvalid="setCustomValidity('请输入1-999999之内的书籍总个数')" oninput="setCustomValidity('')">
                        <p id="new_message"></p>
                    </div>
                </div>
                <br/><br/>
                <div class="layui-inline">
                    <label class="layui-form-label">已借数</label>
                    <div class="layui-input-block">
                        <input type="text" name="borrow" value="${requestScope.book.borrow}" class="layui-input" lay-verify="required"
                               pattern="[1-9][0-9]{0,5}" oninvalid="setCustomValidity('请输入1-999999之内的已借数')" oninput="setCustomValidity('')">
                    </div>
                </div>
                <br/><br/>
                <div class="layui-form-item">
                    <div class="layui-input-inline" style="margin-left: 150px;">
                        <button type="submit" class="layui-btn">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
