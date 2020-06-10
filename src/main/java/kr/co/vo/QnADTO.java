package kr.co.vo;

import java.util.Date;

public class QnADTO {
	
	// qna
	
	private int qb_id;
	private int uuid;
	private String qb_title;
	private String qb_comment;
	private Date qb_date;
	private String userid;
	
	// qna reply
	
	private int qbr_id;
	private String qbr_comment;
	private Date qbr_regdate;
	
	// qna getter & setter
	
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
	
	// qna reply getter & setter
	
	public int getQbr_id() {
		return qbr_id;
	}

	public void setQbr_id(int qbr_id) {
		this.qbr_id = qbr_id;
	}

	public String getQbr_comment() {
		return qbr_comment;
	}

	public void setQbr_comment(String qbr_comment) {
		this.qbr_comment = qbr_comment;
	}

	public Date getQbr_regdate() {
		return qbr_regdate;
	}

	public void setQbr_regdate(Date qbr_regdate) {
		this.qbr_regdate = qbr_regdate;
	}
	

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
