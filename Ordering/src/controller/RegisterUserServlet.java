package controller;

import db.RegisterDB;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterUserServlet",urlPatterns = "/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User u = new User();
        u.setUsername(request.getParameter("username"));
        u.setUserpwd(request.getParameter("userpwd"));
        u.setPhone(request.getParameter("phone"));
        u.setMail((request.getParameter("mail")));
        u.setAddress(request.getParameter("address"));
        u.setIdentity("用户");
        RegisterDB rdb = new RegisterDB();
        rdb.addUser(u);
//        System.out.println("注册成功！");
        response.sendRedirect("index.jsp");
    }
}
