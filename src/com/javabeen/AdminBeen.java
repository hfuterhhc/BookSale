/**
 * 定义管理员的信息
 */
package com.javabeen;

public class AdminBeen {
	
	// 管理员编号
	private int AdminNo;
	// 管理员姓名
	private String Name;
	// 管理员密码
	private String PassWord;
		
	// 设置管理员编号
	public void setAdminNo(int AdminNo){
		this.AdminNo=AdminNo;
	}
	
	// 设置管理员姓名
	public void setName(String Name){
		this.Name=Name;
	}
	
	// 设置管理员密码
	public void setPassWord(String PassWord){
		this.PassWord=PassWord;
	}
	
	// 获取管理员编号
	public int getAdmin(){
		return AdminNo;
	}
	
	// 获取管理员姓名
	public String getName(){
		return Name;
	}

	// 获取管理员密码
	public String getPassWord(){
		return PassWord;
	}
}
