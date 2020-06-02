package kr.co.vo;

public class BookRequestDTO {
	private int brb_id;
	private String bk_category;
	private String brd_comment;
	private int uuid;
	private String brb_regdate;
	private int brb_cnt;
	private String brb_isbn;
	
	public BookRequestDTO() {
		super();
		System.out.println("BookRequestDTO 梓端 持失");
	}
	
	public BookRequestDTO(int brb_id, String bk_category, String brd_comment, int uuid, String brb_regdate, int brb_cnt, String isbn) {
		super();
		this.brb_id = brb_id;
		this.bk_category = bk_category;
		this.brd_comment = brd_comment;
		this.uuid = uuid;
		this.brb_regdate = brb_regdate;
		this.brb_cnt = brb_cnt;
		this.brb_isbn = isbn;
		System.out.println("BookRequestDTO(brb_id, brk_category, brd_comment, uuid, brb_regdate, brb_cnt, isbn) 梓端 持失");
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

	public String getBrb_regdate() {
		return brb_regdate;
	}

	public void setBrb_regdate(String brb_regdate) {
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
	
	
}
