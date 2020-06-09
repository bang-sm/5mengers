package kr.co.vo;

public class MyhistoryDTO {
	private String bsr_name;
	private int bsr_id;
	private String bsr_price;
	private String startDate;
	private String endDate;

	//승인날짜 최초에는 널 판매자 승인시 그시각 업데이트
	private String myb_regdate;
	private String bsr_confirm;
	
	public String getBsr_name() {
		return bsr_name;
	}
	public void setBsr_name(String bsr_name) {
		this.bsr_name = bsr_name;
	}
	public int getBsr_id() {
		return bsr_id;
	}
	public void setBsr_id(int bsr_id) {
		this.bsr_id = bsr_id;
	}
	public String getBsr_price() {
		return bsr_price;
	}
	public void setBsr_price(String bsr_price) {
		this.bsr_price = bsr_price;
	}
	public String getBsr_confirm() {
		return bsr_confirm;
	}
	public void setBsr_confirm(String bsr_confirm) {
		this.bsr_confirm = bsr_confirm;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMyb_regdate() {
		return myb_regdate;
	}
	public void setMyb_regdate(String myb_regdate) {
		this.myb_regdate = myb_regdate;
	}
	
}
