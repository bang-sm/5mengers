package kr.co.vo;

import java.util.Date;

public class BookDTO {
	private int bsr_id;
	private int uuid;
	private String bsr_name;
	private Date bsr_regdate;
	private String bsr_confirm;
	
	
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
	public Date getBsr_regdate() {
		return bsr_regdate;
	}
	public void setBsr_regdate(Date bsr_regdate) {
		this.bsr_regdate = bsr_regdate;
	}
	public String getBsr_confirm() {
		return bsr_confirm;
	}
	public void setBsr_confirm(String bsr_confirm) {
		this.bsr_confirm = bsr_confirm;
	}
}
