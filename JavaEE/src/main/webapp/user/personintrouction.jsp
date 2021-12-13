<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/9
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
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
    <div class="container">
        <div class="page-header row">
            <h1>第一组  <small><font color="black">&nbsp;校园生活系统</font> </small></h1>
        </div>
        <div class="row layui-icon">
            <ul class="layui-nav">
                <li class="layui-nav-item"><a href="user/index.jsp">首页</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">在校学习</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/study/reserve.jsp">自习室位置预定</a></dd>
                        <dd><a href="user/study/querybook.jsp">图书查询</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">食堂</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/canteen/OrderInAdvance.jsp">提前点餐</a></dd>
                        <dd><a href="user/canteen/feedback.jsp">反馈</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">校园超市</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/market_service/livinggoods.jsp">生活物品区</a></dd>
                        <dd><a href="user/market_service/snacks.jsp">零食区</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">宿舍服务</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/dorm_service/electricity.jsp">水电查询</a></dd>
                        <dd><a href="user/dorm_service/schoolcard.jsp">一卡通充值</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">校园服务</a>
                    <dl class="layui-nav-child">
                        <dd><a href="user/school_service/scholarship.jsp">奖学金申请</a></dd>
                    </dl>
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
        <form class="layui-form" action="" lay-filter="example">
            <div class="layui-inline">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">昵称</label>
                <div class="layui-input-block">
                    <input type="text" name="username" lay-verify="required" autocomplete="off" placeholder="请输入内容" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">生日</label>
                <div class="layui-input-block ">
                    <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" checked="">
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">血型</label>
                <div class="layui-input-block">
                    <input type="radio" name="blood" value="A" title="A" checked="">
                    <input type="radio" name="blood" value="B" title="B">
                    <input type="radio" name="blood" value="AB" title="AB" >
                    <input type="radio" name="blood" value="O" title="O">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">个性签名</label>
                <div class="layui-input-block">
                    <input type="text" name="" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label" style="color: darkred;font-weight: bold">个人简介</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="desc" lay-verify="required"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
