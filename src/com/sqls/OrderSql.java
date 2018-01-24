/**
 * 对订单表的操作要求的具体实现
 */
package com.sqls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.dao.Orderdao;
import com.javabeen.BookBeen;
import com.javabeen.OrderBeen;
import com.util.conndb;

public class OrderSql implements Orderdao {
	//连接实例
	Connection conn = null;
	
	//执行动态SQL语句PreparedStatement实例
	PreparedStatement psta = null;
	
	//执行查询返回结果
	ResultSet  rs = null;
			
	public void close(){
		try{
		//关闭记录集
		if(rs != null){
			rs.close();
		}
		//关闭申明
		if(psta != null){
			psta.close();
		}
		//关闭连接
		if(conn != null){
			conn.close();
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
		
	//查看所有订单
	public ArrayList<OrderBeen> getALlOrder(){
		ArrayList<OrderBeen> OrderList = new ArrayList<OrderBeen>() ;
		conn = conndb.getConn();
		try{
			psta = conn.prepareStatement("select *from OrderTable where OrderID =?");
			rs = psta.executeQuery();
			while(rs.next()){
				OrderBeen order = new OrderBeen();
				order.setOrderQuantity(rs.getInt("OrderQuantity"));
				order.setE_mail(rs.getString("E_mail"));
				order.setISBN(rs.getString("ISBN"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setTotalAmount(rs.getFloat("TotalAmount")); // 总订单金额
				OrderList.add(order);
			}
		}catch(SQLException e){
			e.printStackTrace();	
		}
		this.close();
			return OrderList;
	}
				
	    //修改订单
	    public boolean updateOrder(OrderBeen order){
			boolean flag = false;
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("update OrderTable set OrderDate=?,E_mail=?,ISBN=?,OrderQuantity=? where OrderID=?");
		
				psta.setString(1, order.getOrderDate());
				psta.setString(2, order.getE_mail());
				//psta.setFloat(4, order.getTotalAmount());
				psta.setString(3, order.getISBN());
				psta.setInt(4, order.getOrderQuantity());
				psta.setInt(5, order.getOrderID());
				int n = psta.executeUpdate();
				if(n > 0){
					flag = true;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			this.close();
			return flag;
		}
				
		//通过orderID删除订单
		public boolean deleteOrder(int orderID){
			boolean flag = false;
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("delete from OrderTable where OrderID=?");
				psta.setInt(1, orderID);
				int n = psta.executeUpdate();
				if(n > 0){
					flag = true;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			this.close();
			return flag;
		}
		
		//增加订单
		public void intsertOrder(String E_mail,BookBeen book,int shuliang){
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("insert into OrderTable(OrderID,OrderDate,E_mail,TotalAmount,ISBN,OrderQuantity, OrderStatus) values(?,?,?,?,?,?,?)");
				
				psta.setInt(1,new Date().getSeconds()+new Date().getMinutes()*10+new Date().getHours()*100+new Date().getDay()*10000 );
				psta.setDate(2, new java.sql.Date(new Date().getTime()));
				psta.setString(3, E_mail);
				psta.setFloat(4, (float)book.getBookPrice()*shuliang);
				psta.setString(5, book.getISBN());
				psta.setInt(6, shuliang);
				psta.setString(7, "未处理");
				int n = psta.executeUpdate();
				if(n > 0){
				   System.out.println("ceshi");
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			
		
		}
		
}
