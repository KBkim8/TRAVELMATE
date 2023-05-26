package com.kh.app.product.vo;

public class RoomVo {

	private String no;
	private String localNo;
	private String accomodationNo;
	private String name;
	private String enrollDate;
	private String maxPeople;
	private String content;
	private String deleteYn;
	private String price;
	private String title;
	private String local;
	private String kind;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getLocalNo() {
		return localNo;
	}
	public void setLocalNo(String localNo) {
		this.localNo = localNo;
	}
	public String getAccomodationNo() {
		return accomodationNo;
	}
	public void setAccomodationNo(String accomodationNo) {
		this.accomodationNo = accomodationNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(String maxPeople) {
		this.maxPeople = maxPeople;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "RoomVo [no=" + no + ", localNo=" + localNo + ", accomodationNo=" + accomodationNo + ", name=" + name
				+ ", enrollDate=" + enrollDate + ", maxPeople=" + maxPeople + ", content=" + content + ", deleteYn="
				+ deleteYn + ", price=" + price + ", title=" + title + ", local=" + local + ", kind=" + kind + "]";
	}
	public RoomVo(String no, String localNo, String accomodationNo, String name, String enrollDate, String maxPeople,
			String content, String deleteYn, String price, String title, String local, String kind) {
		super();
		this.no = no;
		this.localNo = localNo;
		this.accomodationNo = accomodationNo;
		this.name = name;
		this.enrollDate = enrollDate;
		this.maxPeople = maxPeople;
		this.content = content;
		this.deleteYn = deleteYn;
		this.price = price;
		this.title = title;
		this.local = local;
		this.kind = kind;
	}
	public RoomVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
