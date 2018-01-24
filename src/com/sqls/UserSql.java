/**
 * 对用户表的操作要求的具体实现
 */
package com.sqls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.dao.Userdao;
import com.javabeen.UserBeen;
import com.util.conndb;


public class UserSql implements Userdao {
	
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
		
	// 用户注册
	public boolean registerUser(UserBeen User){
		boolean flag = false;
		conn = conndb.getConn();
		try {
			psta = conn.prepareStatement("insert into UserTable(E_mail,IDName,Password,TrueName,Sex,Telephone,Address) values(?,?,?,?,?,?,?)");
			psta.setString(1, User.getE_mail());
			psta.setString(2, User.getIDName());
			psta.setString(3, User.getPassWord());
			psta.setString(4, User.getTrueName());
			psta.setString(5, User.getSex());
			psta.setString(6, User.getTelephone());
			psta.setString(7, User.getAddress());
			int n = psta.executeUpdate();
			if (n > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.close();
		return flag;
	}
	
		
	// 用户修改信息
	public boolean updateUser(String E_mail,UserBeen user){
		boolean flag = false;
		conn = conndb.getConn();
		try {
			psta = conn.prepareStatement("update UserTable set E_mail=?, IDName=?,Password=?,TrueName=?,Sex=?,Telephone=?,Address=? where E_mail=?");
			psta.setString(1, user.getE_mail());
			psta.setString(2, user.getIDName());
			psta.setString(3, user.getPassWord());
			psta.setString(4, user.getTrueName());
			psta.setString(5, user.getSex());
			psta.setString(6, user.getTelephone());
			psta.setString(7, user.getAddress());
			psta.setString(8, E_mail);
			int n = psta.executeUpdate();
			if (n > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.close();
		return flag;
	}
		
	// 通过管理员姓名获得管理员个人相关信息
	public UserBeen getUserByE_mail(String E_mail){
		UserBeen user = new UserBeen();
		conn = conndb.getConn();
		try {
			psta = conn.prepareStatement("select * from UserTable where E_mail=?");
			psta.setString(1, E_mail);
			rs = psta.executeQuery();
			if (rs.next()) {
				user.setE_mail(rs.getString("E_mail"));
				user.setIDName(rs.getString("IDName"));
				user.setPassWord(rs.getString("PassWord"));
				user.setSex(rs.getString("Sex"));
				user.setTelephone(rs.getString("Telephone"));
				user.setAddress(rs.getString("Address"));
		        user.setTrueName(rs.getString("TrueName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.close();
		return user;
	}
		

	// 登录
	public int UserBeenLogin(String E_mail, String epassword){
		// n的值：1代表登录成功，2代表密码错误，3代表用户名不存在
		int n = 0;
		conn = conndb.getConn();
		try {
			psta = conn.prepareStatement("select Password from UserTable where E_mail=?");
			psta.setString(1, E_mail);
			// 执行查询返回的结果
			rs = psta.executeQuery();
			// 进行核对是否为合法用户
			if(rs.next()){
				if(epassword.equals(rs.getString("Password"))){
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
		this.close();
		return n;
	}
  
}
