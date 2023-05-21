package com.kh.app.mypage.vo;

public class OrderListVo {
	
	private String no;
	private String orderProductNo;
	private String accomodationNo;
	private String carNo;
	private String souvenirNo;
	
	private String souvenirName;
	private String carKind;
	private String accomodationName;
	
	private String souvenirCnt;
	private String orderTotal;
	private String orderProductDate;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getOrderProductNo() {
		return orderProductNo;
	}
	public void setOrderProductNo(String orderProductNo) {
		this.orderProductNo = orderProductNo;
	}
	public String getAccomodationNo() {
		return accomodationNo;
	}
	public void setAccomodationNo(String accomodationNo) {
		this.accomodationNo = accomodationNo;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getSouvenirNo() {
		return souvenirNo;
	}
	public void setSouvenirNo(String souvenirNo) {
		this.souvenirNo = souvenirNo;
	}
	public String getSouvenirName() {
		return souvenirName;
	}
	public void setSouvenirName(String souvenirName) {
		this.souvenirName = souvenirName;
	}
	public String getCarKind() {
		return carKind;
	}
	public void setCarKind(String carKind) {
		this.carKind = carKind;
	}
	public String getAccomodationName() {
		return accomodationName;
	}
	public void setAccomodationName(String accomodationName) {
		this.accomodationName = accomodationName;
	}
	public String getSouvenirCnt() {
		return souvenirCnt;
	}
	public void setSouvenirCnt(String souvenirCnt) {
		this.souvenirCnt = souvenirCnt;
	}
	public String getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(String orderTotal) {
		this.orderTotal = orderTotal;
	}
	public String getOrderProductDate() {
		return orderProductDate;
	}
	public void setOrderProductDate(String orderProductDate) {
		this.orderProductDate = orderProductDate;
	}
	@Override
	public String toString() {
		return "OrderListVo [no=" + no + ", orderProductNo=" + orderProductNo + ", accomodationNo=" + accomodationNo
				+ ", carNo=" + carNo + ", souvenirNo=" + souvenirNo + ", souvenirName=" + souvenirName + ", carKind="
				+ carKind + ", accomodationName=" + accomodationName + ", souvenirCnt=" + souvenirCnt + ", orderTotal="
				+ orderTotal + ", orderProductDate=" + orderProductDate + "]";
	}
	public OrderListVo(String no, String orderProductNo, String accomodationNo, String carNo, String souvenirNo,
			String souvenirName, String carKind, String accomodationName, String souvenirCnt, String orderTotal,
			String orderProductDate) {
		super();
		this.no = no;
		this.orderProductNo = orderProductNo;
		this.accomodationNo = accomodationNo;
		this.carNo = carNo;
		this.souvenirNo = souvenirNo;
		this.souvenirName = souvenirName;
		this.carKind = carKind;
		this.accomodationName = accomodationName;
		this.souvenirCnt = souvenirCnt;
		this.orderTotal = orderTotal;
		this.orderProductDate = orderProductDate;
	}
	public OrderListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
