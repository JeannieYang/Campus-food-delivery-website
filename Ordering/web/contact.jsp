<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--导航条--%>
    <link rel="stylesheet" href="css/daohangtiao.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
    <style>
        .i-label {
            position: absolute;
            left: 20px;
            width: 90px;
            margin-left: 510px;
        }
        .i-text {
            position:relative;
            left:70px;
            width:140px;
            margin-left: -15px;
        }
    </style>
    <style>
        /*选项卡1*/
        #lib_Tab1 {
            width: 500px;
            margin: 0px;
            padding: 0px;
            margin-bottom: 15px;
        }

        /*菜单class*/
        .lib_tabborder {
            border: 1px solid #95C9E1;
            /*margin-left: 500px;*/
            margin-top: -180px;
            margin-left: 180px;
            float: left;
        }

        .lib_Menubox {
            height: 30px;
            line-height: 28px;
            position: relative;
            width: 180px;
        }

        .lib_Menubox ul {
            margin: 0px;
            padding: 0px;
            list-style: none;
            position: absolute;
            top: 3px;
            left: 0;
            margin-left: 10px;
            height: 28px;
            text-align: center;
        }

        /*背景图片选项卡*/
        .lib_Menubox li {
            float: left;
            display: block;
            cursor: pointer;
            width: 20px;
            color: #949694;
            font-weight: bold;
            margin-right: 2px;
            height: 27px;
            line-height: 25px;
            background-image: url("option_r2_c2.jpg");
            background-repeat: no-repeat;
            background-position: left;
        }

        /*背景图片以外的选项卡*/
        .lib_Menubox li.hover {
            padding: 0px;
            background: #fff;
            width: 20px;
            border: 1px solid #95C9E1;
            color: #739242;
            height: 26px;
            line-height: 25px;
            background-color: #E4F2FD;
        }

        .lib_Contentbox {
            clear: both;
            margin-top: -180px;
            border-top: none;
            height: 181px;
            text-align: center;
            /*padding-top: 8px;*/
            width: 180px;
            float: left;
        }
    </style>
    <script>
        function setTab(name,cursel,n){
            for(i=1;i<=n;i++){
                var menu=document.getElementById(name+i);
                var con=document.getElementById("con_"+name+"_"+i);
                menu.className=i==cursel?"hover":"";
                con.style.display=i==cursel?"block":"none";
            }
        }
    </script>
</head>
<%--导航条--%>
<div id="nav-1">
    <ul class="nav">
        <li class="slide1"></li>
        <li class="slide2"></li>
        <li><a  href="index.jsp">网站首页</a></li>
        <li><a href="menu.jsp">菜单页面</a></li>
        <li><a href="shopCar.jsp">购物车</a></li>
        <li><a href="activity.jsp">活动页面</a></li>
        <li><a class="active" href="contact.jsp">联系我们</a></li>
        <li><a href="AdminOrderServlet">个人中心</a></li>
        <li>
            <img src="images/head.png" style="height: 17px;width: 22px;margin-top: 9px;margin-left: 13px;">
            <div style="margin-left: 60px;margin-top: -18px;font-size: 14px;">用户：<%=session.getAttribute("username")%></div>
            <input type="button" value="退出登录" onclick="window.location.href='index.jsp'" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;margin-left: 180px;margin-top:-19px;width: 95px;text-align: center;height: 25px;">
        </li>
    </ul>
</div>
<div style="background-image: url('images/background.jpg')">
    <div class="main-w3l" style="text-align: center;">
        <h1>吃了么反馈表单</h1>
            <form action="ContactServlet" method="post">
                <div class="contact-agile">
                    <h2>联系我们</h2>
                    <label class="i-label">姓名</label>
                    <input type="text" name="First Name"  required class="i-text"></br></br>
                    <label class="i-label">E-MAIL</label>
                    <input type="email" name="Email"  required class="i-text"></br></br>
                    <label class="i-label">消息</label>
                    <textarea name="Message" placeholder="在这输入消息....." required class="i-text"></textarea></br></br>
                </div>
                <div class="send-button w3layouts" style="margin-left: 40px;">
                    <input type="submit" value="发 送" style="border-color: yellowgreen;background-color: transparent;border-radius: 3px;">
                </div>
            </form>
            <div class="con-mapw3 agile" style="margin-left: 45px;">
                <iframe class="map" src="map.html" frameborder="0" scrolling="no"allowfullscreen></iframe>
            </div>
            <div class="clear"></div>
    </div>
    <%--    轮播图--%>
    <div class="pic-scroll">
        <div class="lunbo01" style="margin-left:450px;width: 600px;height: 180px;margin-top: 50px;">
            <div class="banner-main-img01" style="margin-left: 50px;width: 650px;height: 180px;">
                <ul>
                    <li style="display: block;"><a href="#"><img src="images/image1.png" style="width: 700px;height: 180px;"/></a></li>
                    <li><a href="#"><img src="images/image2.png" style="width: 700px;height: 180px;"/></a></li>
                    <li><a href="#"><img src="images/image3.png" style="width: 700px;height: 180px;"/></a></li>
                    <li><a href="#"><img src="images/image4.png" style="width: 700px;height: 180px;"/></a></li>
                </ul>
            </div>
            <div class="ui-controls01">
                <ul>
                    <li class="current">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                </ul>
                <div class="pager-next01">
                    <a href="javascript:void(0);" class="ui-prev01">上一张</a>
                    <a href="javascript:void(0);" class="ui-next01">下一张</a>
                </div>
            </div>
        </div>
    </div>
<%--    tab选项卡--%>
<div id="lib_Tab1">
    <div class="lib_Menubox lib_tabborder">
        <ul>
            <li id="one1" onclick="setTab('one',1,4)">1</li>
            <li id="one2" onclick="setTab('one',2,4)">2</li>
            <li id="one3" onclick="setTab('one',3,4)">3</li>
        </ul>
    </div>
    <div class="lib_Contentbox lib_tabborder">
        <div id="con_one_1" ><img src="images/6.jpg" style="width: 179px;height: 181px;"/></div>
        <div id="con_one_2" style="display: none"><img src="images/7.jpg" style="width: 179px;height: 181px;"/></div>
        <div id="con_one_3" style="display: none"><img src="images/8.jpg" style="width: 179px;height: 181px;"/></div>
    </div>
</div>
    <%--    footer--%>
    <div style="margin-top :350px;text-align: center;">
        <div>
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
            </br></br></br>
            <p align="center" style="font-size: 12px;">吃了么(中国)有限公司 2020 版权所有</p>
        </div>
    </div>
</div>
</body>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/scroll.js"></script>
    <script src='js/jquery.min.js'></script>
    <script src="js/daohangtiao.js"></script>
</html>