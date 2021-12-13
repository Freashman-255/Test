<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/12
  Time: 18:20
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
        function queryQuantity() {
            //先获取要查询的dno
            let dno=$("#dno").val();
            $.ajax({
                url:"user/queryQuantity",
                data:{"dno":dno},
                success:function (data) {
                    //获取显示余额的对象
                    if (data!='null')
                    {
                        $("#result").val(data);
                    }
                    else {
                        alert("你查询的宿舍号不存在");
                    }
                }
            })
        }
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

        <div class="layui-container">
            <div class="layui-icon">
                <h2 align="center">水&nbsp;电&nbsp;费&nbsp;&nbsp;&nbsp;&#xe629;</h2>
            </div>
            <div class="layui-row" style="margin-top: 30px;">
                <form class="layui-form" action="user/updateQuantity" method="get" lay-filter="example" style="font-size: large;">
                    <div class="layui-form-item">
                        <div class="layui-col-md2">&nbsp;</div>
                        <div class="layui-col-md1">
                            <label class="layui-form-label">宿舍:</label>
                        </div>
                        <div class="layui-input-block">
                            <div class="layui-col-md3">
                                <input type="text" class="layui-input" id="dno" name="dno" lay-verify="required" placeholder="请输入宿舍号" pattern="[0-9]{4}" oninvalid="setCustomValidity('请输入4位宿舍号')" oninput="setCustomValidity('')" >
                            </div>
                            &nbsp;&nbsp;&nbsp;
                            <div class="layui-col-md3 ">
                                <input type="text" class="layui-input" id="result" placeholder="此处显示查询结果">
                            </div>
                            &nbsp;&nbsp;&nbsp;
                            <div class="layui-col-md3 ">
                                <button type="button" class="layui-btn" lay-submit="" lay-filter="" onclick=queryQuantity()>查询水电费余额</button>
                            </div>
                        </div>
                    </div>

                    <br/>

                    <div class="layui-form-item">
                        <div class="layui-col-md2">
                            &nbsp;
                        </div>
                        <div class="layui-col-md1">
                            <label class="layui-form-label">金额:</label>
                        </div>
                        <div class="layui-input-block">
                            <div class="layui-icon" style="font-size: 25px;margin-top: 20px;">
                                <div class="layui-col-md3">
                                    <input type="radio" name="money" value="10">10&nbsp;&#xe65e;
                                    <br/><br/>
                                    <input type="radio" name="money" value="100" checked>100&nbsp;&#xe65e;
                                </div>
                                <div class="layui-col-md3">
                                    <input type="radio" name="money" value="20">20&nbsp;&#xe65e;
                                    <br/><br/>
                                    <input type="radio" name="money" value="200">200&nbsp;&#xe65e;
                                </div>
                                <div class="layui-col-md3">
                                    <input type="radio" name="money" value="50">50&nbsp;&#xe65e;
                                    <br/><br/>
                                    <input type="radio" name="money" value="500">500&nbsp;&#xe65e;
                                </div>
                            </div>
                        </div>
                    </div>

                    <br/>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <div class="layui-col-md3">
                                &nbsp;
                            </div>
                            <div class="layui-col-md2">
                                <button type="submit" class="layui-btn" lay-submit="" lay-filter="">充值</button>
                            </div>
                            <div class="layui-col-md2">
                                &nbsp;
                            </div>
                            <div class="layui-col-md2">
                                <button type="reset" class="layui-btn" lay-submit="" lay-filter="">重置</button>
                            </div>
                            <div class="layui-col-md3">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
