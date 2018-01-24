/**
 * 管理员表的操作要求
 */
package com.dao;

import com.javabeen.AdminBeen;

public interface Admindao {
	
	// 管理员姓名name和密码password登录
	public int managerLogin(String name,String password);
	
	// 通过id更改管理员密码
	public boolean mupdatePassword(String name,String newPsw);
	
	// 通过管理员姓名获得管理员个人相关信息
	public AdminBeen getAdminByName(String mname);
	
	
}
