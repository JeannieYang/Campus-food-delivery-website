package db;

import pojo.Address;
import java.sql.*;
import java.util.HashMap;

public class AddressDB extends DbConnLogin{
	public HashMap<String, Address> selectAddress() {
		HashMap<String, Address> addresses = new HashMap<String, Address>();
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();  //执行静态SQL语句
				ResultSet rs = stmt.executeQuery("select * from address");  //此处的address是数据库里面的表
				while (rs.next()) {
					Address address = new Address();
					address.setNo(rs.getString("No").trim());  //把每行信息取出来生成一个address
					address.setName(rs.getString("Name"));
					address.setSex(rs.getString("Sex"));
					address.setNumber(rs.getString("Number"));
					address.setProvince(rs.getString("Province"));
					address.setCity(rs.getString("City"));
					address.setArea(rs.getString("Area"));
					address.setDizhi(rs.getString("Dizhi"));
					addresses.put(address.getNo(), address);   //把address放到hashmap中 
				}
				rs.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return addresses;
	}

	public int addAddress(Address address) {
		int result = 0;
		if (conn != null) {
			try {
				PreparedStatement pst = conn.prepareStatement("insert into address(No,Name,Sex,Number,Province,City,Area,Dizhi) values(?,?,?,?,?,?,?,?)"); //把address对象的各个属性赋值给问号
				//pst.setString(1, address.getNo());
				pst.setInt(1, 2);
				pst.setString(2, address.getName());
				pst.setString(3, address.getSex());
				pst.setString(4, address.getNumber());
				pst.setString(5, address.getProvince());
				pst.setString(6, address.getCity());
				pst.setString(7, address.getArea());
				pst.setString(8, address.getDizhi());
				result = pst.executeUpdate();   
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	public int deleteAddress(String no) {
		int result = 0;
		if (conn != null) {
			try {
				PreparedStatement pst = conn.prepareStatement("delete from address where no=?");
				pst.setString(1, no);
				result = pst.executeUpdate();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
}
