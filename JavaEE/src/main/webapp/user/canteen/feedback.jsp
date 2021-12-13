<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/14
  Time: 20:10
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
<!--
<script type="text/javascript">
    window.onload=function (){
        var disadvantext=document.getElementById('disadvantext');
        var advantext=document.getElementById('advantext');
        var btn=document.getElementById('btn');
        btn.onclick=function () {
            var reg=/([\u4e00-\u9fa5]\\p{P}){0,1000}/;
            if (reg.test(disadvantext.value) && reg.test(advantext)){
                alert("格式错误");
            }
        }
    }
</script>
-->

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
    <h3 style="text-align: center">学生反馈</h3>
    <form class="layui-form" method="get" action="user/feedback">
        <div class="row">
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 100px;">食堂的优点</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="ad" placeholder="文字内容不得为空"  lay-verify="required"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 100px;">食堂的缺点</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="disad" placeholder="文字内容不得为空"  lay-verify="required"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="width: 100px;text-align: center;">建议</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="advice" placeholder="文字内容不得为空"  lay-verify="required"></textarea>
                </div>
            </div>
            <div class=" col-md-2 col-md-offset-5">
                <div class="layui-form-item">
                    <input  type="submit" class="layui-btn" id="btn" value="提交" lay-filter="" lay-submit="">
                </div>
            </div>
        </div>
    </form>

</div>
</body>
</html>
