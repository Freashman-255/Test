<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/12/1
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    System.out.println(basePath);
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
<%--删除按钮的事件处理和初始化函数--%>
<script type="text/javascript">
    function btn_delete(id,food_name) {
        /*
        console.log(document.getElementById("div").children[0].childElementCount);遍历的终止条件
        console.log(document.getElementById("div").children[0].childNodes[2]);tr
        console.log(document.getElementById("div").children[0].childNodes[2].childNodes[0].childNodes[0].nodeValue);id的值
        */

        $.ajax({
            url: "user/deleteBuyListByFoodId",
            data:{"food_name":food_name},
            success:function (response) {
                if (response==1){
                    alert("删除成功");
                    let stop=document.getElementById("div").children[0].childElementCount;
                    for (let i=2;i<stop;i=i+2){
                        let table=document.getElementById("div").children[0];
                        let tr=document.getElementById("div").children[0].childNodes[2];
                        let btn_id=document.getElementById("div").children[0].childNodes[i].childNodes[0].childNodes[0].nodeValue;
                        let br=document.getElementById("div").children[0].childNodes[3];
                        if (btn_id==id){
                            table.removeChild(tr);
                            table.removeChild(br);
                            break;
                        }
                    }
                }else {
                    alert("删除失败");
                }
            }
        })
    }
    //初始化函数
    $(function () {
        $.ajax({
            url:"user/queryBuyListByName",
            dataType:"json",
            success:function (response) {
                let div=$("#div");
                let table=document.createElement("table");
                table.className="table";
                let tr=document.createElement("tr");
                tr.innerHTML+="<th>"+"编号"+"</th>"+
                    "<th>"+"菜名"+"</th>"+
                    "<th>"+"参考图片"+"</th>"+
                    "<th>"+"价格"+"</th>"+
                    "<th>"+"操作"+ "</th>";
                table.appendChild(tr);
                table.appendChild(document.createElement("br"));
                let id;
                $.each(response,function (index,element) {
                    id=++index;
                    let tr=document.createElement("tr");
                    tr.innerHTML+="<td>"+id+"</td>"+
                        "<td>"+element.food_name+"</td>"+
                        "<td>"+"<img src="+element.img_src+" width=120px height=80px"+"/>"+"</td>"+
                        "<td>"+element.price+"</td>"+
                        "<td>"+"<button class='btn-danger form-control' onclick=\"btn_delete(\'"+id+"\',\'"+element.food_name+"\')\" style='width: 120px;height:40px'>"+"从购物车删除"+"</button>"+"&nbsp;"+
                        "</td>";
                    table.appendChild(tr);
                    let br=document.createElement("br");
                    table.appendChild(br);
                })
                div.append(table);
            }
        })
    })
</script>
<%--为付款按钮绑定单击事件--%>
<script type="text/javascript">
    $(function () {
        let btn=$("#btn")[0];
        btn.onclick=function () {
            $.ajax({
                url:"user/Pay",
                dataType: "json",
                success:function (data) {
                    if (data.deleteList>0){
                        alert("操作成功，你需要付款"+data.payCount+"元");
                    }else {
                        alert("操作失败");
                    }
                }
            })
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
    <div class="row">
        <h2 style="text-align: center">我的购物车</h2>
    </div>
    <div id="div">

    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-5">
            <button class="btn btn-block" id="btn">付款</button>
        </div>
    </div>
</div>
</body>
</html>
