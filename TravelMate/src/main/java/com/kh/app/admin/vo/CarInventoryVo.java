package com.kh.app.admin.vo;

public class CarInventoryVo {

	private String no;
	private String kind;
	private String count;
	private String name;
	private String licensePlate;
	private String weekdayPrice;
	private String weekendPrice;
	private String licenseDate;
	
	public CarInventoryVo() {
		super();
	}

	public CarInventoryVo(String no, String kind, String count, String name, String licensePlate, String weekdayPrice,
			String weekendPrice, String licenseDate) {
		super();
		this.no = no;
		this.kind = kind;
		this.count = count;
		this.name = name;
		this.licensePlate = licensePlate;
		this.weekdayPrice = weekdayPrice;
		this.weekendPrice = weekendPrice;
		this.licenseDate = licenseDate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
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

	public String getLicenseDate() {
		return licenseDate;
	}

	public void setLicenseDate(String licenseDate) {
		this.licenseDate = licenseDate;
	}

	@Override
	public String toString() {
		return "CarInventoryVo [no=" + no + ", kind=" + kind + ", count=" + count + ", name=" + name + ", licensePlate="
				+ licensePlate + ", weekdayPrice=" + weekdayPrice + ", weekendPrice=" + weekendPrice + ", licenseDate="
				+ licenseDate + "]";
	}
	
}
