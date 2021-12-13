<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/7
  Time: 18:48
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
<body >
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
        <div class="row">
            <div class="layui-carousel " id="test1" lay-filter="test1">
                <div carousel-item="">
                    <div><img src="images/lunbo/lunbo1.jpg" width="1170px" height="600px" ></div>
                    <div><img src="images/lunbo/lunbo2.jpg" width="1170px" height="600px"></div>
                    <div><img src="images/lunbo/lunbo3.jpg" width="1170px" height="600px"></div>
                    <div><img src="images/lunbo/lunbo4.jpg" width="1170px" height="600px"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="layui-col-xs3">
                <h3 style="color: black ">历史</h3>

                <hr class="layui-border-black">
                <h4><a href="#">关于认真学习贯彻习近平总书记在庆祝中...</a></h4>
                <p>号召。习近平总书记在庆祝中国共产党成立100周年大会上的重要讲话，贯通历史、现实、未来，贯通伟大斗争、伟大工程、伟大事业、伟大梦想，高屋建瓴、思想深邃、内涵丰富，把我们党对共产党执政规律、社会主义建设规律、人类社会发展规律的认识提升到了新高度，为奋进新时代、走好新征程进一步指明了前进方向、提供了根本遵循。 要深入领会全面建成小康社会的历史性成就，从历史与现实、理论与实践、国际与国内的比较中，深刻认...</p>
                <p>发表时间:2021年07月08日</p>
                <h4><a href="#">
                    关于举行“庆祝中国共产党成立100周年”...</a></h4>
                <p>
                    校内各党委、党总支、直属党支部，各部门、各单位： 为庆祝中国共产党成立100周年，深情回顾党的奋斗历史，热情讴歌党的丰功伟绩，继承和发扬党的光荣传统和优良作风，赓续党的精神血脉，牢记党的初心使命，坚定理想信念，坚定奋斗意志，汲取奋进力量，激发使命担当。学校拟举行“庆祝中国共产党成立100周年”主题党日活动，现将具体事宜通知如下。 一、活动时间 2021年7月1日上午7:00 二、活动地点 长安
                </p>
                <p>  发表时间:2021年06月29日</p>
                <h4 style="color: black;"><a href="#"style="color: black">...... </a></h4>
            </div>

            <div class="layui-col-xs-offset1 layui-col-xs3">
                <h3 style="color: black ">综合新闻</h3>

                <hr class="layui-border-black">
                <h4><a href="#"style="color: black">学校举办民族工作主题报告会</a> </h4>
                <h4><a href="#"style="color: black">网络空间安全学院举办2021新生开学典礼</a> </h4>
                <h4><a href="#"style="color: black">现代邮政学院举办2021级新生教育大会</a> </h4>
                <h4><a href="#"style="color: black">西安外国语学院处到我校调研本科教学工作</a> </h4>
                <h4><a href="#"style="color: black">陕西学前师范学校来校调研党建进学生公寓工作</a> </h4>
                <h4><a href="#"style="color: black">马克思主义学院举行2021级硕士研究生与导师见面会</a> </h4>
                <h4><a href="#"style="color: black">【创建文明校园专栏】学工部打造学生学生公寓文化墙</a> </h4>
                <h4><a href="#"style="color: black">经济与管理学院举办专创融合教学工作坊活动</a> </h4>
                <h4><a href="#"style="color: black">【党史学习教育专栏】机关党委理论学习中心组组织集体学习</a> </h4>
                <h4><a href="#"style="color: black">学校举办防范电信诈骗培训会</a> </h4>
                <h4><a href="#"style="color: black">学校围绕“三个聚焦”打造智慧迎新工作新亮点</a> </h4>
                <h4><a href="#"style="color: black">永远跟党走 奋进新时代——我校2021年暑期大学生社会实践活动风采展示</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">...... </a></h4>
            </div>

            <div class="layui-col-xs-offset1 layui-col-xs3">
                <h3>媒体关注</h3>
                <hr class="layui-border-black">
                <h4 style="color: black"><a href="#" style="color: black">【学习强国】行业精英授课，聚焦发展前...</a> </h4>
                <h4 style="color: black;"><a href="#" style="color: black">【群众新闻网】西安邮电大学入学专业教...</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">【中国教育在线】行业精英授课，聚焦发...</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">【西部网】行业精英授课 聚焦发展前沿 ...</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">【陕西省教育厅】西安邮电大学“四个坚...</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">【陕西省教育厅】开学啦 陕西教育系统做...</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black">【陕西电视台】谨慎下载 15款APP涉嫌超范围采集个人隐私</a> </h4>
                <h4 style="color: black;"><a href="#"style="color: black"></a>【西部网】专家谈丨张鸿：数字化驱动农业高质量发展 </h4>
                <h4 style="color: black;"><a href="#"style="color: black"></a>【人民网】保持一往无前的奋斗姿态 永不懈怠</h4>
                <h4 style="color: black;"><a href="#"style="color: black"></a>【西部网】西安邮电大学教师刘琳获首届全国高校教师教学创新大赛三等奖</h4>
                <h4 style="color: black;"><a href="#"style="color: black"></a>【中国社会科学网】铭记百年奋斗路 开启交运新征程 </h4>
                <h4 style="color: black;"><a href="#"style="color: black">...... </a></h4>
            </div>
        </div>
        <hr class="layui-border-black">
        <div class="row">
            <div class="col-md-4">
                <h3>雁塔校区</h3>
                <p>电话：029-85383106</p>
                <p>邮政编码：710061</p>
                <p>雁塔校区地址：西安市长安南路563号</p>
            </div>
            <div class="col-md-4">
                <img src="images/xiyoupt.jpg">
            </div>
            <div class="col-md-4">
                <h3>长安校区</h3>
                <p>电话：029-88166105</p>
                <p>邮政编码：710121</p>
                <p>雁塔校区地址：西安市长安区长安街618号</p>
            </div>
        </div>
    </div>
    <script>
        layui.use(['carousel', 'form'], function(){
            var carousel = layui.carousel
                ,form = layui.form;

            //常规轮播
            carousel.render({
                elem: '#test1'
                ,arrow: 'always'
                ,height:'600px'
                ,width: '1170px'
            });


            var $ = layui.$, active = {
                set: function(othis){
                    var THIS = 'layui-bg-normal'
                        ,key = othis.data('key')
                        ,options = {};

                    othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                    options[key] = othis.data('value');
                    ins3.reload(options);
                }
            };

            //监听开关
            form.on('switch(autoplay)', function(){
                ins3.reload({
                    autoplay: this.checked
                });
            });

            $('.demoSet').on('keyup', function(){
                var value = this.value
                    ,options = {};
                if(!/^\d+$/.test(value)) return;

                options[this.name] = value;
                ins3.reload(options);
            });

            //其它示例
            $('.demoTest .layui-btn').on('click', function(){
                var othis = $(this), type = othis.data('type');
                active[type] ? active[type].call(this, othis) : '';
            });
        });
    </script>
</body>
</html>
