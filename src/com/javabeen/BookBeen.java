/**
 * 书的具体信息
 */
package com.javabeen;

import java.sql.Date;

public class BookBeen {
	
	// 书条形码
	private String ISBN ;
	// 书名称
	private String BookName;
	// 书分类编号
	private int CID;
	// 书价格
	private float BookPrice;
	//出版社
	private String Publisher;
	//出版日期
	private Date PublishDate;
	//作者
	private String Author;
	//库存量
	private int Stock;
	//折后价
	private float PNPrice;
	//书状态（未下架，已下架）
	private  String BookStatus;
	//书对应图片
	private String Photo;
	
	public int getStock() {
		return Stock;
	}

	public void setStock(int stock) {
		Stock = stock;
	}

	public String getBookStatus() {
		return BookStatus;
	}

	public void setBookStatus(String bookStatus) {
		BookStatus = bookStatus;
	}
	
	
	public void setPhoto(String Photo){
		try {
            byte b[]=Photo.getBytes("UTF-8");
	        this.Photo=new String(b);
        }
	    catch(Exception e){}
	}
	
	public String getPhoto(){
		return Photo;
	}
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	
	public int getCID() {
		return CID;
	}
	public void setCID(int cID) {
		CID = cID;
	}
	
	
	public float getBookPrice() {
		return BookPrice;
	}
	
	
	public void setBookPrice(float bookPrice) {
		BookPrice = bookPrice;
	}
	
	
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public Date getPublishDate() {
		return PublishDate;
	}
	public void setPublishDate(Date publishDate) {
		PublishDate = publishDate;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	
	public float getPNPrice() {
		return PNPrice;
	}
	public void setPNPrice(float pNPrice) {
		PNPrice = pNPrice;
	}
}
