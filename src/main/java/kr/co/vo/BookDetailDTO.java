package kr.co.vo;

import java.sql.Date;

public class BookDetailDTO {
	int uuid;
	String name;
	String bsr_name;
	
	String bsr_price;
	String bsr_comment;
	Date bsr_regdate;
	String bsr_category;
	int bsr_check;
	String bsr_fixed_price;
	String bsr_confirm;
	String phonenum;
	int zzim;
	int auth;
	
	int bsr_id;
	double map_x;
	double map_y;
	
	public int getZzim() {
		return zzim;
	}
	public void setZzim(int zzim) {
		this.zzim = zzim;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
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
	public String getBsr_category() {
		return bsr_category;
	}
	public void setBsr_category(String bsr_category) {
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
   
}