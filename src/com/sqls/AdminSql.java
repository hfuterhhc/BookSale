/**
 * 管理员表的操作要求的具体实现
 */
package com.sqls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.dao.Admindao;
import com.javabeen.AdminBeen;
import com.util.conndb;

public class AdminSql implements Admindao {
	
	// 连接实例
	Connection conn = null;
	// 执行动态SQL语句PreparedStatement实例
	PreparedStatement psta = null;
	// 执行查询返回的结果
	ResultSet rs = null;
	
	// 关闭数据库
	public void close(){
		try{
			// 关闭记录集     
		    if(rs!=null){
				rs.close();
			}
		    // 关闭声明  
			if(psta!=null){
				psta.close();
			}
			// 关闭连接对象 
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	
	
	// 管理员姓名name和密码password登录
	public int managerLogin(String name,String password){
		// n的值：1代表登录成功，2代表密码错误，3代表用户名不存在
		int n = 0;
		// 获得连接数据库返回的连接对象
		conn = conndb.getConn();
		try {
			// 执行动态SQL语句PreparedStatement实例
			psta=conn.prepareStatement("select Password from AdminTable where Name=?");
			// 设置执行语句第一个变量为name
			psta.setString(1, name);
			// 执行查询返回的结果
			rs = psta.executeQuery();
			// 进行核对是否为合法用户
			if(rs.next()){
				if(password.equals(rs.getString("Password"))){
					n=1;
				}else{
					n=2;
				}
			}else{
				n=3;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return  n;
	}
	
	// 通过id更改管理员密码
	public boolean mupdatePassword(String name,String newPsw){
		boolean flag = false;
		conn = conndb.getConn();
		try{
			psta=conn.prepareStatement("update AdminTable set Password=? where Name=?");
			psta.setString(1, newPsw);
			psta.setString(2, name);
			int n = psta.executeUpdate();
			if(n>0){
				flag = true; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.close();
		return flag;
	}
	
	// 通过管理员姓名获得管理员
	public AdminBeen getAdminByName(String name){
		AdminBeen admin = new AdminBeen();
		conn = conndb.getConn();
		try {
			psta=conn.prepareStatement("select * from AdminTable where Name=?");
			psta.setString(1, name);
			rs = psta.executeQuery();
			if(rs.next()){
				admin.setAdminNo(rs.getInt("AdminNo"));
				admin.setName(rs.getString("Name"));
				admin.setPassWord(rs.getString("Password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.close();
		return admin;
	}
}
