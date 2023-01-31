<%@ page import="pojo.User" %>
<%@ page import="pojo.Order" %>
<%@ page import="db.ContactDB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
<%--导航条--%>
    <link rel="stylesheet" href="css/daohangtiao.css">
    <link rel="stylesheet" href="css/personal.css">
<%--个人中心--%>
    <style type="text/css">
        /*选项卡1*/
        #lib_Tab1_sx {
            width: 500px;
            margin-left: 50px;
            padding: 0px;
            margin-bottom: 15px;
            overflow: hidden;
        }

        /*菜单class*/
        .lib_tabborder_sx {
            /*border: 1px solid #95C9E1;*/
            border: 1px solid yellowgreen;
            margin-left: 200px;
        }

        .lib_Menubox_sx {
            line-height: 28px;
            position: relative;
            float: left;
            width: 130px;
            height: 240px;
            border-right: 1px solid yellowgreen;
        }

        .lib_Menubox_sx ul {
            margin: 0px;
            padding: 0px;
            list-style: none;
            position: absolute;
            top: 15px;
            left: 5px;
            margin-left: 10px;
            height: 25px;
            text-align: center;
        }

        .lib_Menubox_sx li {
            display: block;
            cursor: pointer;
            width: 114px;
            color: #949694;
            font-weight: bold;
            margin-bottom: 5px;
            height: 25px;
            line-height: 25px;
            background-color: yellowgreen;
        }

        .lib_Menubox_sx li.hover {
            padding: 0px;
            background: #fff;
            width: 116px;
            border: 1px solid yellowgreen;
            border-right: 0;
            color: #2b542c;
            height: 35px;
            line-height: 35px;
        }

        .lib_Contentbox_sx {
            margin-top: 0px;
            border-top: none;
            padding: 20px;
            border-left: 0;
            margin-left: 130px;
        }
        -->
    </style>
    <script>
        <!--
        function setTab(name,cursel,n){
            for(i=1;i<=n;i++){
                var menu=document.getElementById(name+i);
                var con=document.getElementById("con_"+name+"_"+i);
                menu.className=i==cursel?"hover":"";
                con.style.display=i==cursel?"block":"none";
            }
        }
        //-->
    </script>
</head>
<body>
<%--获取user对象，打印出个人信息--%>
    <%
        User u = (User)session.getAttribute("user");
        Order o = (Order)session.getAttribute("od");
        System.out.println(o);
    %>
    <%--导航条--%>
    <div id="nav-1">
        <ul class="nav">
            <li class="slide1"></li>
            <li class="slide2"></li>
            <li><a  href="index.jsp">网站首页</a></li>
            <li><a href="menu.jsp">菜单页面</a></li>
            <li><a href="shopCar.jsp">购物车</a></li>
            <li><a href="activity.jsp">活动页面</a></li>
            <li><a href="contact.jsp">联系我们</a></li>
            <li><a class="active" href="AdminOrderServlet">个人中心</a></li>
            <li>
                <img src="images/head.png" style="height: 17px;width: 22px;margin-top: 9px;margin-left: 13px;">
                <div style="margin-left: 60px;margin-top: -18px;font-size: 14px;">用户：<%=session.getAttribute("username")%></div>
                <input type="button" value="退出登录" onclick="window.location.href='index.jsp'" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;margin-left: 180px;margin-top:-19px;width: 95px;text-align: center;height: 25px;">
            </li>
        </ul>
    </div></br>
<%--    个人中心--%>
    <div id="lib_Tab1_sx" class="lib_tabborder_sx">
        <div class="lib_Menubox_sx ">
            <ul>
                <li id="one1" onclick="setTab('one',1,5)" class="hover">个人信息</li>
                <li id="one2" onclick="setTab('one',2,5)">修改信息</li>
                <li id="one3" onclick="setTab('one',3,5)">历史订单</li>
                <li id="one4" onclick="setTab('one',4,5)">查看反馈</li>
            </ul>
        </div>
        <div class="lib_Contentbox_sx">
            <div id="con_one_1">
                <label class="lab">用户名:&nbsp;&nbsp;<%=u.getUsername()%></label></br>
                <label class="lab">电&nbsp;&nbsp;&nbsp;话：<%=u.getPhone()%></label></br>
                <label class="lab">邮&nbsp;&nbsp;&nbsp箱：<%=u.getMail()%></label></br>
                <label class="lab">地&nbsp;&nbsp;&nbsp;址：<%=u.getAddress()%></label></br>
            </div>
            <div id="con_one_2" style="display: none"></br>
                <form action="changePwdServlet">
                    <label>请输入原密码：</label>
                    <input type="text" name="origin"/></br></br>
                    <label>请输入新密码：</label>
                    <input type="text" name="new"/></br></br>
                    <input type="submit" value="确 认" onclick="changePwdServlet" style="margin-left: 200px;border-radius: 3px;border-color: yellowgreen;background-color: transparent;">
                </form>
            </div>
            <div id="con_one_3" style="display: none">
                <label class="lab">订单号:&nbsp;&nbsp;<%=o.getOrderId()%></label></br>
                <label class="lab">订单用户:&nbsp;&nbsp;<%=o.getUserId()%></label></br>
                <label class="lab">下单时间:&nbsp;&nbsp;<%=o.getOrderTime()%></label></br>
                <label class="lab">订单总价:&nbsp;&nbsp;<%=o.getTotalPrice()%></label></br>

            </div>
            <div id="con_one_4" style="display: none"></br>
                <label>
                    <%=session.getAttribute("cdb")%>
                </label>
            </div>
        </div>
    </div>
<%--    轮播图--%>
<div class="pic-scroll">
    <div class="lunbo01" style="margin-left:550px;width: 600px;height: 180px;margin-top: -240px;">
        <div class="banner-main-img01" style="margin-left: 50px;width: 650px;height: 180px;">
            <ul>
                <li style="display: block;"><a href="#"><img src="images/image1.png" style="width: 700px;height: 180px;"/></a></li>
                <li><a href="#"><img src="images/4.JPG" style="width: 700px;height: 180px;"/></a></li>
                <li><a href="#"><img src="images/image3.png" style="width: 700px;height: 180px;"/></a></li>
            </ul>
        </div>
        <div class="ui-controls01">
            <ul>
                <li class="current">1</li>
                <li>2</li>
                <li>3</li>
            </ul>
            <div class="pager-next01">
                <a href="javascript:void(0);" class="ui-prev01">上一张</a>
                <a href="javascript:void(0);" class="ui-next01">下一张</a>
            </div>
        </div>
    </div>
</div>
<%--    联系div--%>
    <div>
        </br>
        <div style="margin-left: 150px;font-size: 11px;color: #5e5e5e;float: left;">
            <p>加入吃了么：Eatif@service.eatif.com</p>
            <p>企业团购：giftcard@eatif.com</p>
        </div>
        <div style="margin-left: 200px;font-size: 11px;color: #5e5e5e;float: left;">
            <p>市场合作：mkt@eatif.com</p>
            <p>微信公众号搜索・吃了么</p>
        </div>
        <div style="margin-left: 250px;font-size: 11px;color: #5e5e5e;float: left;">
            <p>客服/举报热线电话(07:00-24:00) 9510217</p>
        </div>
    </div>
    <%--版权div--%>
    <div>
        </br></br></br></br>
        <p align="center" style="font-size: 12px;">吃了么(中国)有限公司 2020 版权所有</p>
    </div>
</body>
    <script src="js/jquery.min.js"></script>
    <script src="js/daohangtiao.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/scroll.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>