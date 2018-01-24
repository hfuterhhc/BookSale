/**
 * 书分类表的操作要求
 */
package com.dao;

import java.util.ArrayList;
import com.javabeen.BookCtable;

public interface BookCtadao {
	
	
	//查找所有图书分类
	public ArrayList<BookCtable> getAllBookC();
	
	//查看图书分类
	public BookCtable getBookCByCID(int CID);
	
	//添加图书分类
	public boolean insertBookC(BookCtable bookc);
	
	//更新图书分类
	public boolean updateBookC(int CID,BookCtable bookc);
	
	//删除图书分类
	public boolean deleteBookC(int CID);
	
}
