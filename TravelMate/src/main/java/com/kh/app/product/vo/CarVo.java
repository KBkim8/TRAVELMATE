package com.kh.app.product.vo;

public class CarVo {

	private String no;
	private String carKindNo;
	private String localNo;
	private String count;
	private String enrollDate;
	private String deleteYn;
	private String max;
	private String licensePlate;
	private String licenseDate;
	private String weekdayPrice;
	private String weekendPrice;
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
	public String getWeekdayPrice() {
		return weekdayPrice;
	}
	public void setWeekdayPrice(String weekdayPrice) {
		this.weekdayPrice = weekdayPrice;
	}
	public String getWeekendPrice() {
		return weekendPrice;
	}
	public void setWeekendPrice(String weekendPrice) {
		this.weekendPrice = weekendPrice;
	}
	@Override
	public String toString() {
		return "CarVo [no=" + no + ", carKindNo=" + carKindNo + ", localNo=" + localNo + ", count=" + count
				+ ", enrollDate=" + enrollDate + ", deleteYn=" + deleteYn + ", max=" + max + ", licensePlate="
				+ licensePlate + ", licenseDate=" + licenseDate + ", weekdayPrice=" + weekdayPrice + ", weekendPrice="
				+ weekendPrice + "]";
	}
	public CarVo(String no, String carKindNo, String localNo, String count, String enrollDate, String deleteYn,
			String max, String licensePlate, String licenseDate, String weekdayPrice, String weekendPrice) {
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
		this.weekdayPrice = weekdayPrice;
		this.weekendPrice = weekendPrice;
	}
	public CarVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
