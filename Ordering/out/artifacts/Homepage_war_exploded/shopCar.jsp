<%@ page import="pojo.Food" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="myCar" class="utils.ShopCar" scope="session"/>
<%
    HashMap<String,Food> foodCar = myCar.getBuylist();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
<%--    导航条--%>
    <link rel="stylesheet" href="css/daohangtiao.css">
<%--    购物车--%>
    <script type="text/javascript" src="js/myCar.js"></script>
    <style>
        /*选项卡1*/
        #lib_Tab1 {
            width: 500px;
            margin: 0px;
            padding: 0px;
            margin-top: 900px;
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
<%--导航条--%>
    <div id="nav-1">
        <ul class="nav">
            <li class="slide1"></li>
            <li class="slide2"></li>
            <li><a  href="index.jsp">网站首页</a></li>
            <li><a href="menu.jsp">菜单页面</a></li>
            <li><a class="active" href="shopCar.jsp">购物车</a></li>
            <li><a href="activity.jsp">活动页面</a></li>
            <li><a href="contact.jsp">联系我们</a></li>
            <li><a href="AdminOrderServlet">个人中心</a></li>
            <li>
                <img src="images/head.png" style="height: 17px;width: 22px;margin-top: 9px;margin-left: 13px;">
                <div style="margin-left: 60px;margin-top: -18px;font-size: 14px;">用户：<%=session.getAttribute("username")%></div>
                <input type="button" value="退出登录" onclick="window.location.href='index.jsp'" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;margin-left: 180px;margin-top:-19px;width: 95px;text-align: center;height: 25px;">
            </li>
        </ul>
    </div></br></br>
<%--购物车--%>
    <form action="CarServlet" method="post" name="myform" style="width: 90%;margin: 0 auto;">
        <div class="mainTable">
            <table id="shoppingcar" width="100%" align="center" cellspacing="0">
                <tr>
                    <td>
                        <input type="checkbox" id="selectall" onclick="selectAll()">全选
                    </td>
                    <td></td>
                    <td align="center">商品名称</td>
                    <td align="center">单价(元)</td>
                    <td align="center">数量</td>
                    <td align="center">小计(元)</td>
                    <td align="center">操作</td>
                </tr>
                <%
                    Food food;
                    float total = 0;
                    if (foodCar == null || foodCar.size() == 0) {
                %>
                <tr height="100">
                    <td colspan="7" align="center">没有商品可显示！</td>
                </tr>
                <% } else {
                    for (HashMap.Entry<String, Food> entry : foodCar.entrySet()){
                        food = (Food)entry.getValue();
                %>
                <tr>
                    <td>
                        <input type="checkbox" name="lip" value=
                                "<%=entry.getKey()%>" onclick="selectSingle()">
                        <%
                            food.getName();
                            food.getPrice();
                        %>
                    </td>
                    <td>
                        <img src="images/menu/<%=food.getPic()%>.PNG" height="60">
                    </td>
                    <td align="center"><a href="https://detail.tmall.com/item.htm?spm=a230r.1.14.1.11d74af9x961Vc&id=587591880726&ns=1&abbucket=6" style="text-decoration: none;">
                        <%=food.getName()%></a>
                    </td>
                    <td align="center" name="unit"><%=food.getPrice()%></td>
                    <td align="center">
                        <div style="width: 160px">
                            <a href="CarServlet?action=minus&name=<%=entry.getKey()%>"/><img src="images/minus.jpg" align="left" style="width: 15px;height: 15px;margin-top: 7px;margin-left: 37px;">
                            <input type="text" value="<%=food.getBuyNum()%>" name="quantity" style="text-align: center; width:47px; height: 27px; float: left;">
                            <a href="CarServlet?action=add&name=<%=entry.getKey()%>"/><img src="images/add.jpg" align="right" style="width: 15px;height: 15px;margin-top: 7px;margin-right: 40px;">
                        </div>
                    </td>
                    <td>
                        <input type="text" value="<%=food.getBuyNum()*food.getPrice()%>" name="total" disabled="disabled" style="text-align: center; width:47px; height: 27px;border: none;color: orangered;">
                    </td>
                    <td align="center">
                        <a href="CarServlet?action=removeone&name=<%=entry.getKey()%>">删除</a>
                    </td>
                </tr>
                <%
                            total += food.getBuyNum()*food.getPrice();
                        } }
                %>
            </table><br/>
        </div>
        <div align="right">商品总价(不含运费)
            <input type="text" value="<%=total%>" id="total" disabled="disabled"
                   style="text-align: center; width:47px; height: 27px;border: none;color: orangered;">元</div>
        <div align="left"><input type="submit" value="批量删除" class="bn" name="action" src="CarServlet?action=批量删除"style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;width: 90px;text-align: center;height: 30px;"></div>
        <div align="right"><input type="submit" value="立刻购买" class="bn" name="action" src="CarServlet?action=立刻购买"style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;width: 90px;text-align: center;height: 30px;"></div>
    </form>
<%--    轮播图--%>
<div class="pic-scroll">
    <div class="lunbo01" style="margin-left:450px;width: 600px;height: 180px;margin-top: 450px;">
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
<%--footer--%>
<div style="text-align: center;">
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
<%--</div>--%>
</body>
    <script src="js/jquery.min.js"></script>
    <script src="js/daohangtiao.js"></script>
</html>