package com.kh.app.product.vo;

public class SouvenirVo {

	private String no;
	private String localNo;
	private String name;
	private String price;
	private String enrollDate;
	private String deleteYn;
	private String count;
	private String content;
	private String title;
	private String local;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return "SouvenirVo [no=" + no + ", localNo=" + localNo + ", name=" + name + ", price=" + price + ", enrollDate="
				+ enrollDate + ", deleteYn=" + deleteYn + ", count=" + count + ", content=" + content + ", title="
				+ title + ", local=" + local + "]";
	}
	public SouvenirVo(String no, String localNo, String name, String price, String enrollDate, String deleteYn,
			String count, String content, String title, String local) {
		super();
		this.no = no;
		this.localNo = localNo;
		this.name = name;
		this.price = price;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.count = count;
		this.content = content;
		this.title = title;
		this.local = local;
	}
	public SouvenirVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
