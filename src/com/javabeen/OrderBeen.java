/**
 * 定义订单信息
 */
package com.javabeen;

public class OrderBeen {
   
	private int OrderID;
	
	private String OrderDate;
	
	private String E_mail;
	
	private float TotalAmount;
	
	private String ISBN;
	
	private int OrderQuantity;
	
	private  String OrderStatus;
	
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(String orderData) {
		OrderDate = orderData;
	}
	public String getE_mail() {
		return E_mail;
	}
	public void setE_mail(String e_mail) {
		E_mail = e_mail;
	}
	public float getTotalAmount() {
		return TotalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		TotalAmount = totalAmount;
	}
	public int getOrderQuantity() {
		return OrderQuantity;
	}
	public void setOrderQuantity(int orderQuantity) {
		OrderQuantity = orderQuantity;
	}
	public String getOrderStatus() {
		return OrderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		OrderStatus = orderStatus;
	}
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	
	
	
}
