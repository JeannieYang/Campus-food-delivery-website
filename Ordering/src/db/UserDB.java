package db;

import pojo.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDB extends DbConnLogin {
    //子类 UserDB 没有定义构造方法，则创建子类对象时调用父类 DbConn 的
    //无参数的构造方法，即完成建立数据库连接操作

    //从 user 表查询用户名为 userName、密码为 userPwd 的信息，如果查到则返回
    //true，否则返回 false
    public boolean isLogin(String userName, String userPwd) {
        User u = null;
        boolean flag = false;
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [user] where userName='" + userName + "' and userPwd='" + userPwd + "'");
//                System.out.println(rs);
                if (rs.next()) {
                    flag = true;
//                    System.out.println("登录成功");
                } else {
                    flag = false;
                    System.out.println("密码输入错误");
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    public boolean isExist(String userName) {
        boolean flag = false;
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [user] where userName='" + userName + "'");
                if (rs.next()) {
                    flag = true;
//                    System.out.println("用户存在");
                }
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    public User findInfo(String userName) {
        boolean flag = false;
        User u = new User();
        if (conn != null) {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from [user] where userName='" + userName + "'");
                while (rs.next()){
                    u.setUsername(rs.getString(1));
                    u.setUserpwd(rs.getString(2));
                    u.setPhone(rs.getString(3));
                    u.setMail(rs.getString(4));
                    u.setAddress(rs.getString(5));
                    u.setIdentity(rs.getString(6));
                }
                System.out.println(u);
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return u;
    }

    public void changePwd(String username,String password) {
        if (conn != null) {
            try {
//                System.out.println(password+username);
                PreparedStatement ps1 = conn.prepareStatement("update [user] set userPwd ='"+password+"' where userName ='"+username+"'");
                ps1.executeUpdate();
//                System.out.println("数据已更改");
            }catch(SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
    }
}