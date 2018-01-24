/**
 * 对用户表的操作要求
 */
package com.dao;

import com.javabeen.UserBeen;

public interface Userdao {
	
	// 用户注册
	public boolean registerUser(UserBeen User);
		
	// 用户修改信息
	public boolean updateUser(String E_mail,UserBeen user);
		
	// 通过用户E_mail获得用户个人相关信息
	public UserBeen getUserByE_mail(String E_mail);
		
	// 登录
	public int UserBeenLogin(String E_mail, String epassword);

}
