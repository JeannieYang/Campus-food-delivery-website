package db;

import pojo.Food;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BuyNumDB extends DbConnFood {
    int buyNum = 0;
    public int buyNum(ArrayList<Food> food) {
        if (conn != null) {
            try {
                for(int i=0;i<food.size();i++){
                    String name = food.get(i).getName();
                    int buyNum = food.get(i).getBuyNum();
                    int Num = food.get(i).getNum();
//                    System.out.println(name+buyNum);
                    //创建Statement对象
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select buyNum from [food] where name ='"+name+"'");
                    while (rs.next()){
                        buyNum += rs.getInt("buyNum");
//                        System.out.println(buyNum);
                        Num -= buyNum;
                    }
//                    System.out.println(buyNum);
                    PreparedStatement ps1 = conn.prepareStatement("update [food] set buyNum ='"+buyNum+"' where name ='"+name+"'");
                    PreparedStatement ps2 = conn.prepareStatement("update [food] set Num ='"+Num+"' where name ='"+name+"'");
                    ps1.executeUpdate();
                    ps2.executeUpdate();
//                    System.out.println("数据已更改");
                }
            }
            catch(SQLException ex) {
                System.err.println(ex.getMessage());
            }
        }
        return buyNum;
    }
}