package db;

import pojo.Contact;
import pojo.Food;
import pojo.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;

public class ContactDB extends DbConnFood {
    public int addContact(String name,String mail,String info) {
        int result = 0;
        if (conn != null) {
            try {
                //调用父类构造方法创建的连接对象 conn 的 prepareStatement()方法创建PreparedStatement 对象
                PreparedStatement pst = conn.prepareStatement("insert into [help] values(?,?,?)");
//                System.out.println(name+mail+info);
                //通过 pst.setXxx(索引号，参数值)方法，给参数赋值
                pst.setString(1, name);
                pst.setString(2, mail);
//                将订单 Order 类中的 java.util.Date 类型属性转换为 java.sql.TimeStamp 类型
                pst.setString(3, info);
                //调用 executeUpdate()方法执行插入语句，返回影响的行数
                result = pst.executeUpdate();
//                System.out.println("信息添加成功！");
            }
            catch(SQLException ex) {
                System.err.println(this.getClass()+ex.getMessage());
            }
        }
        return result;
    }
    public LinkedList<Contact> findContact() {
        LinkedList<Contact> con = new LinkedList<Contact>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs = stmt.executeQuery("select * from help");
                //循环遍历 ResultSet 中每一行
                while (rs.next()) {
                    Contact c = new Contact();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    c.setName(rs.getString(1));
                    c.setMail(rs.getString(2));
                    c.setInfo(rs.getString(3));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    con.add(c);
                }
                rs.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return con;
    }
}
