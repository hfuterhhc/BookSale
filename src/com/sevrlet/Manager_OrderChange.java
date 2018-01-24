/**
 * 管理员订单更改
 */
package com.sevrlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javabeen.*;
import com.sqls.*;


public class Manager_OrderChange extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Manager_OrderChange() {
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
		String str=request.getParameter("delete");
		
		if(str.equals("delete")){
		int OrderNum=Integer.parseInt(request.getParameter("OrderId"));
		OrderSql mdi = new OrderSql();
		try{
			mdi.deleteOrder(OrderNum);
			response.sendRedirect("manager/Manager_userOrder.jsp");
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("manager/Manager_userOrder.jsp");
		}
		}
		
		
		else if(str.equals("save")){
			OrderBeen order=new OrderBeen();
			int  orderid=Integer.parseInt( request.getParameter("OrderID"));
			String date  = request.getParameter("OrderDate");
			String e_mail = request.getParameter("E_mail");
			//float  ordertotal= Float.parseFloat(request.getParameter("OrderTotal"));
			String isbn = request.getParameter("ISBN");
			int amount  = Integer.parseInt(request.getParameter("OrderQuantity"));
			String  status= request.getParameter("status");
			
			order.setOrderQuantity(amount);
			order.setE_mail(e_mail);
			order.setISBN(isbn);
			order.setOrderDate(date);
			order.setOrderID(orderid);
			//order.setTotalAmount(ordertotal);
			order.setOrderStatus(status);
			
			OrderSql mdi1 = new OrderSql();
			try{
			mdi1.updateOrder(order);
			response.sendRedirect("manager/Manager_userOrder.jsp");
			}catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("manager/Manager_userOrder.jsp");
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
