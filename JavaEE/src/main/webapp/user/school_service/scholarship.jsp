<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/9
  Time: 19:21
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

<script>

</script>
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
    </div>

    <!--加载模块-->
    <!--
     <script type="text/javascript">
        //加载form模块
        layui.use("form",function (){
            var form = layui.form;
        })
    </script>
    --><%--
    <script type="text/javascript">
        //加载form模块
        layui.use("form",function (){
            var form = layui.form;
        })
    </script>--%>

    <div class="layui-container">
        <h2 align="center">奖学金申请</h2>
        <form class="layui-form" action="user/insertScholarShip" method="get" lay-filter="example">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="name" name="username" lay-verify="required"  placeholder="请输入姓名"
                           pattern="[\u4e00-\u9fa5]{2,20}" oninvalid="setCustomValidity('请输入正确的中文名字')" oninput="setCustomValidity('')">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="sno" name="sno" lay-verify="required" placeholder="请输入学号"
                           pattern="0[0-9]{7}" oninvalid="setCustomValidity('请输入以0开头的8位学号')" oninput="setCustomValidity('')">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" checked>
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">奖学金等级</label>
                <div class="layui-input-block">
                    <select name="level" lay-filter="required">
                        <!--
                        <option value="">请选择对应的奖学金等级</option>
                        -->
                        <option value="国家励志奖学金" >国家励志奖学金</option>
                        <option value="一等奖学金" >一等奖学金</option>
                        <option value="二等奖学金" >二等奖学金</option>
                        <option value="三等奖学金" >三等奖学金</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">申请理由</label>
                <div class="layui-input-block">
                    <textarea  name="reason" lay-verify="required" placeholder="请输入申请理由" class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="">立即提交</button>
                    <button type="reset" class="layui-btn" lay-btn-primary>重置</button>
                </div>
            </div>
        </form>
    </div>


</body>
</html>
