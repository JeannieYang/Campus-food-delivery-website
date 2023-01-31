package controller;

import db.OrderDB;
import db.UserDB;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "changePwdServlet",urlPatterns = "/changePwdServlet")
public class changePwdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        User u = (User)session.getAttribute("user");
//        System.out.println(u);
        String password = request.getParameter("origin");
        String npassword = request.getParameter("new");
//        System.out.println(password+npassword);
        OrderDB o = new OrderDB();
        UserDB udb = new UserDB();
//        System.out.println(o.findOrder(u.getUsername()));
//        System.out.println(u.getUserpwd()+password);
//        System.out.println(u.getUserpwd().equals(password));
        if(u.getUserpwd().equals(password)) {
            udb.changePwd(u.getUsername(),npassword);
            out.print("<script language='javascript'>alert('修改成功！')</script>");
            out.print("<script>window.location.href='personal.jsp'</script>");
        }else{
            out.print("<script language='javascript'>alert('原密码不正确，请重新输入！')</script>");
            out.print("<script>window.location.href='personal.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
