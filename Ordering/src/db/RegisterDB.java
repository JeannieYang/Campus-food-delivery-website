package db;

import pojo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegisterDB extends DbConnLogin {
    public int addUser(User user) {
        int result = 0;
        if (conn != null) {
            try {
                //调用父类构造方法创建的连接对象 conn 的 prepareStatement()方法创建PreparedStatement 对象
                PreparedStatement pst = conn.prepareStatement("insert into [user] values(?,?,?,?,?,?)");
                pst.setString(1, user.getUsername());
                pst.setString(2, user.getUserpwd());
                pst.setString(3, user.getPhone());
                pst.setString(4, user.getMail());
                pst.setString(5, user.getAddress());
                pst.setString(6, user.getIdentity());
                //调用 executeUpdate()方法执行插入语句，返回影响的行数
                result = pst.executeUpdate();
            }
            catch(SQLException ex) {
                System.err.println(this.getClass()+ex.getMessage());
            }
        }
        return result;
    }

    public boolean isAdmin(String userName) {
        boolean flag = false;
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [user] where userName='" + userName + "'");
                if (rs.next()) {
                    if(rs.getString(6).trim().equals("管理员")){
                        flag = true;
                    }else{
                        flag = false;
                    }
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
}
