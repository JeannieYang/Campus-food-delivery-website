package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DbConnFood {
    private String sDBDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String sConnStr = "jdbc:sqlserver://localhost:1433;DatabaseName=takeout";
    private String sUsername="sa",sPassword="123456";
    public Connection conn = null;

    public DbConnFood() {
//        System.out.println("连接数据库");//检验是否连接了数据库
//        Connection con = null;
//        //其中参数 sDBDriver 为数据库 JDBC 驱动程序名，sConnStr 为数据库连
//        //接 URL，sUsername 为数据库用户名，sPassword 为数据库密码
//        try {
//            //加载驱动程序
//            Class.forName(sDBDriver);
////            System.out.println("加载驱动程序");
//            //建立数据库连接对象
//            con = DriverManager.getConnection(sConnStr,sUsername,sPassword);
////            System.out.println("建立数据库连接对象");
//            //如果连接成功 控制台输出Connection Successful！
//            System.out.println("Connection Successful!");
//        }catch (java.lang.ClassNotFoundException e) {
//            System.out.println(e.getMessage());
//        }catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//        this.conn = con;
        Connection con = null;
        try {
            //Context 对象表示 JNDI 共享目录，实现类为 InitailContext，在javax.naming 包中
            //JNDI:JNDI（Java Naming and Directory Interface），Java命名和目录接口。
            // JNDI的作用是：在服务器上配置资源，然后通过统一的方式来获取配置的资源。如果配置的资源是连接池，这样项目中就可以通过统一的方式来获取连接池对象了

            //根据"java:组件/环境/JNDI 共享名"获得 JNDI 对象
            //调用数据源 DataSource 对象的 getConnection()获得与数据库的连接。DataSource 在 javax.sql 包中
            //数据库连接对象的管理，由连接池自动进行
            Context ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/takeout");
            con = ds.getConnection();
            if (con == null) System.out.println("connection is null");
        }
        catch (Exception e) {
            String log ="Proc " + this.getClass() + " connection failure:\r\n"+e.getMessage()+"\r\n";
            System.out.println(log);
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