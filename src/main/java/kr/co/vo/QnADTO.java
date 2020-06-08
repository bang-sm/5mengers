package kr.co.vo;

import java.util.Date;

public class QnADTO {
	private int qb_id;
	private int uuid;
	private String qb_title;
	private String qb_comment;
	private Date qb_date;
	
	
	public QnADTO() {
		super();
		System.out.println("QnADTO()");
	}
	
	public QnADTO(int qb_id, int uuid, String qb_title, String qb_comment, Date qb_date) {
		super();
		this.qb_id = qb_id;
		this.uuid = uuid;
		this.qb_title = qb_title;
		this.qb_comment = qb_comment;
		this.qb_date = qb_date;
		System.out.println("QnADTO(qb_id, uuid, qb_title, qb_comment, qb_date)");
	}
	
	public int getQb_id() {
		return qb_id;
	}
	public void setQb_id(int qb_id) {
		this.qb_id = qb_id;
	}
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public String getQb_title() {
		return qb_title;
	}
	public void setQb_title(String qb_title) {
		this.qb_title = qb_title;
	}
	public String getQb_comment() {
		return qb_comment;
	}
	public void setQb_comment(String qb_comment) {
		this.qb_comment = qb_comment;
	}
	public Date getQb_date() {
		return qb_date;
	}
	public void setQb_date(Date qb_date) {
		this.qb_date = qb_date;
	}
	
	
}
