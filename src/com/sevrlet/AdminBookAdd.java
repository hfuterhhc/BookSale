package com.sevrlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.faces.convert.FloatConverter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;
import java.sql.Date;

import com.javabeen.BookBeen;
import com.sqls.BookSql;

public class AdminBookAdd extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws IOException, HTTPException{
	request.setCharacterEncoding("UTF-8");
	String ISBN   =request.getParameter("ISBN");
	String BookName =request.getParameter("BookName");
	String CID =request.getParameter("CID");
	String BookPrice =request.getParameter("BookPrice");
	String Publisher =request.getParameter("Publisher");
	String PublishDate =request.getParameter("PublishDate");
	String Author =request.getParameter("Author");
	String Photo = request.getParameter("Photo");
	String Stock =request.getParameter("Stock");
	String PNPrice =request.getParameter("PNPrice");
	String BookStatus = request.getParameter("BookStatus");
	
	BookBeen book = new BookBeen();
	 book.setISBN(ISBN);
	 book.setBookName(BookName);
	 book.setCID(Integer.parseInt(CID));
	 book.setBookPrice(Float.parseFloat(BookPrice));
	 book.setPublisher(Publisher);
	 book.setPublishDate(java.sql.Date.valueOf(PublishDate));
	 book.setAuthor(Author);
	 book.setPhoto(Photo);
	 book.setStock(Integer.parseInt(Stock));
	 book.setPNPrice(Float.parseFloat(PNPrice));
	 book.setBookStatus(BookStatus);
	 
	 BookSql bs = new BookSql();
	 boolean flag = bs.insertBook(book);
	 if (flag){
		 response.sendRedirect("manager/Manager_bookTable.jsp");
	 }
	 else{
		 response.sendRedirect("manager/Manager_bookAdd.jsp");
	 }
	}
	
	 public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			this.doGet(request, response);
		}
	
}
