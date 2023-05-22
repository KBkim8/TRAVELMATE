package com.kh.app.product.vo;

public class CarVo {

	private String max;
	private String licensePlate;
	private String price;
	private String lcname;
	private String title;
	private String carKindKind;
	private String no;
	private String carKindNo;
	private String localNo;
	private String count;
	private String enrollDate;
	private String deleteYn;
	private String licenseDate;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getCarKindNo() {
		return carKindNo;
	}
	public void setCarKindNo(String carKindNo) {
		this.carKindNo = carKindNo;
	}
	public String getLocalNo() {
		return localNo;
	}
	public void setLocalNo(String localNo) {
		this.localNo = localNo;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
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
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getLicensePlate() {
		return licensePlate;
	}
	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}
	public String getLicenseDate() {
		return licenseDate;
	}
	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLcname() {
		return lcname;
	}
	public void setLcname(String lcname) {
		this.lcname = lcname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCarKindKind() {
		return carKindKind;
	}
	public void setCarKindKind(String carKindKind) {
		this.carKindKind = carKindKind;
	}
	@Override
	public String toString() {
		return "CarVo [no=" + no + ", carKindNo=" + carKindNo + ", localNo=" + localNo + ", count=" + count
				+ ", enrollDate=" + enrollDate + ", deleteYn=" + deleteYn + ", max=" + max + ", licensePlate="
				+ licensePlate + ", licenseDate=" + licenseDate + ", price=" + price + ", lcname=" + lcname + ", title="
				+ title + ", carKindKind=" + carKindKind + "]";
	}
	public CarVo(String no, String carKindNo, String localNo, String count, String enrollDate, String deleteYn,
			String max, String licensePlate, String licenseDate, String price, String lcname, String title,
			String carKindKind) {
		super();
		this.no = no;
		this.carKindNo = carKindNo;
		this.localNo = localNo;
		this.count = count;
		this.enrollDate = enrollDate;
		this.deleteYn = deleteYn;
		this.max = max;
		this.licensePlate = licensePlate;
		this.licenseDate = licenseDate;
		this.price = price;
		this.lcname = lcname;
		this.title = title;
		this.carKindKind = carKindKind;
	}
	public CarVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
}
