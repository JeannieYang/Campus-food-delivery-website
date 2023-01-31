package db;

import pojo.Order;
import pojo.OrderDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class OrderDetailDB extends DbConnFood {
    public int addOrderDetail(ArrayList<OrderDetail> orderDetails) {
        int result = 0;
        if (conn != null) {
            try {
                //调用父类构造方法创建的连接对象 conn 的 prepareStatement()方法创建PreparedStatement 对象
                PreparedStatement pst1 = conn.prepareStatement("insert into [orderDetail] values(?,?,?,?)");
//                PreparedStatement pst2 = conn.prepareStatement("update [orderDetail] set buyNum where colorNo = '"+colorNo+"'");
                //通过循环将 SQL 语句加入到一个批次处理中
                for (int i=0;i<orderDetails.size();i++) {
                    //brand和colorNo是中文字符，写入数据库不成功，数据库中使用nvarchar就可以存入中文字符但nchar不可以
                    pst1.setString(1, orderDetails.get(i).getOrderId());
                    pst1.setString(2, orderDetails.get(i).getName());
                    pst1.setFloat(3, orderDetails.get(i).getNowPrice());
                    pst1.setInt(4, orderDetails.get(i).getBuyNum());
                    pst1.addBatch();
//                    result = pst.executeUpdate();//不用batch就用这个，batch效率高一点
                }
                //调用 executeBatch()方法一次性执行批处理中所有语句
                pst1.executeBatch();
            }
            catch(SQLException ex) {
                System.err.println(this.getClass()+ex.getMessage());
            }
        }
        return result;
    }
    public OrderDetail findOrder(String orderId) {
        OrderDetail od = new OrderDetail();
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [orderDetail] where orderId='" + orderId + "'");
                while (rs.next()){
                    od.setOrderId(rs.getString(1));
                    od.setName(rs.getString(2));
                    od.setNowPrice(rs.getFloat(3));
                    od.setBuyNum(rs.getInt(4));
                }
//                System.out.println(od);
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return od;
    }
}
