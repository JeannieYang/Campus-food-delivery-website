package controller;

import db.ContactDB;
import db.OrderDB;
import db.RegisterDB;
import pojo.Order;
import pojo.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminServlet",urlPatterns = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        RegisterDB udb = new RegisterDB();
        boolean flag = udb.isAdmin(username);
//        System.out.println(flag);
//        System.out.println(flag == true);
        if(flag == true){
//            ContactDB cdb = new ContactDB();
//            session.setAttribute("cdb",cdb.findContact());
//            System.out.println(session.getAttribute("cdb"));

            request.getRequestDispatcher("/menuAd.jsp").forward(request, response);
        }else{
//            OrderDB o = new OrderDB();
//            Order order = o.findOrder(username);
//            session.setAttribute("o",order);
            request.getRequestDispatcher("/menu.jsp").forward(request, response);
        }
    }
}
