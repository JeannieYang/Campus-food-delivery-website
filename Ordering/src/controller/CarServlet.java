package controller;

import db.BuyNumDB;
import db.OrderDB;
import db.OrderDetailDB;
import pojo.Food;
import pojo.Order;
import pojo.OrderDetail;
import utils.ShopCar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@WebServlet(name = "CarServlet",urlPatterns = "/CarServlet")
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        OrderDB o = new OrderDB();
        HashMap<String, Food> food = (HashMap<String, Food>) session.getAttribute("food");
//        System.out.println(food);
        ShopCar myCar = (ShopCar) session.getAttribute("myCar");
//        System.out.println(myCar);
        if (myCar==null)
            myCar = new ShopCar();
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null)
            action = "";
        if (action.equals("buy")) {
            String name = request.getParameter("name");
            Food temp = (Food) food.get(name);
            myCar.addItem(temp);
            session.setAttribute("myCar", myCar);
            response.sendRedirect("AdminServlet");
            return;
        }
        if (action.equals("add")) {
            String name = request.getParameter("name");
            Food temp = (Food) food.get(name);
            myCar.addItem(temp);
            session.setAttribute("myCar", myCar);
        }else if (action.equals("minus")) {
            String name = request.getParameter("name");
            if(myCar.getBuylist().get(name).getBuyNum()-1 <= 0){
                PrintWriter out = response.getWriter();
                out.println("<script>alert('购买数量不能小于1！');window.location='shopCar.jsp';</script>");
//                System.out.println("1");
            }else {
                myCar.minusItem(name);
                session.setAttribute("myCar", myCar);
            }
        }else if (action.equals("removeone")) {
            String name = request.getParameter("name");
            myCar.removeItem(name);
            session.setAttribute("myCar", myCar);
        }else if (action.equals("批量删除")) {
            String[] name = request.getParameterValues("lip");
            System.out.println(name);//检验lip是否传到过来
            myCar.removeItem(name);
            session.setAttribute("myCar", myCar);
//            System.out.println("批量删除成功！");
        }else if (action.equals("立刻购买")) {
            //通过 request.getParameterValues()方法获取选中的复选框的值，返回
            //待购买的一组唇膏编号
            String[] name = request.getParameterValues("lip");
//            System.out.println(name);//检验lip是否传到过来
            if (name.length==0)
                return;
            String flag = (String)session.getAttribute("isLogin");
            if(flag == null || !flag.equals("true")) {
//                System.out.println("error");
                response.sendRedirect("login.jsp");
                return;
            }
            else {
                String userId = (String)session.getAttribute("username");
                float totalPrice = 0;
                //调用 Order 类型对象的 createOrderId()方法，自动生成订单号
                Order order = new Order();
                order.createOrderId();
                order.setUserId(userId);
                order.setOrderTime(new Date());
//                System.out.println(order.getOrderTime());//检验存入的时间格式
                //利用获取的待购买的一组唇膏编号，从购物车对象中逐个取出相应唇膏
                //信息，存入订单细节对象。将订单细节对象加入到列表 orderDetails 中
                ArrayList<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
                ArrayList<Food> changebuyNum = new ArrayList<Food>();//购买的唇膏传入BuyNumDB统计总的购买数量
                for (int i=0;i<name.length;i++) {
                    OrderDetail orderDetail = new OrderDetail();
                    Food f= myCar.getBuylist().get(name[i]);
                    orderDetail.setOrderId(order.getOrderId());
                    orderDetail.setName(f.getName());
                    orderDetail.setNowPrice(f.getPrice());
                    orderDetail.setBuyNum(f.getBuyNum());
                    orderDetails.add(orderDetail);
                    changebuyNum.add(f);
                    totalPrice += orderDetail.getNowPrice()*orderDetail.getBuyNum();
                }
                order.setTotalPrice(totalPrice);
//                System.out.println(orderDetails.get(0).getBrand()+orderDetails.get(0).getName());
//                System.out.println("数据准备插入");
                //调用 OrderDB、OrderDetailDB 类的相关 add 方法，将订单和订单细节信息插入数据库
                OrderDetailDB orderDetailDB = new OrderDetailDB();
                orderDetailDB.addOrderDetail(orderDetails);
                orderDetailDB.close();
//                System.out.println("OrderDetailDB数据已插入");
                OrderDB orderDB = new OrderDB();
                orderDB.addOrder(order);
                orderDB.close();
//                System.out.println("OrderDB数据已插入");

//                System.out.println(changebuyNum);//查看加入购物车的唇膏
                //改变原始lip表中的购买数量（更改数据库中的数据）
                BuyNumDB bdb = new BuyNumDB();
                bdb.buyNum(changebuyNum);
//                System.out.println("数据已更改");

                //调用购物车的 removeItem()方法，从购物车中移除已购买的唇膏
                myCar.removeItem(name);
                session.setAttribute("myCar", myCar);
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('购买成功！');window.location='shopCar.jsp';</script>");

                return;
            }
        }
        response.sendRedirect("shopCar.jsp?username=username");
        return;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request, response);
    }
}