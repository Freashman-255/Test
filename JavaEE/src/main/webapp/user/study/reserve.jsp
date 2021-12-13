<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/11
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+'/';
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>第一组校园生活系统</title>
        <base href="<%=basePath%>">
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
    function reserve_seat(seat_row,seat_col) {
        console.log(seat_row+";"+seat_col);
    }

        $(function () {
            $.ajax({
                url:"user/Study_init",
                dataType:"json",
                success:function (data) {
                    //console.log(data);
                    let table=document.getElementById("table");
                    for (let i=0;i<10;i++){
                        let tr=document.createElement('tr');
                        tr.className='col-md-10 col-md-offset-1';
                        for (let j=0;j<10;j++){
                            let element=data[i*10+j];
                            let btn=document.createElement('button');
                            let img=document.createElement('img');
                            if (element.seat_state==1){
                                img.src='images/seat/damageseat.jpg';
                            }else if (element.seat_state==2){
                                img.src='images/seat/booksseat.jpg';
                            }else{
                                img.src='images/seat/freeseat.jpg';
                                btn.onclick=function () {//只为本身就空闲的位置绑定单击事件
                                    //console.log(element.seat_row+";"+element.seat_col);
                                    //console.log(this.childNodes[0].src);
                                    if (this.childNodes[0].src=='http://localhost:8080/MyWeb/images/seat/freeseat.jpg'){
                                        this.childNodes[0].src='images/seat/booksseat.jpg';
                                        element.seat_state=2;

                                        //console.log(element)
                                    }else if(this.childNodes[0].src=='http://localhost:8080/MyWeb/images/seat/booksseat.jpg'){
                                        this.childNodes[0].src='images/seat/freeseat.jpg';
                                        element.seat_state=3;
                                        //console.log(element);
                                    }
                                    let row=element.seat_row;
                                    let col=element.seat_col;
                                    $.ajax({
                                        url:"user/changeSeatState",
                                        data:{"seat_row":row,"seat_col":col,"seat_state":element.seat_state},
                                        success:function (data) {
                                            alert(data);
                                            console.log(data);
                                        }
                                    })
                                }
                            }
                            img.width='50';
                            img.height='50';
                            //btn.click(reserve_seat(element.seat_row,element.seat_col));
                            //btn.onclick=reserve_seat(element.seat_row,element.seat_col);
                            /*let str=element.seat_row+","+element.seat_col;
                            btn.addEventListener("click",reserve_seat(element.seat_row,element.seat_col))*/
                            btn.appendChild(img);
                            let td=document.createElement('td');
                            td.appendChild(btn);
                            tr.appendChild(td);
                        }
                        table.appendChild(tr);
                    }
                }
            })
        })

</script>
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
            <div style="text-align: center"><h3>东区八楼自习室</h3></div>
        </div>
        <!------------------------------------------------座位说明-->
        <div class="row">
            <div class="col-md-1">
                <img src="images/seat/damageseat.jpg" width="50px" height="50px">
            </div>
            <div class="col-md-2">
                <font style="font-size:30px">损坏</font>&nbsp;
            </div>
            <div class="col-md-1">
                <font style="font-size:30px">|</font>
            </div>
            <div class="col-md-1">
                <img src="images/seat/booksseat.jpg" width="50px" height="50px">
            </div>
            <div class="col-md-2">
                <font style="font-size:30px">已被预定</font>&nbsp;
            </div>
            <div class="col-md-1">
                <font style="font-size:30px">|</font>
            </div>
            <div class="col-md-1">
                <img src="images/seat/freeseat.jpg" width="50px" height="50px">
            </div>
            <div class="col-md-2">
                <font style="font-size:30px">空闲</font>&nbsp;
            </div>
        </div>
        <hr class="layui-border-black">
        <!-------------------------------------------------------------------------座位表格-->
        <table class="layui-table" id="table">

        </table>

    </div>
</body>
</html>
