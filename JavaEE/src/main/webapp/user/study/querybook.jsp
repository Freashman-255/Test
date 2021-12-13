<%--
  Created by IntelliJ IDEA.
  User: 15639
  Date: 2021/9/12
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
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

<%--第一页的初始化--%>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"user/firstPageInit",
            dataType:"json",
            success:function (data) {
                //console.log(data.book_count);
                //console.log(data.book_info[0]);
                //设置当前页号为1
                $("#current_page").val(1);
                //设置总页数
                $("#page_count").val(data.book_count);
                let table=document.createElement("table");
                table.className="table table-striped";
                let tr=document.createElement("tr");
                tr.innerHTML+="<th>"+"图书编号"+"</th>"+
                    "<th>"+"书名"+"</th>"+
                    "<th>"+"参考图片"+"</th>"+
                    "<th>"+"作者"+"</th>"+
                    "<th>"+"剩余书籍(本)"+"</th>"
                table.appendChild(tr);
                let br=document.createElement("br");
                table.appendChild(br);
                //初始化表格
                $.each(data.book_info,function (index,element) {
                    let tr=document.createElement("tr");
                    tr.innerHTML+="<td>"+element.bid+"</td>"+
                                     "<td>"+element.bname+"</td>"+
                                    "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                    "<td>"+element.author+"</td>"+
                                    "<td>"+element.quantity+"</td>"
                    table.appendChild(tr);
                    let br=document.createElement("br");
                    table.appendChild(br);
                })
                let div=$("#div")[0];
                div.appendChild(table);
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
                    url: "user/PageService",
                    data:{"cur_page":cur_page*4},
                    dataType:"json",
                    success:function (data) {
                        //清除掉上一页的数据以便这一页的数据展示
                        let div=$("#div");
                        div.empty();
                        //设置表头
                        let table=document.createElement("table");
                        table.className="table table-striped";
                        let tr=document.createElement("tr");
                        tr.innerHTML+="<th>"+"图书编号"+"</th>"+
                            "<th>"+"书名"+"</th>"+
                            "<th>"+"参考图片"+"</th>"+
                            "<th>"+"作者"+"</th>"+
                            "<th>"+"剩余书籍(本)"+"</th>"
                        table.appendChild(tr);
                        let br=document.createElement("br");
                        table.appendChild(br);

                        $.each(data,function (index,element) {
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<td>"+element.bid+"</td>"+
                                "<td>"+element.bname+"</td>"+
                                "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                "<td>"+element.author+"</td>"+
                                "<td>"+element.quantity+"</td>"
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
                    url: "user/PageService",
                    data:{"cur_page":cur_page*4},
                    dataType:"json",
                    success:function (data) {
                        //清除掉上一页的数据以便这一页的数据展示
                        let div=$("#div");
                        div.empty();
                        //设置表头
                        let table=document.createElement("table");
                        table.className="table table-striped";
                        let tr=document.createElement("tr");
                        tr.innerHTML+="<th>"+"图书编号"+"</th>"+
                            "<th>"+"书名"+"</th>"+
                            "<th>"+"参考图片"+"</th>"+
                            "<th>"+"作者"+"</th>"+
                            "<th>"+"剩余书籍(本)"+"</th>"
                        table.appendChild(tr);
                        let br=document.createElement("br");
                        table.appendChild(br);

                        $.each(data,function (index,element) {
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<td>"+element.bid+"</td>"+
                                "<td>"+element.bname+"</td>"+
                                "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                "<td>"+element.author+"</td>"+
                                "<td>"+element.quantity+"</td>"
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
                alert("这已经是第一一页了");
            }
        }
    })
</script>
<%--为跳转按钮设置单击事件--%>
<script type="text/javascript">
    $(function () {
        let jump_btn=$("#jump_btn")[0];

        jump_btn.onclick=function () {
            //获取需要跳转的页号
            let jump_page=$("#page_jump").val();
            let count_page=$("#page_count").val();
            if (jump_page>0 && jump_page<count_page+1){
                jump_page=jump_page-1;
                //console.log(jump_page);
                $.ajax({
                    url: "user/PageService",
                    data:{"cur_page":jump_page*4},
                    dataType:"json",
                    success:function (data) {
                        //清除掉上一页的数据以便这一页的数据展示
                        let div=$("#div");
                        div.empty();
                        //设置表头
                        let table=document.createElement("table");
                        table.className="table table-striped";
                        let tr=document.createElement("tr");
                        tr.innerHTML+="<th>"+"图书编号"+"</th>"+
                            "<th>"+"书名"+"</th>"+
                            "<th>"+"参考图片"+"</th>"+
                            "<th>"+"作者"+"</th>"+
                            "<th>"+"剩余书籍(本)"+"</th>"
                        table.appendChild(tr);
                        let br=document.createElement("br");
                        table.appendChild(br);

                        $.each(data,function (index,element) {
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<td>"+element.bid+"</td>"+
                                "<td>"+element.bname+"</td>"+
                                "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                "<td>"+element.author+"</td>"+
                                "<td>"+element.quantity+"</td>"
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
                alert("输入的页码错误");
            }
        }
    })
</script>

<%--为查询按钮绑定事件--%>
<script type="text/javascript">
    $(function () {
        let query_btn=$("#query_btn")[0];

        query_btn.onclick=function () {
            //获取作者名和书名
            let bname=$("#bname").val();
            let author=$("#author").val();
            if (bname!='' || author!=''){
                $.ajax({
                    url: "user/fuzzyQueryService",
                    data:{"bname":bname,"author":author},
                    dataType:"json",
                    success:function (data) {
                        if (data[0]==undefined){
                            let parenDiv=$("#parent_div")[0];
                            parenDiv.innerHTML="<h1 style='text-align: center'>"+"没有搜索到数据"+"</h1>";
                        }else {
                            //清除掉上一页的数据以便这一页的数据展示
                            let parentDiv=$("#parent_div");
                            parentDiv.empty();
                            //设置表头
                            let table=document.createElement("table");
                            table.className="table table-striped";
                            let tr=document.createElement("tr");
                            tr.innerHTML+="<th>"+"图书编号"+"</th>"+
                                "<th>"+"书名"+"</th>"+
                                "<th>"+"参考图片"+"</th>"+
                                "<th>"+"作者"+"</th>"+
                                "<th>"+"剩余书籍(本)"+"</th>"
                            table.appendChild(tr);
                            let br=document.createElement("br");
                            table.appendChild(br);

                            $.each(data,function (index,element) {
                                let tr=document.createElement("tr");
                                tr.innerHTML+="<td>"+element.bid+"</td>"+
                                    "<td>"+element.bname+"</td>"+
                                    "<td>"+"<img src="+element.img+" width=120px height=80px"+"/>"+"</td>"+
                                    "<td>"+element.author+"</td>"+
                                    "<td>"+element.quantity+"</td>"
                                table.appendChild(tr);
                                let br=document.createElement("br");
                                table.appendChild(br);
                            })
                            parentDiv.append(table);
                        }
                    }

                })
            }else {
                alert("必须输入一个查询条件");
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
    <form class="form-inline">
        <div class="form-group">
            <label>书名：</label>
            <input type="text" class="form-control" id="bname"  placeholder="例如平凡世界">
        </div>
        <div class="form-group">
            <label>作者：</label>
            <input type="text" class="form-control" id="author"  placeholder="例如路遥">
        </div>
        <input type="button" class="btn btn-info" value="查询" id="query_btn">
        <div class="form-group">
            <label id="label"></label>
        </div>
    </form>
    <div id="parent_div">
        <div id="div">

        </div>

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
    </div>
</div>
</body>
</html>
