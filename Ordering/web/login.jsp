<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" type="text/css" href="css/sytle.css" />
    <script>
        var error = "<%=request.getParameter("error")%>";
        if(error == "yes"){
            alert("用户名或密码错误！")
        }else if (error == "noExist"){
            alert("用户不存在，请注册！")
        }
    </script>
    <script type="text/javascript">
        function change() {
            document.getElementById("validate").src = "ValidateServlet?random="
                + Math.random();
        }
        function Show(){
            document.getElementById('shade').classList.remove('hide');
            document.getElementById('modal').classList.remove('hide');
        }
        function Hide(){
            document.getElementById('shade').classList.add('hide');
            document.getElementById('modal').classList.add('hide');
        }
    </script>
    <style>
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
            height: 310px;
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
        .i-label{ /*所有 label 类为 i-label 的样式*/
            position:absolute;
            left:20px;
            width:90px;
            text-align:right;
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
    <div class="content">
            <div class="form sign-in" style="margin-top: 55px;">
               <h2>欢迎回来</h2>
                <form action="LoginServlet" method="post">
                    <label>
                       <span>用户名</span><input type="text" name="username" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                       <span>密码</span>
                       <input type="password" name="password" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                        <span>验证码</span>
                        <input type="text" name="userVCode" class="textVcode" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                        <span>
                            <img src="ValidateServlet" id="validate" onclick="change()" style="height: 22px;"/>
                            <a href="javascript:change()">
                                <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                            </a>
                        </span>
                    </label>
                    <input type="submit"  value="登录" style="float: left;width: 100px;height: 36px;border-radius: 30px;margin-left: 240px;margin-top: 30px;font-size: 15px;color: #fff;background-color: peru;"/>
                </form>
            </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2 style="margin-top: 50px;">还未注册？</h2>
                    <p>立即注册，享受美食！</p>
                </div>
                <div class="img__text m--in">
                    <h2 style="margin-top: 50px;">已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
                <h2 style="margin-top: -25px;float: left;">立即注册</h2>
                <form action="RegisterUserServlet" method="post">
                    <label>
                        <span>收货人姓名</span>
                        <input type="text" name="username" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                        <span>邮箱</span>
                        <input type="email" name="mail" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                        <span>密码</span>
                        <input type="password" name="userpwd" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                        <span>电话</span>
                        <input type="text" name="phone" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                    <label>
                        <span>收货地址</span>
                        <input type="text" name="address" style="border-bottom: 1px solid rgba(0, 0, 0, 0.4);"/>
                    </label>
                        <input type="submit" value="注册" style="float: left;width: 100px;height: 36px;border-radius: 30px;margin-left: 200px;margin-top: 20px;font-size: 15px;color: #fff;background-color: peru;">
                </form>
                <input type="button" value="管理员注册" onclick="Show();" style="width: 100px;height: 36px;border-radius: 30px;margin-top: 20px;font-size: 15px;color: #fff;background-color: peru;">
            </div>
        </div>
    </div>
<%--    轮播图--%>
    <div class="pic-scroll">
        <div class="lunbo01" style="margin-left:450px;width: 600px;height: 180px;margin-top: -400px;">
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
<%--    footer--%>
    <div style="margin-top :1000px;text-align: center;">
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
<%--    弹窗注册管理员--%>
    <div class="c1 hide" id="shade">
        <div class="c2 hide" id="modal"></br>
            <h3 style="margin-top: 10px;">增加管理员</h3></br>
            <hr>
            <form name="frm1" action="RegisterAdminServlet" method="post"
                  enctype="multipart/form-data">
                <div class="box">
                    <label class="i-label">*用户名</label>
                    <input type="text" name="username1" style=""/>
                </div>
                <div class="box">
                    <label class="i-label">*密&nbsp;&nbsp;&nbsp;码</label>
                    <input type="text" name="userpwd1"/>
                </div>
                <div class="box">
                    <label class="i-label">*联系方式</label>
                    <input type="text" name="phone1"/>
                </div>
                <div class="box">
                    <label class="i-label">*邮&nbsp;&nbsp;&nbsp;箱</label>
                    <input type="text" name="mail1"/>
                </div>
                <div class="box">
                    <label class="i-label">*管理地区</label>
                    <input type="text" name="address1"/>
                </div></br></br>
                <input type="submit" value="提交" style="margin-left :75px;margin-top: 2px;width: 60px;height: 25px;text-align: center;vertical-align: middle;border-radius: 5px;border:  1px #c3dcf1 solid;background-color: transparent;line-height: 20px;padding-top: 3px;"/>
                <input type="reset" value="取消" onclick="Hide();" style="margin-left :190px;margin-top: -25px;width: 60px;height: 25px;text-align: center;vertical-align: middle;border-radius: 5px;border:  1px #c3dcf1 solid;background-color: transparent;line-height: 20px;padding-top: 3px;"/>
            </form>
        </div>
    </div>
</body>
    <script src="js/login.js"></script>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/scroll.js"></script>
<%--<script>--%>
<%--    $(function (){--%>
<%--        $(":button").click(function () { // 当点击提交提交按钮后，发送AJAX请求--%>
<%--            $.ajax({--%>
<%--                url:"LoginServlet",     // 请求路径--%>
<%--                type:"post",           // 请求方式--%>
<%--                data:{                 // 发送的请求参数--%>
<%--                    username:$("#username").val(),--%>
<%--                    password:$("#password").val()--%>
<%--                },--%>
<%--                dataType:"text",      // 返回值的类型--%>
<%--                success:function (data) {     // 回调函数--%>
<%--                    alert(data);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</html>