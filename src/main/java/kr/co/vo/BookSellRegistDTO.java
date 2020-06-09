package kr.co.vo;

import java.util.Date;

public class BookSellRegistDTO {
	
	// Book_sell_registMapper
	private int bsr_id; // book 게시판 id
	private int uuid; // user ID
	private String bsr_name; // 책 이름 ---> 데이터 받아오기
	private String bsr_price; // 책 희망가격
	private String bsr_comment; 
	private Date bsr_regdate;
	private int bsr_category;
	private int bsr_check;
	private String bsr_fixed_price; // 책 가격 
	private String bsr_confirm;
	//맵 주소 소수
	private double map_x;
	private double map_y;
	
	// 출판사 명과 작가 명 명시해서 책 구분을 해야한다. 
	
	private String author;
	private String publisher;
	
	
	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	// 새 데이터 추가 ---> 데이터 베이스에 없어도 되려나?
	
	// 담긴 데이터를 확인하기 위해 
	public String toString () {
		return "Book [bsr_name=" + bsr_name + ", bsr_fixed_price" + bsr_fixed_price 
				+ ", author" + author + ", publisher " + publisher + "]";
	}
	
	
	
	// getter & setter 
	public int getBsr_id() {
		return bsr_id;
	}
	public void setBsr_id(int bsr_id) {
		this.bsr_id = bsr_id;
	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public String getBsr_name() {
		return bsr_name;
	}
	public void setBsr_name(String bsr_name) {
		this.bsr_name = bsr_name;
	}
	public String getBsr_price() {
		return bsr_price;
	}
	public void setBsr_price(String bsr_price) {
		this.bsr_price = bsr_price;
	}
	public String getBsr_comment() {
		return bsr_comment;
	}
	public void setBsr_comment(String bsr_comment) {
		this.bsr_comment = bsr_comment;
	}
	public Date getBsr_regdate() {
		return bsr_regdate;
	}
	public void setBsr_regdate(Date bsr_regdate) {
		this.bsr_regdate = bsr_regdate;
	}
	
	public int getBsr_category() {
		return bsr_category;
	}
	public void setBsr_category(int bsr_category) {
		this.bsr_category = bsr_category;
	}
	public int getBsr_check() {
		return bsr_check;
	}
	public void setBsr_check(int bsr_check) {
		this.bsr_check = bsr_check;
	}
	public String getBsr_fixed_price() {
		return bsr_fixed_price;
	}
	public void setBsr_fixed_price(String bsr_fixed_price) {
		this.bsr_fixed_price = bsr_fixed_price;
	}
	public String getBsr_confirm() {
		return bsr_confirm;
	}
	public void setBsr_confirm(String bsr_confirm) {
		this.bsr_confirm = bsr_confirm;
	}
	public double getMap_x() {
		return map_x;
	}
	public void setMap_x(double map_x) {
		this.map_x = map_x;
	}
	public double getMap_y() {
		return map_y;
	}
	public void setMap_y(double map_y) {
		this.map_y = map_y;
	}
	
	
	
	
	
	 

}
