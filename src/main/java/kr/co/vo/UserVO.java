package kr.co.vo;

import java.util.Date;

public class UserVO {

	private String name;
	private String phonenum;
	private int auth;
	private String pass;
	private int uuid;
	private String userid;
	private int sell_count;
	private int buy_count;
//	private String session_key;
//	private Date session_limit;
	
	
	
//	public String getSession_key() {
//		return session_key;
//	}
//	public void setSession_key(String session_key) {
//		this.session_key = session_key;
//	}
//	public Date getSession_limit() {
//		return session_limit;
//	}
//	public void setSession_limit(Date session_limit) {
//		this.session_limit = session_limit;
//	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public int getSell_count() {
		return sell_count;
	}
	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	// getter & setter 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
