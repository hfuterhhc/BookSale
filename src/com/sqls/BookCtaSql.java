/**
 * 书分类表的操作要求的具体实现
 */
package com.sqls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dao.BookCtadao;
import com.javabeen.BookCtable;
import com.util.conndb;

public class BookCtaSql implements BookCtadao {
	//连接实例
		Connection conn = null;
		//执行动态SQL语句PreparedStatement实例
		PreparedStatement psta = null;
		//执行查询返回结果
		ResultSet  rs = null;
		
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
			
		//查找所有图书分类
		public ArrayList<BookCtable> getAllBookC(){
			ArrayList<BookCtable> BookCList = new  ArrayList<BookCtable>();
			conn = conndb.getConn();
			try {
				psta=conn.prepareStatement("select * from BookCTable");
				rs = psta.executeQuery();
				while(rs.next()){
					BookCtable bookc = new BookCtable();
					bookc.setCID(rs.getInt("CID"));
					bookc.setCName(rs.getString("CName"));
					System.out.print(bookc.getCID());
					BookCList.add(bookc);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			this.close();
			return BookCList; 
		}
		
		//查看图书分类通过分类编号
		public BookCtable getBookCByCID(int CID){
			BookCtable bookc = new BookCtable();
			conn = conndb.getConn();
			try {
				psta=conn.prepareStatement("select * from BookCTable where CID=?");
				psta.setInt(1, CID);
				rs = psta.executeQuery();
				if(rs.next()){
					bookc.setCID(rs.getInt("CID"));
					bookc.setCName(rs.getString("CName"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			this.close();
			return bookc; 
		}
		
		//添加图书分类
		public boolean insertBookC(BookCtable bookc){
			boolean flag = false;
			conn = conndb.getConn();
			try {
				psta=conn.prepareStatement("insert into BookCTable(CID,CName) values(?,?)");
				psta.setInt(1, bookc.getCID());
				psta.setString(2, bookc.getCName());
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
		
		//更新-修改图书分类
		public boolean updateBookC(int CID,BookCtable bookc){
			boolean flag = false;
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("update BookCTable set CName=? where CID=?");
				psta.setInt(1, bookc.getCID());
				psta.setString(2, bookc.getCName());
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
		
		//删除图书分类
		public boolean deleteBookC(int CID){
			boolean flag = false;
			conn = conndb.getConn();
			try {
				psta=conn.prepareStatement("update BookCTable set BookCStatus=0 where CID=?");
				psta.setInt(1,CID);
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
}
