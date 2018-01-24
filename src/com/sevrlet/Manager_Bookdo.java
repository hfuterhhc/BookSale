package com.sevrlet;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javabeen.*;
import com.sqls.*;
public class Manager_Bookdo extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Manager_Bookdo() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		String str=request.getParameter("delete");
		System.out.print(str);
		
		if(str.equals("delete")){
		System.out.print(str);
		String isbn=request.getParameter("ISBN");
		BookSql mdi = new BookSql();
		System.out.print(isbn);
		try{
			System.out.print(str+"22");
			mdi.deleteBook(isbn);
			response.sendRedirect("manager/Manager_bookTable.jsp");
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("manager/Manager_bookTable.jsp");
		}
		}
		
		
		else if(str.equals("save")){
			System.out.print(str);
			BookBeen book=new BookBeen();
			String isbn=request.getParameter("ISBN");
			
			String bookname  = request.getParameter("BookName");
			int cid = Integer.parseInt(request.getParameter("CID"));
			float  bookprice= Float.parseFloat(request.getParameter("BookPrice"));
			
			Date publishdate= Date.valueOf(request.getParameter("PublishDate"));
			String publisher=request.getParameter("Publisher");
			String author=request.getParameter("Author");
			int pstock=Integer.parseInt(request.getParameter("PStock"));
			String photo  = request.getParameter("photo");
			String  bookstatus= request.getParameter("BookStatus");
			System.out.print(str+"11");
			
			book.setISBN(isbn);
			book.setAuthor(author);
			book.setBookName(bookname);
			book.setBookPrice(bookprice);
			book.setBookStatus(bookstatus);
			book.setCID(cid);
			book.setPhoto(photo);
			book.setPNPrice(bookprice);
			book.setStock(pstock);
			book.setPublishDate(publishdate);
			book.setPublisher(publisher);
			
						
			BookSql mdi1 = new BookSql();
			try{
			mdi1.updateBook(book);
			response.sendRedirect("manager/Manager_bookTable.jsp");
			}catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("manager/Manager_bookTable .jsp");
			}
			
	}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
