package controller;

import db.AddressDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddressDeleteServlet",urlPatterns = "/AddressDeleteServlet")
public class AddressDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("No");
        AddressDB addressDb=new AddressDB();
        addressDb.deleteAddress(no);
        addressDb.close();
        request.getRequestDispatcher("AddressDisplayServlet").forward(request, response);
    }
}
