package controller;

import db.FoodDB;
import db.RegisterDB;
import pojo.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "FoodDisplayServlet",urlPatterns = "/FoodDisplayServlet")
public class FoodDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用 FoodDB 类的 selectFood()方法，从 lip 表中查询所有唇膏信息，
        //存入到 HashMap<String, food> food 中
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        FoodDB foodDb = new FoodDB();
        HashMap<String, Food> food = foodDb.selectFood();
        HashMap<String, Food> food1 = foodDb.selectFood1();
        HashMap<String, Food> food2 = foodDb.selectFood2();
        HashMap<String, Food> food3 = foodDb.selectFood3();
        HashMap<String, Food> food4 = foodDb.selectFood4();
        HashMap<String, Food> food5 = foodDb.selectFood5();
        HashMap<String, Food> food6 = foodDb.selectFood6();
        HashMap<String, Food> food7 = foodDb.selectFood7();
//        System.out.println(food);
//        System.out.println(food1);
//        System.out.println(food2);
//        System.out.println(food3);
//        System.out.println(food4);
//        System.out.println(food5);
//        System.out.println(food6);
//        System.out.println(food7);
        foodDb.close();
        //将 HashMap<String, food> food 对象存入 session
        session.setAttribute("food", food);
        session.setAttribute("food1", food1);
        session.setAttribute("food2", food2);
        session.setAttribute("food3", food3);
        session.setAttribute("food4", food4);
        session.setAttribute("food5", food5);
        session.setAttribute("food6", food6);
        session.setAttribute("food7", food7);

//        System.out.println(username);
        RegisterDB udb = new RegisterDB();
        //判断用户是管理员还是普通用户，如果flag=1那么就是管理员
        boolean flag = udb.isAdmin(username);
//        System.out.println(flag);
//        System.out.println(flag == true);
        if(flag == true){
            //将请求转发到 lipListAd.jsp 显示菜品信息
            response.sendRedirect("menuAd.jsp");
        }else{
            response.sendRedirect("menu.jsp");
        }
    }
}
