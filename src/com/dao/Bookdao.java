/**
 * 书表的操作要求
 */
package com.dao;

import java.util.ArrayList;

import com.javabeen.BookBeen;

public interface Bookdao {
	
	//查找图书通过ISBN
	public BookBeen getBookByISBN(String ISBN);
	
	//添加图书
	public boolean insertBook(BookBeen book);
	
	//更新图书
	public boolean updateBook(BookBeen book);
	
	//删除图书
	public boolean deleteBook(String ISBN);
	
	//通过分类标号查找图书
    public ArrayList<BookBeen> getBookByBookC(int CID);
	
}
