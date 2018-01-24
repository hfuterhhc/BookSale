/**
 * 书分类表的信息
 */
package com.javabeen;

public class BookCtable {
	
	// 书类CID
	private int CID;
	// 书类名称
	private String CName;
	//图书分类状态
	private String BookCStatus;
	
	public String getBookCStatus() {
		return BookCStatus;
	}
	public void setBookCStatus(String bookCStatus) {
		BookCStatus = bookCStatus;
	}
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
}
