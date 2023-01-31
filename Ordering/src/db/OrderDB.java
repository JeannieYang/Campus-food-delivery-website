package db;

import com.sun.org.apache.xpath.internal.operations.Or;
import pojo.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.jar.JarOutputStream;

public class OrderDB extends DbConnFood {
    //在 OrderDB 中，创建方法 addOrder()，实现将订单信息插入数据库
    public int addOrder(Order order) {
        int result = 0;
        if (conn != null) {
            try {
                //调用父类构造方法创建的连接对象 conn 的 prepareStatement()方法创建PreparedStatement 对象
                PreparedStatement pst = conn.prepareStatement("insert into [order] values(?,?,?,?)");
                //通过 pst.setXxx(索引号，参数值)方法，给参数赋值
//                System.out.println(order.getOrderId().trim()+order.getUserId().trim()+new java.sql.Timestamp(order.getOrderTime().getTime())+order.getTotalPrice());
                pst.setString(1, order.getOrderId().trim());
                pst.setString(2, order.getUserId().trim());
//                将订单 Order 类中的 java.util.Date 类型属性转换为 java.sql.TimeStamp 类型
                pst.setTimestamp(3, new java.sql.Timestamp(order.getOrderTime().getTime()));
                pst.setFloat(4, order.getTotalPrice());
                //调用 executeUpdate()方法执行插入语句，返回影响的行数
                result = pst.executeUpdate();
            }
            catch(SQLException ex) {
                System.err.println(this.getClass()+ex.getMessage());
            }
        }
        return result;
    }
    public Order findOrder(String userName) {
        Order o = new Order();
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [order] where userId='" + userName + "'");
                while (rs.next()){
                    o.setOrderId(rs.getString(1));
                    o.setUserId(rs.getString(2));
                    o.setOrderTime(rs.getTime(3));
                    o.setTotalPrice(rs.getInt(4));
                }
//                System.out.println(o);
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return o;
    }
}
