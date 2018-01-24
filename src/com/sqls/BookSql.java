/**
 * 书表的操作要求的具体实现
 */
package com.sqls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.dao.Bookdao;
import com.javabeen.BookBeen;
import com.util.conndb;

public class BookSql implements Bookdao {
	//连接实例
		Connection conn = null;
		//执行动态SQL语句PreparedStatement实例
		PreparedStatement psta = null;
		//查询的执行结果
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
				
		//查找图书通过ISBN
		public BookBeen getBookByISBN(String ISBN){
			BookBeen book = new BookBeen();
			conn = conndb.getConn();
			try{
			psta = conn.prepareStatement("select * from BookTable where ISBN=?");
			psta.setString(1, ISBN);
			rs = psta.executeQuery();
			if(rs.next()){
				book.setAuthor(rs.getString("Author"));
				book.setBookName(rs.getString("BookName"));
				book.setBookPrice(rs.getFloat("BookPrice"));
				book.setCID(rs.getInt("CID"));
				book.setISBN(rs.getString("ISBN"));
				book.setPNPrice(rs.getFloat("PNPrice"));
				book.setStock(rs.getInt("Stock"));
				book.setPublishDate(rs.getDate("PublishDate"));
				book.setPublisher(rs.getString("Publisher"));
				book.setPhoto(rs.getString("Photo"));
				book.setBookStatus(rs.getString("BookStatus"));
			}
			}
				catch (SQLException e) {
					e.printStackTrace();
				}
				return book; 
		}
		
		//通过分类标号查找图书
	    public ArrayList<BookBeen> getBookByBookC(int CID){
	    	ArrayList<BookBeen> books = new ArrayList<BookBeen>();
			conn = conndb.getConn();
			try{
			psta = conn.prepareStatement("select * from BookTable,BookCTable where BookTable.CID=BookCTable.CID and BookCTable.CID=?");
			psta.setInt(1, CID);
			rs = psta.executeQuery();
			while(rs.next()){
				BookBeen book = new BookBeen();
				book.setAuthor(rs.getString("Author"));
				book.setBookName(rs.getString("BookName"));
				book.setBookPrice(rs.getFloat("BookPrice"));
				book.setCID(rs.getInt("CID"));
				book.setISBN(rs.getString("ISBN"));
				book.setPNPrice(rs.getFloat("PNPrice"));
				book.setStock(rs.getInt("Stock"));
				book.setPublishDate(rs.getDate("PublishDate"));
				book.setPublisher(rs.getString("Publisher"));
				book.setPhoto(rs.getString("Photo"));
				book.setBookStatus(rs.getString("BookStatus"));
				books.add(book);
				System.out.println("hello");
			}
			}
				catch (SQLException e) {
					e.printStackTrace();
				}
				return books; 
	    }
		
		
		
		
		//添加图书
		public boolean insertBook (BookBeen book){
			boolean flag = false;
			conn = conndb.getConn();
			try{
			psta = conn.prepareStatement("insert into BookTable values(?,?,?,?,?,?,?,?,?,?,?)");
			
			psta.setString(1, book.getISBN());
			psta.setString(2, book.getBookName());
			psta.setInt(3, book.getCID());
			psta.setFloat(4, book.getBookPrice());
			psta.setString(5, book.getPublisher());
			psta.setDate(6, book.getPublishDate());
			psta.setString(7, book.getAuthor());
			psta.setString(8, book.getPhoto());
			psta.setFloat(9, book.getPNPrice());
			psta.setInt(10, book.getStock());
			psta.setString(11, book.getBookStatus());
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
			
		//更新图书
		public boolean updateBook(BookBeen book){
			boolean flag = false;
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("update BookTable set BookName=?,CID=?,BookPrice=?,Publisher=?,PublishDate=?,Author=?,Stock=?,PNPrice=?,BookStatus=? where ISBN=?");
				psta.setString(1, book.getBookName());
				psta.setInt(2, book.getCID());
				psta.setFloat(3, book.getBookPrice());
				psta.setString(4, book.getPublisher());
				psta.setDate(5, book.getPublishDate());
				psta.setString(6, book.getAuthor());
				psta.setInt(7, book.getStock());
				psta.setFloat(8, book.getPNPrice());
				psta.setString(9, book.getBookStatus());
				psta.setString(10, book.getISBN());
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
		
		//删除图书
		public boolean deleteBook(String ISBN){
			boolean flag = false;
			conn = conndb.getConn();
			try{
				psta = conn.prepareStatement("delete from BookTable where ISBN=?");
				psta.setString(1, ISBN);
				int n = psta.executeUpdate();
				if(n>0){
					flag = true;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
			this.close();
			return flag;			
		}
}
