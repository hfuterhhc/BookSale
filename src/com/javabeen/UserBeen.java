/**
* 定义用户的信息
*/
package com.javabeen;

public class UserBeen {
	// 用户E_mail
	private String E_mail;
	// 用户姓名
	private String IDName;
	// 用户密码
	private String PassWord;
	// 用户真实姓名
	private String TrueName;
	// 用户性别
	private String Sex;
	// 用户联系电话
	private String Telephone;
	// 用户家庭住址
	private String Address;
		
	// 设置用户E_mail
	public void setE_mail(String E_mail){
		this.E_mail=E_mail;
	}
		
	// 设置用户姓名
	public void setIDName(String IDName){
		this.IDName=IDName;
	}
		
	// 设置用户密码
	public void setPassWord(String PassWord){
		this.PassWord=PassWord;
	}
		
	// 设置用户性别
	public void setSex(String Sex){
		
		 try {
	            byte b[]=Sex.getBytes("UTF-8");
		        this.Sex=new String(b);
	        }
		    catch(Exception e){}
	}
		
	// 设置用户联系电话
	public void setTelephone(String Telephone){
		this.Telephone=Telephone;
	}
		
	// 设置用户家庭住址
	public void setAddress(String Address){
		this.Address=Address;
	}
		
	// 设置用户真实姓名
	public void setTrueName(String TrueName){
		this.TrueName=TrueName;
	}
		
	// 获取用户E_mail
	public String getE_mail(){
		return E_mail;
	}
		
	// 获取用户ID姓名
	public String getIDName(){
		return IDName;
	}

	// 获取用户密码
	public String getPassWord(){
		return PassWord;
	}
		
	// 获取用户真实姓名
	public String getTrueName(){
		return TrueName;
	}
		
	// 获取用户性别
	public String getSex(){
		return Sex;
	}
		
	// 获取用户联系电话
	public String getTelephone(){
		return Telephone;
	}
		
	// 获取用户家庭住址
	public String getAddress(){
		return Address;
	}
}
