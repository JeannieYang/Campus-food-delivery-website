package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnLogin {
    private String sDBDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String sConnStr = "jdbc:sqlserver://localhost:1433;DatabaseName=takeout";
    private String sUsername="sa",sPassword="123456";
    public Connection conn = null;

    public DbConnLogin() {
//        System.out.println("连接数据库");//检验是否连接了数据库
        Connection con = null;
            //其中参数 sDBDriver 为数据库 JDBC 驱动程序名，sConnStr 为数据库连
            //接 URL，sUsername 为数据库用户名，sPassword 为数据库密码
        try {
            //加载驱动程序
            Class.forName(sDBDriver);
//            System.out.println("加载驱动程序");
            //建立数据库连接对象
            con = DriverManager.getConnection(sConnStr,sUsername,sPassword);
//            System.out.println("建立数据库连接对象");
            //如果连接成功 控制台输出Connection Successful！
            System.out.println("Connection Successful!");
        }catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        this.conn = con;
    }
    public void close(){
        try{
            if (conn!=null) conn.close();
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}