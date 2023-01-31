package controller;

import db.AddressDB;
import pojo.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "AddressDisplayServlet",urlPatterns = "/AddressDisplayServlet")
public class AddressDisplayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AddressDB addressDb=new AddressDB();
        HashMap<String, Address> addresses=addressDb.selectAddress(); //把数据库的内容取出赋值给addresses
        addressDb.close();
        HttpSession session = request.getSession();
        session.setAttribute("addresses", addresses);
        request.getRequestDispatcher("ManageAddress.jsp").forward(request, response);
    }
}
