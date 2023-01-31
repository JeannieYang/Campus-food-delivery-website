<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" href="css/AddAddress.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/swiper.min.css">
    <style>
        .dibu {
            width: 70%;
            height: 800px;
            margin: 0 auto;
            margin-top:30px;
            /*         	margin-top:0 auto;
         */
            /* 	border: 1px solid black;
             */	position: relative;
            margin-left:200px;

        }

        .tab1 {
            width: 12.5%;
            height: 50px;
            float: left;
            font-size: 20px;
            text-align: center;
            padding-top: 12px;
            color:black;

        }

        .hao1 {
            width: 100%;
            height: 750px;
            /* 	border: 1px solid black;
             */	position: absolute;
            margin-top: 50px;
            margin-left:70px;

        }

        .hao1 img {
            width: 30%;
            height: 250px;
        }
    </style>
    <script type="text/javascript" src="./js/check.js"></script>
</head>
<body>
    <div>
        <form name="form" action="AddressAddServlet" method="post" onsubmit="return check(this)">
            <div>
                联系人  <input type="text" id="name" name="name">
            </div>
            <div>
                性别  <input type="radio" value="先生" name="sex" checked="checked">先生&nbsp;&nbsp;&nbsp;
                <input type="radio" value="女士"  name="sex">女士</div>
            <div>联系方式  <input type="text" name="number" id="number"></div>
            <div>
                <select name="sheng" id="sheng">
                    <option name="江苏省">江苏省</option></select>
                <select name="shi" id="shi">
                    <option name="南京市">南京市</option></select>
                <select name="qu" id="qu">
                    <option name="江宁区">江宁区</option>
                    <option name="鼓楼区">鼓楼区</option>
                    <option name="雨花台区">雨花台区</option>
                </select>
            </div>
            <div>
                具体地址  <input type="text" name="dizhi" id="dizhi">
            </div>
            <div>
                <button type="submit">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="window.location.href='AddressDisplayServlet'">取消</button>
            </div>
        </form>
    </div>
    <div class="dibu">
        <ul class="nav nav-tabs" role="tablist" style="border-color: #000000; background: #000000 ; ">
            <div class="tab1">一</div>
            <div class="tab1">二</div>
            <div class="tab1">三</div>
        </ul>
        <div class="hao1">
            <div class="hao2">
                <img src="images/1.JPG">
            </div>

        </div>
        <div class="hao1" style="display: none;">
            <div class="hao2">
                <img src="images/2.JPG">
            </div>

        </div>
        <div class="hao1" style="display: none;">
            <div class="hao2">
                <img src="images/3.JPG">
            </div>
        </div>
    </div>
</body>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/swiper.min.js"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            navigation : {
                nextEl : '.swiper-button-next',
                prevEl : '.swiper-button-prev',
            },
            pagination : {
                el : '.swiper-pagination',
            },
            loop : true,
            autoplay : true,
            autoplay : {
                disableOnInteraction : false
            }
        });

        // Tab
        $(document).ready(function() {

            $(".tab1").click(function() {
                var index = $(this).index();
                $(".hao1").css("display", "none");
                $(".hao1").eq(index).css("display", "block");
            })
        });
    </script>
</html>
