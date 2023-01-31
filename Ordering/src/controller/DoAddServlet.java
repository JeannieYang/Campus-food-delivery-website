package controller;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import db.FoodDB;
import pojo.Food;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DoAddServlet",urlPatterns = "/DoAddServlet")
public class DoAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServletConfig config;
    //初始化 Servlet
    final public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            SmartUpload upload = new SmartUpload();
            //利用 config、request、response 对象初始化 SmartUpload 对象
            upload.initialize(config,request,response);
            //设置字符编码为 utf-8，使得 SmartUpload 能处理中文
            upload.setCharset("utf-8");
            //设置允许上传的文件类型（扩展名）
            upload.setAllowedFilesList("jpg,jpeg,bmp,png,PNG");
            try {
                //文件上传
                upload.upload();
                //文件存储到服务器端与当前文件同级的 images 子文件夹中
                upload.save("images");
            }catch (SmartUploadException e) {
                System.out.println(e.getMessage());
            }
            //获取 lipAdd.jsp中表单输入的信息，因表单提交为二进制形式，
            //故不能使用request.getParameter()取得表单输入域的值
            String name = upload.getRequest().getParameter("name1");
            String intro = upload.getRequest().getParameter("intro1");
            String price = upload.getRequest().getParameter("price1");
            String num = upload.getRequest().getParameter("num1");
            String type = upload.getRequest().getParameter("type1");
            File file = upload.getFiles().getFile(0);

            Food f = new Food();
            f.setName(name);
            f.setIntro(intro);
            f.setBuyNum(0);

            //获取menuAd.jsp中表单输入的库存数
            //如upload.getRequest().getParameter("bookNum")返回值类型为String，
            //需通过 Integer.parseInt(bookNum)将其转换为 int
            int Num;
            if (num == null || num.trim().equals(""))
                Num = 0;
            else
                Num = Integer.parseInt(num);
            float oPrice;
            int type1;
            if (price == null || price.trim().equals(""))
                oPrice = 0;
            else
                oPrice = Float.parseFloat(price);
            if (type == null || type.trim().equals(""))
                type1 = 0;
            else
                type1 = Integer.parseInt(type);
            f.setNum(Num);
            f.setPrice(oPrice);
            f.setType(type1);
            int ziFuShu = 4;
            String pic = file.getFileName();//将文件中读取到文件类型去掉，只把文件名传递给pic
            f.setPic(pic.substring(0,pic.length()-ziFuShu));
//        System.out.println(lip.getPic());//检验购物车中的路径是否正确
            FoodDB foodDb = new FoodDB();
            foodDb.addFood(f);
            foodDb.close();

            response.sendRedirect("FoodDisplayServlet");
    }
}
