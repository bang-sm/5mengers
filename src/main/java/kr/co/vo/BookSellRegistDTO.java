package kr.co.vo;

import java.util.Date;

public class BookSellRegistDTO {
	
	
	
	// Book_sell_registMapper
	private int bsr_id;
	private int uuid;
	private String bsr_name;
	private String bsr_price;
	private String bsr_comment;
	private Date bsr_regdate;
	private String category;
	private int bsr_check;
	private String bsr_fixed_price;
	private String bsr_confirm;
	private int map_x;
	private int map_y;
	
	
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getMap_x() {
		return map_x;
	}
	public void setMap_x(int map_x) {
		this.map_x = map_x;
	}
	public int getMap_y() {
		return map_y;
	}
	public void setMap_y(int map_y) {
		this.map_y = map_y;
	}
	
	
	
	
	
	 

}
