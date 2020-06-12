package kr.co.vo;

import java.util.Date;

public class BookRequestDTO {
	
	// brb
	private int brb_id;
	private String bk_category;
	private String brd_comment;
	private int uuid;
	private Date brb_regdate;
	private int brb_cnt;
	private String brb_isbn;
	private String brb_title;
	private String brb_price;
	private String keyword;
	private String brb_bookname;
	private String name;
	
	// brbr
	
	private int brbr_id;
	private String uuid_book_url;
	private Date brbr_regdate;
	
	// bc_name
	private String bc_name;
	
	//
	
	public BookRequestDTO() {
		super();
		System.out.println("BookRequestDTO()");
	}
	
	// brb getter & setter
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBrb_id() {
		return brb_id;
	}

	public void setBrb_id(int brb_id) {
		this.brb_id = brb_id;
	}

	public String getBk_category() {
		return bk_category;
	}

	public void setBk_category(String bk_category) {
		this.bk_category = bk_category;
	}

	public String getBrd_comment() {
		return brd_comment;
	}

	public void setBrd_comment(String brd_comment) {
		this.brd_comment = brd_comment;
	}

	public int getUuid() {
		return uuid;
	}

	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	public Date getBrb_regdate() {
		return brb_regdate;
	}

	public void setBrb_regdate(Date brb_regdate) {
		this.brb_regdate = brb_regdate;
	}

	public int getBrb_cnt() {
		return brb_cnt;
	}

	public void setBrb_cnt(int brb_cnt) {
		this.brb_cnt = brb_cnt;
	}

	public String getBrb_isbn() {
		return brb_isbn;
	}

	public void setBrb_isbn(String brb_isbn) {
		this.brb_isbn = brb_isbn;
	}
	
	public String getBrb_title() {
		return brb_title;
	}

	public void setBrb_title(String brb_title) {
		this.brb_title = brb_title;
	}

	public String getBrb_price() {
		return brb_price;
	}

	public void setBrb_price(String brb_price) {
		this.brb_price = brb_price;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getBrb_bookname() {
		return brb_bookname;
	}

	public void setBrb_bookname(String brb_bookname) {
		this.brb_bookname = brb_bookname;
	}
	
	// brb reply getter & setter
	
	public int getBrbr_id() {
		return brbr_id;
	}

	public void setBrbr_id(int brbr_id) {
		this.brbr_id = brbr_id;
	}

	public String getUuid_book_url() {
		return uuid_book_url;
	}

	public void setUuid_book_url(String uuid_book_url) {
		this.uuid_book_url = uuid_book_url;
	}

	public Date getBrbr_regdate() {
		return brbr_regdate;
	}

	public void setBrbr_regdate(Date brbr_regdate) {
		this.brbr_regdate = brbr_regdate;
	}

	// bc_name getter & setter
	
	public String getBc_name() {
		return bc_name;
	}

	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}
}