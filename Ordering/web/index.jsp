<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/orderButton.css">
    <style>
      * {
        margin: 0;
        padding: 0;
      }
      body {
        background-color: whitesmoke;
      }
      .box {
        height: 400px;
        width: 100%;
        margin: 0 auto;
        position: relative;
      }
      .imgbox img {
        height: 400px;
        width: 100%;
        z-index:0;
      }
      .register {
        z-index:100;
        color: white;
        background-color: #0f0f0f;
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

      /*选项卡2*/
      #lib_Tab2 {
        width: 576px;
        margin: 0px;
        padding: 0px;
        margin-bottom: 15px;
      }

      /*菜单class*/
      .lib_tabborder {
        border: 1px solid #cccccc;
        width: 900px;
      }

      .lib_Menubox {
        height: 30px;
        line-height: 28px;
        position: relative;
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
        width: 102px;
        color: #949694;
        font-weight: bold;
        margin-right: 2px;
        height: 27px;
        line-height: 25px;
        background-repeat: no-repeat;
        background-position: left;
      }

      /*背景图片以外的选项卡*/
      .lib_Menubox li.hover {
        padding: 0px;
        background: #cccccc;
        width: 102px;
        border: 1px solid #cccccc;
        color: #5e5e5e;
        height: 26px;
        line-height: 25px;
        background-color: #cccccc;
      }

      .lib_Contentbox {
        clear: both;
        margin-top: 0px;
        border-top: none;
        height: 260px;
        text-align: center;
        padding-top: 8px;
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
  <%
    session.invalidate();
  %>
<%--  轮播图div--%>
    <div class="banner1 box">
      <div class="register"><input type="button" value="登录/注册" style="position:absolute;"></div>
      <div class="imgbox">
        <img src="images/image1.png" alt="">
        <img src="images/image2.png" alt="">
        <img src="images/image3.png" alt="">
        <img src="images/image4.png" alt="">
      </div>
    </div>
    </br></br>
<%--宗旨--%>
    <div style="margin-left: 170px;">
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 280px;margin-left: 80px;float:left;"></br></br>
          <div align="center"><img src="images/送达.png" style="width: 90px;height: 90px;"></div>
          <h3 align="center">10分钟送达</h3></br>
          <h4 align="center" style="color: #888888;">最快10分钟达</h4>
        </div>
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 280px;margin-left: 80px;float:left;"></br></br>
          <div align="center"><img src="images/配送.png" style="width: 90px;height: 90px;" align="center"></div>
          <h3 align="center">免费配送</h3></br>
          <h4 align="center" style="color: #888888;">满20元免配送费</h4>
        </div>
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 280px;margin-left: 80px;float:left;"></br></br>
          <div align="center"><img src="images/配齐.png" style="width: 90px;height: 90px;" align="center"></div>
          <h3 align="center">一站式配齐</h3></br>
          <h4 align="center" style="color: #888888;">美食+水果+饮品</h4>
        </div>
    </div>
    </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
<%--门店div--%>
    <h1 style="margin-left: 170px;font-weight: 900;">吃了么门店</h1></br>

    <div style="margin-left: 190px;"><span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="font-size: 30px; float: left;"></span>
      <h2 style="font-weight: 900;float: left;">&nbsp;北区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
      </br><hr width="50%;" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span style="font-size: 28px;font-weight: 200;color: #cccccc;">North District</span>
    </div></br>
<%--  选项卡--%>
    <div id="lib_Tab1" style="margin-left: 200px;height: 800px;">
      <div class="lib_Menubox lib_tabborder">
        <ul>
          <li id="one1" onclick="setTab('one',1,4)" class="hover">食堂区</li>
          <li id="one2" onclick="setTab('one',2,4)">非食堂区</li>
        </ul>
      </div>
      <div class="lib_Contentbox lib_tabborder">
        <div id="con_one_1">
          <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 160px;float:left;">
            <div style="text-align: center;"><img src="images/index/1.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
            <hr width="85%" style="margin-left: auto;margin-right: auto;">
            <h4 align="center" style="color: #888888;">萃园一食堂</h4>
            <h5 align="center" style="color: #888888;">7:00-21:00</h5>
          </div>
          <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 120px;float:left;">
            <div style="text-align: center;"><img src="images/index/2.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
            <hr width="85%" style="margin-left: auto;margin-right: auto;">
            <h4 align="center" style="color: #888888;">萃园二食堂</h4>
            <h5 align="center" style="color: #888888;">7:00-21:00</h5>
          </div>
        </div>
        <div id="con_one_2" style="display: none">
          <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 160px;float:left;">
            <div style="text-align: center;"><img src="images/index/3.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
            <hr width="85%" style="margin-left: auto;margin-right: auto;">
            <h4 align="center" style="color: #888888;">北区小吃街</h4>
            <h5 align="center" style="color: #888888;">7:00-21:00</h5>
          </div>
          <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 120px;float:left;">
            <div style="text-align: center;"><img src="images/index/4.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
            <hr width="85%" style="margin-left: auto;margin-right: auto;">
            <h4 align="center" style="color: #888888;">北区超市</h4>
            <h5 align="center" style="color: #888888;">7:00-21:00</h5>
          </div>
        </div>
      </div>
    </div>

    <div style="margin-top: -500px;">
        <div style="margin-left: 190px;"><span class="glyphicon glyphicon-map-marker" aria-hidden="true" style="font-size: 30px; float: left;"></span>
          <h2 style="font-weight: 900;float: left;">&nbsp;东区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
          </br><hr width="50%;" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <span style="font-size: 28px;font-weight: 200;color: #cccccc;">East District</span>
        </div></br></br>
    </div>
<%--  选项卡--%>
  <div id="lib_Tab2" style="margin-left: 200px;height: 800px;">
    <div class="lib_Menubox lib_tabborder">
      <ul>
        <li id="two1" onclick="setTab('two',1,4)" class="hover">食堂区</li>
        <li id="two2" onclick="setTab('two',2,4)">非食堂区</li>
      </ul>
    </div>
    <div class="lib_Contentbox lib_tabborder">
      <div id="con_two_1">
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 160px;float:left;">
          <div style="text-align: center;"><img src="images/index/5.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
          <hr width="85%" style="margin-left: auto;margin-right: auto;">
          <h4 align="center" style="color: #888888;">润园一食堂</h4>
          <h5 align="center" style="color: #888888;">7:00-21:00</h5>
        </div>
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 120px;float:left;">
          <div style="text-align: center;"><img src="images/index/6.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
          <hr width="85%" style="margin-left: auto;margin-right: auto;">
          <h4 align="center" style="color: #888888;">润园二食堂</h4>
          <h5 align="center" style="color: #888888;">7:00-21:00</h5>
        </div>
      </div>
      <div id="con_two_2" style="display: none">
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 160px;float:left;">
          <div style="text-align: center;"><img src="images/index/7.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
          <hr width="85%" style="margin-left: auto;margin-right: auto;">
          <h4 align="center" style="color: #888888;">东区无名餐厅</h4>
          <h5 align="center" style="color: #888888;">7:00-21:00</h5>
        </div>
        <div style="border-radius: 11px;background-color: white;width: 220px;height: 240px;margin-left: 100px;float:left;">
          <div style="text-align: center;"><img src="images/index/8.jpg" style="width: 140px;height: 110px;margin-top: 17px;"></div>
          <hr width="85%" style="margin-left: auto;margin-right: auto;">
          <h4 align="center" style="color: #888888;">东区超市</h4>
          <h5 align="center" style="color: #888888;">7:00-21:00</h5>
        </div>
      </div>
    </div>
  </div>
  <%--footer--%>
  <div style="margin-top: -530px;">
  <%--联系div--%>
      <div>
        <hr></br>
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
  </div>
<%--按钮--%>
    <div id="dg" style="z-index: 9999; position: fixed ! important; right: 0px; bottom: 0px;">
      <table width="100%" style="position: absolute; width:260px; right: 0px; bottom: 0px;">
        <button onclick="window.location.href='login.jsp'">即刻  点餐</button>
      </table>
    </div>
  </body>
  <script src="https://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
  <script src="js/banner.js"></script>
  <script>
    $(".banner").banner($(".banner").find("img"), {
       but: false,    // 左右按钮默认为true
       butahidden: true,    // 是否自动隐藏左右按钮默认隐藏
       list: false,  // 导航按钮
       index: 2,    //初始从第几个开始默认为0
       autoPlay: true,  // 自动轮播默认为true
       delayTiem: 2000,  // 延迟时间默认为2000
       moveTime: 500    // 远动时间默认为300
    });
    $(".banner1").banner($(".banner1").find("img"));
  </script>
</html>