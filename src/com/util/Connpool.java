package com.util;

import java.sql.*;
public class Connpool {
	
	// 数据库账号		
	private String username  = "sa";
	// 数据库密码
	private String password = "hhc199611";
	// 套接字
	private String url = "jdbc:sqlserver://localhost:1433;DatabaseName=booksale";
	// 驱动
	private static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	// 连接
	static{
		try{
			// 驱动
			Class.forName(driverName);
			System.out.println("成功");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public Connection get(){
		Connection conn=null;
		try{
			// 获取conn
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("获取Conn成功");
		}catch(SQLException e){
		  e.printStackTrace();
		}
		return conn;
	}
	
}

