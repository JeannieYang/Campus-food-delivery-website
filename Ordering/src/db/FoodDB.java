package db;

import pojo.Food;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class FoodDB extends DbConnFood {
    public HashMap<String, Food> selectFood() {
        HashMap<String, Food> food = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs = stmt.executeQuery("select * from food");
                //循环遍历 ResultSet 中每一行
                while (rs.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs.getString("name").trim());
                    f.setIntro(rs.getString("intro").trim());
                    f.setPrice(rs.getFloat("price"));
                    f.setNum(rs.getInt("num"));
                    f.setBuyNum(rs.getInt("buyNum"));
                    f.setPic(rs.getString("pic").trim());
                    f.setType(rs.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food.put(f.getName(), f);
                }
                rs.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food;
    }
    public HashMap<String, Food> selectFood1() {
        HashMap<String, Food> food1 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs1 = stmt.executeQuery("select * from food where type='1'");
                //循环遍历 ResultSet 中每一行
                while (rs1.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs1.getString("name").trim());
                    f.setIntro(rs1.getString("intro").trim());
                    f.setPrice(rs1.getFloat("price"));
                    f.setNum(rs1.getInt("num"));
                    f.setBuyNum(rs1.getInt("buyNum"));
                    f.setPic(rs1.getString("pic").trim());
                    f.setType(rs1.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food1.put(f.getName(), f);
                }
                rs1.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food1;
    }
    public HashMap<String, Food> selectFood2() {
        HashMap<String, Food> food2 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs2 = stmt.executeQuery("select * from food where type='2'");
                while (rs2.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs2.getString("name").trim());
                    f.setIntro(rs2.getString("intro").trim());
                    f.setPrice(rs2.getFloat("price"));
                    f.setNum(rs2.getInt("num"));
                    f.setBuyNum(rs2.getInt("buyNum"));
                    f.setPic(rs2.getString("pic").trim());
                    f.setType(rs2.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food2.put(f.getName(), f);
                }
                rs2.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food2;
    }
    public HashMap<String, Food> selectFood3() {
        HashMap<String, Food> food3 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs3 = stmt.executeQuery("select * from food where type='3'");
                while (rs3.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs3.getString("name").trim());
                    f.setIntro(rs3.getString("intro").trim());
                    f.setPrice(rs3.getFloat("price"));
                    f.setNum(rs3.getInt("num"));
                    f.setBuyNum(rs3.getInt("buyNum"));
                    f.setPic(rs3.getString("pic").trim());
                    f.setType(rs3.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food3.put(f.getName(), f);
                }
                rs3.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food3;
    }
    public HashMap<String, Food> selectFood4() {
        HashMap<String, Food> food4 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs4 = stmt.executeQuery("select * from food where type='4'");
                while (rs4.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs4.getString("name").trim());
                    f.setIntro(rs4.getString("intro").trim());
                    f.setPrice(rs4.getFloat("price"));
                    f.setNum(rs4.getInt("num"));
                    f.setBuyNum(rs4.getInt("buyNum"));
                    f.setPic(rs4.getString("pic").trim());
                    f.setType(rs4.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food4.put(f.getName(), f);
                }
                rs4.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food4;
    }
    public HashMap<String, Food> selectFood5() {
        HashMap<String, Food> food5 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs5 = stmt.executeQuery("select * from food where type='5'");
                while (rs5.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs5.getString("name").trim());
                    f.setIntro(rs5.getString("intro").trim());
                    f.setPrice(rs5.getFloat("price"));
                    f.setNum(rs5.getInt("num"));
                    f.setBuyNum(rs5.getInt("buyNum"));
                    f.setPic(rs5.getString("pic").trim());
                    f.setType(rs5.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food5.put(f.getName(), f);
                }
                rs5.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food5;
    }
    public HashMap<String, Food> selectFood6() {
        HashMap<String, Food> food6 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs6 = stmt.executeQuery("select * from food where type='6'");
                while (rs6.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs6.getString("name").trim());
                    f.setIntro(rs6.getString("intro").trim());
                    f.setPrice(rs6.getFloat("price"));
                    f.setNum(rs6.getInt("num"));
                    f.setBuyNum(rs6.getInt("buyNum"));
                    f.setPic(rs6.getString("pic").trim());
                    f.setType(rs6.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food6.put(f.getName(), f);
                }
                rs6.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food6;
    }
    public HashMap<String, Food> selectFood7() {
        HashMap<String, Food> food7 = new HashMap<String, Food>();
        if (conn != null) {
            try {
                //创建Statement对象
                Statement stmt = conn.createStatement();
                //调用 executeQuery()方法执行查询语句，返回查询结果集 ResultSet 对象
                ResultSet rs7 = stmt.executeQuery("select * from food where type='7'");
                while (rs7.next()) {
                    Food f = new Food();
                    //通过 rs.getXxx(列名)方法，取得每一列的值，赋给 lip 成员变量
                    f.setName(rs7.getString("name").trim());
                    f.setIntro(rs7.getString("intro").trim());
                    f.setPrice(rs7.getFloat("price"));
                    f.setNum(rs7.getInt("num"));
                    f.setBuyNum(rs7.getInt("buyNum"));
                    f.setPic(rs7.getString("pic").trim());
                    f.setType(rs7.getInt("type"));
                    //单种food信息加入到 HashMap<String,food> food 食物列表中
                    food7.put(f.getName(), f);
                }
                rs7.close();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return food7;
    }

    public int addFood(Food f) {
        int result = 0;
        if (conn != null) {
            try {
                //为 insert 语句创建 PreparedStatement 对象
                PreparedStatement pst = conn.prepareStatement("insert into food values(?,?,?,?,?,?,?)");
                //通过 pst.setXxx()方法逐个给 PreparedStatement 对象的参数赋值
                pst.setString(1, f.getName());
                pst.setString(2, f.getIntro());
                pst.setFloat(3, f.getPrice());
                pst.setInt(4, f.getNum());
                pst.setInt(5, f.getBuyNum());
                pst.setString(6, f.getPic());
                pst.setInt(7, f.getType());
                //调用 executeUpdate()执行非查询 SQL 语句
                result = pst.executeUpdate();
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return result;
    }
}