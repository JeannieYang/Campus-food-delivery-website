<%@ page import="pojo.Food" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    HashMap<String, Food> food1 = (HashMap<String, Food>)session.getAttribute("food1");
    HashMap<String, Food> food2 = (HashMap<String, Food>)session.getAttribute("food2");
    HashMap<String, Food> food3 = (HashMap<String, Food>)session.getAttribute("food3");
    HashMap<String, Food> food4 = (HashMap<String, Food>)session.getAttribute("food4");
    HashMap<String, Food> food5 = (HashMap<String, Food>)session.getAttribute("food5");
    HashMap<String, Food> food6 = (HashMap<String, Food>)session.getAttribute("food6");
    HashMap<String, Food> food7 = (HashMap<String, Food>)session.getAttribute("food7");
%>
<html>
<head>
<%--    轮播图广告--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
<%--    导航条--%>
    <link rel="stylesheet" href="css/daohangtiao.css">
<%--    菜单--%>
    <link rel="stylesheet" href="css/food.css">
<%--    按钮--%>
    <link rel="stylesheet" href="css/orderButton.css">
    <style>
        .right-con li .btn button.minus strong {
            background: url(images/menu/down.png) no-repeat;
            background-size: 20px 20px;
        }
        .right-con li .btn button.add strong {
            background: url(images/menu/up.png) no-repeat;
            background-size: 20px 20px;
        }
        .hide {
            display: none;
        }
        .c1 {
            position: fixed;
            top:0;
            bottom: 0;
            left:0;
            right: 0;
            background: rgba(0,0,0,0.3);
            z-index: 2;
            text-align: center;
        }
        .c2{
            border: 2px #c3dcf1 solid;
            background-color: white;
            border-radius: 5px;
            position: fixed;
            width: 330px;
            height: 350px;
            left: 50%;
            text-align: center;
            z-index: 3;
            margin-left: -165px;
            margin-top: 70px;
        }
        hr{
            height: 1.5px;
            background-color: lightblue;
            border: none;
            width: 85%;
            /*分割线hr居中显示*/
            margin-left: auto;
            margin-right: auto;
        }
        .box { /* 所有 div 类为 box 的样式 */
            position:relative;
            line-height:160%;
            margin:6px;
        }
        .i-label{ /*所有 label 类为 i-label 的样式*/
            position:absolute;
            left:20px;
            width:90px;
            text-align:right;
        }
    </style>
    <script type="text/javascript">
        function Show(){
            document.getElementById('shade').classList.remove('hide');
            document.getElementById('modal').classList.remove('hide');
        }
        function Hide(){
            document.getElementById('shade').classList.add('hide');
            document.getElementById('modal').classList.add('hide');
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
            <li><a class="active" href="menu.jsp">菜单页面</a></li>
            <li><a href="shopCar.jsp">购物车</a></li>
            <li><a href="activity.jsp">活动页面</a></li>
            <li><a href="contact.jsp">联系我们</a></li>
            <li><a href="AdminOrderServlet">个人中心</a></li>
            <li>
                <img src="images/head.png" style="height: 17px;width: 22px;margin-top: 9px;margin-left: -5px;">
                <div style="margin-left: 20px;margin-top: -18px;font-size: 14px;">用户：<%=session.getAttribute("username")%></div>
                <input type="button" value="添加菜品" onclick="Show();" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;margin-left: 120px;width: 75px;text-align: center;height: 25px;">
                <input type="button" value="退出登录" onclick= "window.location.href='index.jsp'" style="background-color: yellowgreen;color: white;border-radius: 5px;border: 0px #d5d5d5;width: 75px;text-align: center;height: 25px;">
            </li>
        </ul>
    </div>
<%--主菜单--%>
<div class="main">
    <div class="left-menu">
        <ul>
            <li class="active">时令菜<span class="num-price"></span></li>
            <li>烧卤冷味</li>
            <li>秦淮小厨</li>
            <li>传家煲</li>
            <li>淮阳戏点</li>
            <li>煎炸小杂件</li>
            <li>金陵什锦</li>
            <!--   <li>酒水饮料</li>
               <li>酒水饮料</li>
               <li>酒水饮料</li>
               <li>酒水饮料</li>
               <li>酒水饮料</li>
               <li>酒水饮料</li> -->
        </ul>
    </div>
    <div class="con">
        <div class="right-con con-active">
            <%
                if(food1 == null || food1.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food1.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food2 == null || food2.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food2.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food3 == null || food3.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food3.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                        <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food4 == null || food4.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food4.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food5 == null || food5.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food5.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food6 == null || food6.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food6.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
        <div class="right-con con-active">
            <%
                if(food7 == null || food7.size() == 0) {
            %>
            <div>
                没有商品可显示！
            </div>
            <% } else { %>
            <ul>
                <%
                    Food f;
                    for (HashMap.Entry<String, Food> entry:food7.entrySet()){
                        f = (Food)entry.getValue();
                %>
                <li>
                    <div class="menu-img"><img src="images/menu/<%=f.getPic()%>.PNG" width="55" height="55" /></div>
                    <div class="menu-txt">
                        <p class="caiming"><%=f.getName()%></p></p>
                        <p class="list1"><%=f.getIntro()%></p>
                        <p class="list2">
                            <b>￥<%=f.getPrice()%></b>
                            <div style="width: 220px;height: 220px;margin-left: 750px;"><a href="CarServlet?action=buy&name=<%=entry.getKey()%>">+</a></div>
                        </p>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                }
            %>
        </div>
    </div>
    <%--按钮--%>
    <div id="dg" style="z-index: 9999; position: fixed ! important; right: 0px; bottom: 0px;">
        <table width="100%" style="position: absolute; width:260px; right: 0px; bottom: 0px;">
            <button onclick="window.location.href='shopCar.jsp'">查看 购物车</button>
        </table>
    </div>

<%--    添加菜品--%>
    <div class="c1 hide" id="shade">
        <div class="c2 hide" id="modal">
            <h3>增加菜品</h3>
            <hr style="height: 1.5px;background-color: lightblue;border: none;width: 85%;">
            <form name="frm1" action="DoAddServlet" method="post"
                  enctype="multipart/form-data">
                <div class="box">
                    <label class="i-label">*菜品名称</label>
                    <input type="text" name="name1" style="line-height: 23px;position:relative;left:40px;width:150px;"/>
                </div>
                <div class="box">
                    <label class="i-label">备注</label>
                    <input type="text" name="intro1" style="line-height: 23px;position:relative;left:40px;width:150px;"/>
                </div>
                <div class="box">
                    <label class="i-label">*价格</label>
                    <input type="text" name="price1" style="line-height: 23px;position:relative;left:40px;width:150px;">
                </div>
                <div class="box">
                    <label class="i-label">*库存</label>
                    <input type="text" name="num1" style="line-height: 23px;position:relative;left:40px;width:150px;"/>
                </div>
                <div class="box">
                    <label class="i-label">图片</label>
                    <input type="file" name="pic" style="width: 150px;margin-left: 158px;"/>
                </div>
                <div class="box">
                    <label class="i-label">*类别</label>
                    <input type="text" name="type1" style="line-height: 23px;position:relative;left:40px;width:150px;"/>
                </div></br></br>
                <div>
                    <input type="submit" value="提 交" class="btn" style="margin-top: -60px;width: 60px;height: 25px;text-align: center;vertical-align: middle;border-radius: 5px;border:  1px #c3dcf1 solid;background-color: transparent;line-height: 20px;padding-top: 3px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="取 消" class="btn" onclick="Hide();" style="margin-top: -60px;width: 60px;height: 25px;text-align: center;vertical-align: middle;border-radius: 5px;border:  1px #c3dcf1 solid;background-color: transparent;line-height: 20px;padding-top: 3px;">
                </div>
            </form>
        </div>
    </div>
</div>
<%--轮播图--%>
<div class="pic-scroll">
    <div class="lunbo01" style="margin-left:300px;width: 600px;height: 180px;margin-top: 20px;">
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
<%--    footer--%>
<div style="margin-top :850px;text-align: center;">
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
</body>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/scroll.js"></script>
    <script src='js/jquery.min.js'></script>
    <script src="js/daohangtiao.js"></script>
    <script type="text/javascript">
        $(function () {
            //加的效果
            $(".add").click(function () {
                $(this).prevAll().css("display", "inline-block");
                var n = $(this).prev().text();
                var num = parseInt(n) + 1;
                if (num == 0) { return; }
                $(this).prev().text(num);
                var danjia = $(this).next().text();//获取单价
                var a = $("#totalpriceshow").html();//获取当前所选总价
                $("#totalpriceshow").html((a * 1 + danjia * 1).toFixed(2));//计算当前所选总价

                var nm = $("#totalcountshow").html();//获取数量
                $("#totalcountshow").html(nm * 1 + 1);
                jss();//<span style='font-family: Arial, Helvetica, sans-serif;'></span>   改变按钮样式
            });
            //减的效果
            $(".minus").click(function () {
                var n = $(this).next().text();
                var num = parseInt(n) - 1;

                $(this).next().text(num);//减1

                var danjia = $(this).nextAll(".price").text();//获取单价
                var a = $("#totalpriceshow").html();//获取当前所选总价
                $("#totalpriceshow").html((a * 1 - danjia * 1).toFixed(2));//计算当前所选总价

                var nm = $("#totalcountshow").html();//获取数量
                $("#totalcountshow").html(nm * 1 - 1);
                //如果数量小于或等于0则隐藏减号和数量
                if (num <= 0) {
                    $(this).next().css("display", "none");
                    $(this).css("display", "none");
                    jss();//改变按钮样式
                    return
                }
            });
            function jss() {
                var m = $("#totalcountshow").html();
                if (m > 0) {
                    $(".right").find("a").removeClass("disable");
                } else {
                    $(".right").find("a").addClass("disable");
                }
            };
            //选项卡
            $(".con>div").hide();
            $(".con>div:eq(0)").show();

            $(".left-menu li").click(function () {
                $(this).addClass("active").siblings().removeClass("active");
                var n = $(".left-menu li").index(this);
                $(".left-menu li").index(this);
                $(".con>div").hide();
                $(".con>div:eq(" + n + ")").show();
            });
        });
    </script>
</html>

