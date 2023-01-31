package controller;

import db.AddressDB;
import pojo.Address;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddressAddServlet",urlPatterns = "/AddressAddServlet")
public class AddressAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        AddressDB addressDb = new AddressDB();
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String number=request.getParameter("number");
        String province=request.getParameter("sheng");
        String city=request.getParameter("shi");
        String area=request.getParameter("qu");
        String dizhi=request.getParameter("dizhi");
        Address address = new Address();
        address.setName(name);
        address.setSex(sex);
        address.setNumber(number);
        address.setProvince(province);
        address.setCity(city);
        address.setArea(area);
        address.setDizhi(dizhi);
        addressDb.addAddress(address);
        addressDb.close();
        request.getRequestDispatcher("AddressDisplayServlet").forward(request, response);
    }
}