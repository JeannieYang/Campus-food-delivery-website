package controller;


import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import db.RegisterDB;
import pojo.Food;
import pojo.User;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterAdminServlet",urlPatterns = "/RegisterAdminServlet")
public class RegisterAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServletConfig config;
    //初始化 Servlet
    final public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SmartUpload upload = new SmartUpload();
        //利用 config、request、response 对象初始化 SmartUpload 对象
        upload.initialize(config,request,response);
        //设置字符编码为 utf-8，使得 SmartUpload 能处理中文
        upload.setCharset("utf-8");
        //设置允许上传的文件类型（扩展名）
        upload.setAllowedFilesList("jpg,jpeg,bmp,png");
        try {
            //文件上传
            upload.upload();
            //文件存储到服务器端与当前文件同级的 images 子文件夹中
            upload.save("images");
        }catch (SmartUploadException e) {
            System.out.println(e.getMessage());
        }

        request.setCharacterEncoding("UTF-8");
        User u = new User();
        u.setUsername(upload.getRequest().getParameter("username1"));
        u.setUserpwd(upload.getRequest().getParameter("userpwd1"));
        u.setPhone(upload.getRequest().getParameter("phone1"));
        u.setMail(upload.getRequest().getParameter("mail1"));
        u.setAddress(upload.getRequest().getParameter("address1"));
        u.setIdentity("管理员");
        RegisterDB rdb = new RegisterDB();
        rdb.addUser(u);
//        System.out.println("注册成功！");
        response.sendRedirect("index.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
