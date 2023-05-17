package com.kh.app.board.vo;

public class CategoryVo {

	private String notice;
	private String salesRequest;
	private String onlineTravel;
	private String review;
	private String free;
	public CategoryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryVo(String notice, String salesRequest, String onlineTravel, String review, String free) {
		super();
		this.notice = notice;
		this.salesRequest = salesRequest;
		this.onlineTravel = onlineTravel;
		this.review = review;
		this.free = free;
	}
	@Override
	public String toString() {
		return "CategoryVo [notice=" + notice + ", salesRequest=" + salesRequest + ", onlineTravel=" + onlineTravel
				+ ", review=" + review + ", free=" + free + "]";
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getSalesRequest() {
		return salesRequest;
	}
	public void setSalesRequest(String salesRequest) {
		this.salesRequest = salesRequest;
	}
	public String getOnlineTravel() {
		return onlineTravel;
	}
	public void setOnlineTravel(String onlineTravel) {
		this.onlineTravel = onlineTravel;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	

}

