<%@ page import="java.util.HashMap" %>
<%@ page import="pojo.Address" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HashMap<String,Address> addresses=(HashMap<String,Address>)session.getAttribute("addresses");
%>
<html>
<head>
    <title>Title</title>
    <link type="text/css" href="css/ManageAddress.css" rel="stylesheet" />
</head>
<body>
    <% if(addresses==null||addresses.size()==0) { %>
    <div>没有地址可显示！</div>
    <% } else { %>
    <div class="container">
        <%
            Address address;
            for(HashMap.Entry<String,Address> entry:addresses.entrySet())     //通过 HashMap 的 entrySet()方法，可遍历 HashMap。
            {
                address=(Address)entry.getValue();
        %>
        <div class="one">
            <div style="float: left;">
                <div>
                    <span name="name" class="name"><%=address.getName()%></span>
                    <span name="sex" class="sex"><%=address.getSex()%></span>
                    <span name="number" class="number"><%=address.getNumber()%></span>
                </div>
                <div>
                    <span name="alladdress" class="address"><%=address.getProvince()%>-<%=address.getCity()%>-<%=address.getArea()%>-<%=address.getDizhi()%></span>
                </div>
            </div>
            <div style="float: right;width: 5%;">
                <button type="button" onclick="window.location.href='AddressDeleteServlet?No=<%=entry.getKey()%>'">X</button>
            </div>
        </div>
        <% } %>
        <input type="button" value="添加地址" onclick="window.location.href='AddAddress.jsp'" style="border: 1px dotted #FF6347;background-color: #F0F8FF;font-size: 15px;margin: 10px;">
    </div>
    <% } %>
</body>
</html>
