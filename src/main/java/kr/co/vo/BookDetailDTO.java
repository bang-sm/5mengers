package kr.co.vo;

import java.sql.Date;

public class BookDetailDTO {
	int uuid;
	String name;
	String bsr_name;
	String bsr_price;
	String bsr_comment;
	Date bsr_regdate;
	int bsr_category;
	int bsr_check;
	int bsr_status;
	String bsr_fixed_price;
	String bsr_confirm;
	String phonenum;
	String bc_name;
	int zzim;
	int auth;
	int bsr_id;
	double map_x;
	double map_y;
	int bsr_img_id;
	String bi_user_file_name;
	String bi_file_name;
	String bi_root;
	
	
	
	public int getBsr_status() {
		return bsr_status;
	}
	public void setBsr_status(int bsr_status) {
		this.bsr_status = bsr_status;
	}
	public String getBc_name() {
		return bc_name;
	}
	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBsr_img_id() {
		return bsr_img_id;
	}
	public void setBsr_img_id(int bsr_img_id) {
		this.bsr_img_id = bsr_img_id;
	}
	public String getBi_user_file_name() {
		return bi_user_file_name;
	}
	public void setBi_user_file_name(String bi_user_file_name) {
		this.bi_user_file_name = bi_user_file_name;
	}
	public String getBi_file_name() {
		return bi_file_name;
	}
	public void setBi_file_name(String bi_file_name) {
		this.bi_file_name = bi_file_name;
	}
	public String getBi_root() {
		return bi_root;
	}
	public void setBi_root(String bi_root) {
		this.bi_root = bi_root;
	}
   
}
