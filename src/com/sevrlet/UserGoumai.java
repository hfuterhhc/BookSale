package com.sevrlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javabeen.BookBeen;
import com.sqls.BookSql;
import com.sqls.OrderSql;

public class UserGoumai extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public UserGoumai() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println((String)request.getSession().getAttribute("E_mail"));
		
	
		if((String)request.getSession().getAttribute("E_mail")!=null){
			
			String action=request.getParameter("action");
			
			if(action.equals("ADD")) {
			String E_mail = (String)request.getSession().getAttribute("E_mail");
			
			String bookISBN = request.getParameter("bb");
			System.out.println(bookISBN);
			
			String shuliang1 = request.getParameter("shuliang");
			
			Enumeration<String> pars=request.getParameterNames();
			while(pars.hasMoreElements())
			{  
				String s=(String)pars.nextElement();
			  System.out.println(s);
			}

			
		    if(shuliang1==null){
		    	shuliang1="1";
		    }
			int shuliang = Integer.parseInt(shuliang1);
			System.out.println(shuliang);
			
			BookSql bookSql = new BookSql();
			BookBeen book = bookSql.getBookByISBN(bookISBN);
			
			OrderSql orderSql = new OrderSql();
			orderSql.intsertOrder(E_mail, book, shuliang);
			
			}
			
			response.sendRedirect("user/UserOrder.jsp");
		}
		else{
			response.sendRedirect("user/UserLogin.jsp");
		}
		
		
		out.flush();
		out.close();
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
