<%--
  Created by IntelliJ IDEA.
  User: 王润迎
  Date: 2021/9/12
  Time: 23:24
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
    <%--第一页的初始化函数--%>
    <script type="text/javascript">
        function btn_add(gname,price,img) {
            /*let label=$("#label").text();
            label++;
            $("#label").html(label);*/
            $.ajax({
                url:"user/insertBuyGoodsListService",
                data:{"gname":gname,"price":price,"img_src":img},
                success:function (data) {
                    //console.log(data);
                }
            })
        }
        //初始化函数
        $(function () {
            $.ajax({
                url:"user/goods_init",
                dataType:"json",
                data: {"type":"2"},
                success:function (response) {
                    //console.log(response.count+""+response.data[0].food_name);
                    $("#current_page").val(1);
                    $("#page_count").val(response.count);
                    let div=$("#div");
                    let table=document.createElement("table");
                    table.className="table";
                    let tr=document.createElement("tr");
                    tr.innerHTML+="<th>"+"名称"+"</th>"+
                        "<th>"+"参考图片"+"</th>"+
                        "<th>"+"价格"+"</th>"+
                        "<th>"+"操作"+ "</th>"+
                        "<th>"+"余量"+"</th>";
                    table.appendChild(tr);
                    table.appendChild(document.createElement("br"));
                    $.each(response.data,function (index,element) {
                        let tr=document.createElement("tr");
                        tr.innerHTML+="<td>"+element.gname+"</td>"+
                            "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                            "<td>"+element.price+"</td>"+
                            "<td>"+"<button class='btn-primary form-control' onclick=\"btn_add(\'"+element.gname+"\',\'"+element.price+"\',\'"+element.img+"\')\" style='width: 120px;height:40px'>"+"添加到购物车"+"</button>"+"&nbsp;"+
                            "</td>"+
                            "<td>"+element.quantity+"</td>";
                        table.appendChild(tr);
                        let br=document.createElement("br");
                        table.appendChild(br);
                    })
                    div.append(table);
                }
            })
        })
    </script>
    <%--为下一页按钮绑定单击事件--%>
    <script type="text/javascript">
        $(function () {
            let next_page=$("#next_page")[0];
            next_page.onclick=function () {
                let cur_page=$("#current_page").val();
                let page_count=$("#page_count").val();
                if (cur_page!=page_count){
                    $.ajax({
                        url: "user/selectGoodsPage",
                        data:{"page":cur_page*4,"type":"2"},
                        dataType:"json",
                        success:function (data) {
                            //console.log(data);
                            //清除掉上一页的数据以便这一页的数据展示
                            let div=$("#div");
                            div.empty();
                            //设置表头
                            let table=document.createElement("table");
                            table.className="table ";
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<th>"+"名称"+"</th>"+
                                "<th>"+"参考图片"+"</th>"+
                                "<th>"+"价格"+"</th>"+
                                "<th>"+"操作"+"</th>"+
                                "<th>"+"余量"+"</th>"
                            table.appendChild(tr);
                            let br=document.createElement("br");
                            table.appendChild(br);

                            $.each(data,function (index,element) {
                                let tr=document.createElement("tr");
                                tr.innerHTML+="<td>"+element.gname+"</td>"+
                                    "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                    "<td>"+element.price+"</td>"+
                                    "<td>"+"<button class='btn-primary form-control' onclick=\"btn_add(\'"+element.gname+"\',\'"+element.price+"\',\'"+element.img+"\')\" style='width: 120px;height:40px'>"+"添加到购物车"+"</button>"+"&nbsp;"+
                                    "</td>"+
                                    "<td>"+element.quantity+"</td>";
                                table.appendChild(tr);
                                let br=document.createElement("br");
                                table.appendChild(br);
                            })
                            div.append(table);
                        }

                    })
                    cur_page++;
                    $("#current_page").val(cur_page);
                }else {
                    alert("这已经是最后一页了");
                }
            }
        })
    </script>
    <%--为上一页按钮绑定单击事件--%>
    <script type="text/javascript">
        $(function () {
            let pre_page=$("#previous_page")[0];
            pre_page.onclick=function () {
                let cur_page=$("#current_page").val();
                if (cur_page!=1){
                    cur_page=cur_page-2;
                    $.ajax({
                        url: "user/selectGoodsPage",
                        data:{"page":cur_page*4,"type":"2"},
                        dataType:"json",
                        success:function (data) {
                            //console.log(data);
                            //清除掉上一页的数据以便这一页的数据展示
                            let div=$("#div");
                            div.empty();
                            //设置表头
                            let table=document.createElement("table");
                            table.className="table ";
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<th>"+"名称"+"</th>"+
                                "<th>"+"参考图片"+"</th>"+
                                "<th>"+"价格"+"</th>"+
                                "<th>"+"操作"+"</th>"+
                                "<th>"+"余量"+"</th>"
                            table.appendChild(tr);
                            let br=document.createElement("br");
                            table.appendChild(br);

                            $.each(data,function (index,element) {
                                let tr=document.createElement("tr");
                                tr.innerHTML+="<td>"+element.gname+"</td>"+
                                    "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                    "<td>"+element.price+"</td>"+
                                    "<td>"+"<button class='btn-primary form-control' onclick=\"btn_add(\'"+element.gname+"\',\'"+element.price+"\',\'"+element.img+"\')\" style='width: 120px;height:40px'>"+"添加到购物车"+"</button>"+"&nbsp;"+
                                    "</td>"+
                                    "<td>"+element.quantity+"</td>";
                                table.appendChild(tr);
                                let br=document.createElement("br");
                                table.appendChild(br);
                            })
                            div.append(table);
                        }

                    })
                    cur_page++;
                    $("#current_page").val(cur_page);
                }else {
                    alert("这已经是第一页了");
                }
            }
        })
    </script>
    <%--为跳转按钮设置单击事件--%>
    <script type="text/javascript">
        $(function () {
            let jump_btn=$("#jump_btn")[0];
            jump_btn.onclick=function () {
                let jump_page=$("#page_jump").val();
                let count_page=$("#page_count").val();
                if (jump_page>0 && jump_page<=count_page){
                    jump_page=jump_page-1;
                    $.ajax({
                        url: "user/selectGoodsPage",
                        data:{"page":jump_page*4,"type":"2"},
                        dataType:"json",
                        success:function (data) {
                            //console.log(data);
                            //清除掉上一页的数据以便这一页的数据展示
                            let div=$("#div");
                            div.empty();
                            //设置表头
                            let table=document.createElement("table");
                            table.className="table ";
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<th>"+"名称"+"</th>"+
                                "<th>"+"参考图片"+"</th>"+
                                "<th>"+"价格"+"</th>"+
                                "<th>"+"操作"+"</th>"+
                                "<th>"+"余量"+"</th>"
                            table.appendChild(tr);
                            let br=document.createElement("br");
                            table.appendChild(br);

                            $.each(data,function (index,element) {
                                let tr=document.createElement("tr");
                                tr.innerHTML+="<td>"+element.gname+"</td>"+
                                    "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                    "<td>"+element.price+"</td>"+
                                    "<td>"+"<button class='btn-primary form-control' onclick=\"btn_add(\'"+element.gname+"\',\'"+element.price+"\',\'"+element.img+"\')\" style='width: 120px;height:40px'>"+"添加到购物车"+"</button>"+"&nbsp;"+
                                    "</td>"+
                                    "<td>"+element.quantity+"</td>";
                                table.appendChild(tr);
                                let br=document.createElement("br");
                                table.appendChild(br);
                            })
                            div.append(table);
                        }

                    })
                    jump_page++;
                    $("#current_page").val(jump_page);
                }else {
                    alert("页码输入错误");
                }
            }
        })
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
        <div id="parent_div">
            <div id="div">

            </div>
        </div>
        <div class="row">
            <form class="form-inline">
                <div class="form-group">
                    <input  type="button" class="btn btn-primary" id="previous_page" value="上一页"/>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <label >当前页号为</label>
                    <input type="text" class="form-control" id="current_page" >
                </div>
                &nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <label >跳转页号</label>
                    <input type="text" class="form-control" id="page_jump" placeholder="在这里输入页号">
                </div>
                <input type="button" class="btn btn-default" id="jump_btn" value="跳转"></input>
                &nbsp;&nbsp;&nbsp;

                <div class="form-group" >
                    <label>总页数为</label>
                    <input type="text" class="form-control" id="page_count">
                </div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <input type="button" class="btn btn-danger" id="next_page" value="下一页"/>
                </div>
            </form>
            <div class="col-md-4 col-md-offset-10">
                <a class="btn btn-default" href="user/market_service/shoppingcart.jsp" ><img src="images/shopping_cart.png" height="50px" width="50px" >
                    <label>我的购物车</label><%--<label style="color: red" id="label">0</label>--%>
                </a>
            </div>
        </div>

    </div>
    </body>
</html>