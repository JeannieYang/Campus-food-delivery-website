package controller;

import db.OrderDB;
import db.UserDB;
import pojo.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //通过 HttpServletRequest 类型的 request 取得参数 username 的值
        String username = request.getParameter("username");
//        System.out.println(username);
        String password = request.getParameter("password");
        String userVCode = request.getParameter("userVCode");
//        System.out.println(username+password+userVCode);//检验参数是否传递正确
        //通过 HttpServletRequest 类型的 request 取得 session 对象
        HttpSession session = request.getSession();
        //从ValidateServlet中设置的session中找到正确的验证码
        String validateCode = (String) session.getAttribute("validateCode");
//        System.out.println(validateCode);//检验是否得到正确的验证码

//        System.out.println(username);
        UserDB userDB = new UserDB();
//        System.out.println(userDB.findInfo(username));
        session.setAttribute("user",userDB.findInfo(username));
//        System.out.println(username);
        if (!userDB.isExist(username)) {
            response.sendRedirect("login.jsp?error=noExist");
        } else if (userVCode.equalsIgnoreCase(validateCode)) {
//            System.out.println("验证码正确！");//检验下面代码是否执行
            //调用 UserDB 的 isLogin()方法
            if (userDB.isLogin(username, password)) {
                session.setAttribute("isLogin", "true");
                session.setAttribute("username", username);
//                session.setAttribute("password",password);
                response.sendRedirect("FoodDisplayServlet");
            } else {
                response.sendRedirect("login.jsp?error=yes");
            }
        } else {
            //验证码输入不正确时，向浏览器输出 js 脚本，给出错误提示，并后退到登录页面
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('验证码输入错误！');history.go(-1);</script>");
        }
        userDB.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request, response);
    }
}