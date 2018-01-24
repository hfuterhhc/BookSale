/**
 * 对订单表的操作要求
 */
package com.dao;

import java.util.ArrayList;

import com.javabeen.BookBeen;
import com.javabeen.OrderBeen;

public interface Orderdao {
	
	
	//查看所有订单
	public ArrayList<OrderBeen> getALlOrder();
		
	//修改订单
	public boolean updateOrder(OrderBeen order);
		
	//通过orderID删除订单
	public boolean deleteOrder(int orderID);
	
	//增加订单
	public void intsertOrder(String E_mail,BookBeen book,int Amount);
	
}
