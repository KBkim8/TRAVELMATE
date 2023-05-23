package com.kh.app.admin.vo;

public class SouvenirInventoryVo {

	private String no;
	private String name;
	private String localName;
	private String price;
	private String enrollDate;
	private String deleteYn;
	private String count;
	
	public SouvenirInventoryVo() {
		super();
	}

	public SouvenirInventoryVo(String no, String name, String localName, String price, String enrollDate,
			String deleteYn, String count) {
		super();
		this.no = no;
		this.name = name;
		this.localName = localName;
		this.price = price;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.count = count;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
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

	@Override
	public String toString() {
		return "SouvenirInventoryVo [no=" + no + ", name=" + name + ", localName=" + localName + ", price=" + price
				+ ", enrollDate=" + enrollDate + ", deleteYn=" + deleteYn + ", count=" + count + "]";
	}
	
}
