<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
<%--    导航条--%>
    <link rel="stylesheet" href="css/daohangtiao.css">
<%--    promotion--%>
    <style>
        a{
            color:black;
            text-decoration:none;

        }
        a:hover{
            color:darkred;
        }
        .promotion{
            margin:0 auto;
            width:1200px;
            padding:14px;
        }
        .word{
            color:black;
        }
    </style>
    <style>
        /*选项卡1*/
        #lib_Tab1 {
            width: 500px;
            margin: 0px;
            padding: 0px;
            margin-top: 450px;
        }

        /*菜单class*/
        .lib_tabborder {
            border: 1px solid #95C9E1;
            /*margin-left: 500px;*/
            margin-top: -400px;
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
            margin-top: -400px;
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
<body>
<%--    导航条--%>
    <div id="nav-1">
        <ul class="nav">
            <li class="slide1"></li>
            <li class="slide2"></li>
            <li><a  href="index.jsp">网站首页</a></li>
            <li><a href="menu.jsp">菜单页面</a></li>
            <li><a href="shopCar.jsp">购物车</a></li>
            <li><a class="active" href="activity.jsp">活动页面</a></li>
            <li><a href="contact.jsp">联系我们</a></li>
            <li><a href="AdminServlet">个人中心</a></li>
            <li>
                <img src="images/head.png" style="height: 17px;width: 22px;margin-top: 9px;margin-left: 13px;">
                <div style="margin-left: 60px;margin-top: -18px;font-size: 14px;">用户：<%=session.getAttribute("username")%></div>
                <input type="button" value="退出登录" onclick="window.location.href='index.jsp'" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;margin-left: 180px;margin-top:-19px;width: 95px;text-align: center;height: 25px;">
            </li>
        </ul>
    </div>
<%--    活动--%>
    <div class="promotion">
        <h1><a href="#" target="_blank">南京工程学院外卖到宿舍服务</a></h1>
        <i>时间：2020-9-2&nbsp;&nbsp;&nbsp;&nbsp;作者：A</i>
        <img src="images/image1.png" width="100%" height=300px/>
            <hr></hr>
            <h1><a href="#" target="_blank" style>北一一楼面包房开学优惠</a></h1>
            <i>时间：2020-9-2&nbsp;&nbsp;&nbsp;&nbsp;作者：B</i>
            <img src="images/activity/1.png" width="100%" height=300px/>
                <p>北一一楼面包房开学优惠，所有甜品一律五折，活动有效期为9.1-9.30</p>
                <hr></hr>
                <h1><a href="#" target="_blank">新品 | 冬季de洁白天使-天使白面包</a></h1>
                <i>时间：2020-9-3&nbsp;&nbsp;&nbsp;&nbsp;作者：C</i></br>
                <img src="images/activity/2.jpg" width="100%" height=300px/>
                    <p>美好的冬季雪花相伴  雪花像是酸奶的白  飘雪冬季    Angel white bread天使白面包   采用低温烘焙工艺  搭配特调发酵酸奶口味馅料</p>
                    <hr></hr>
                    <h1><a href="#" target="_blank">北大活奶茶店暑期优惠</a></h1>
                    <i>时间：2020-9-2&nbsp;&nbsp;&nbsp;&nbsp;作者：A</i>
                    <img src="images/activity/3.png" width="100%" height=300px>
                        <p>北区奶茶店暑期特别优惠来啦，全场满38立减5元，为您带来冰爽一夏！</p>
                        <hr></hr>
    </div>
<%--    轮播图--%>
<div class="pic-scroll">
    <div class="lunbo01" style="margin-left:450px;width: 600px;height: 180px;">
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
        <div id="con_one_1" ><img src="images/1.JPG" style="width: 179px;height: 181px;"/></div>
        <div id="con_one_2" style="display: none"><img src="images/2.JPG" style="width: 179px;height: 181px;"/></div>
        <div id="con_one_3" style="display: none"><img src="images/3.JPG" style="width: 179px;height: 181px;"/></div>
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
</html>