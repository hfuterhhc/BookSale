package com.util;

import java.sql.Connection;

public class conndb {
	// 实例化 
	private static Connpool cp = new Connpool(); 
	
	// 连接数据库
	public static Connection getConn(){
		return cp.get();
	}
	
}
