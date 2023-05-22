package com.kh.app.mypage.vo;

public class FavoriteVo {
	
	private String no;
	private String memberNo;
	private String carNo;
	private String accomodationNo;
	private String souvenirReservationNo;
	private String delYn;
	
	private String carKind;
	private String carPrice;
	private String carStarDate;
	private String carEndDate;
	
	private String accomodationName;
	private String accomodationPrice;
	private String accomodationStartDate;
	private String accomodationEndDate;
	
	private String souvenirName;
	private String souvenirPrice;
	private String souvenirCnt;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getAccomodationNo() {
		return accomodationNo;
	}
	public void setAccomodationNo(String accomodationNo) {
		this.accomodationNo = accomodationNo;
	}
	public String getSouvenirReservationNo() {
		return souvenirReservationNo;
	}
	public void setSouvenirReservationNo(String souvenirReservationNo) {
		this.souvenirReservationNo = souvenirReservationNo;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getCarKind() {
		return carKind;
	}
	public void setCarKind(String carKind) {
		this.carKind = carKind;
	}
	public String getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(String carPrice) {
		this.carPrice = carPrice;
	}
	public String getCarStarDate() {
		return carStarDate;
	}
	public void setCarStarDate(String carStarDate) {
		this.carStarDate = carStarDate;
	}
	public String getCarEndDate() {
		return carEndDate;
	}
	public void setCarEndDate(String carEndDate) {
		this.carEndDate = carEndDate;
	}
	public String getAccomodationName() {
		return accomodationName;
	}
	public void setAccomodationName(String accomodationName) {
		this.accomodationName = accomodationName;
	}
	public String getAccomodationPrice() {
		return accomodationPrice;
	}
	public void setAccomodationPrice(String accomodationPrice) {
		this.accomodationPrice = accomodationPrice;
	}
	public String getAccomodationStartDate() {
		return accomodationStartDate;
	}
	public void setAccomodationStartDate(String accomodationStartDate) {
		this.accomodationStartDate = accomodationStartDate;
	}
	public String getAccomodationEndDate() {
		return accomodationEndDate;
	}
	public void setAccomodationEndDate(String accomodationEndDate) {
		this.accomodationEndDate = accomodationEndDate;
	}
	public String getSouvenirName() {
		return souvenirName;
	}
	public void setSouvenirName(String souvenirName) {
		this.souvenirName = souvenirName;
	}
	public String getSouvenirPrice() {
		return souvenirPrice;
	}
	public void setSouvenirPrice(String souvenirPrice) {
		this.souvenirPrice = souvenirPrice;
	}
	public String getSouvenirCnt() {
		return souvenirCnt;
	}
	public void setSouvenirCnt(String souvenirCnt) {
		this.souvenirCnt = souvenirCnt;
	}
	@Override
	public String toString() {
		return "FavoriteVo [no=" + no + ", memberNo=" + memberNo + ", carNo=" + carNo + ", accomodationNo="
				+ accomodationNo + ", souvenirReservationNo=" + souvenirReservationNo + ", delYn=" + delYn
				+ ", carKind=" + carKind + ", carPrice=" + carPrice + ", carStarDate=" + carStarDate + ", carEndDate="
				+ carEndDate + ", accomodationName=" + accomodationName + ", accomodationPrice=" + accomodationPrice
				+ ", accomodationStartDate=" + accomodationStartDate + ", accomodationEndDate=" + accomodationEndDate
				+ ", souvenirName=" + souvenirName + ", souvenirPrice=" + souvenirPrice + ", souvenirCnt=" + souvenirCnt
				+ "]";
	}
	public FavoriteVo(String no, String memberNo, String carNo, String accomodationNo, String souvenirReservationNo,
			String delYn, String carKind, String carPrice, String carStarDate, String carEndDate,
			String accomodationName, String accomodationPrice, String accomodationStartDate, String accomodationEndDate,
			String souvenirName, String souvenirPrice, String souvenirCnt) {
		super();
		this.no = no;
		this.memberNo = memberNo;
		this.carNo = carNo;
		this.accomodationNo = accomodationNo;
		this.souvenirReservationNo = souvenirReservationNo;
		this.delYn = delYn;
		this.carKind = carKind;
		this.carPrice = carPrice;
		this.carStarDate = carStarDate;
		this.carEndDate = carEndDate;
		this.accomodationName = accomodationName;
		this.accomodationPrice = accomodationPrice;
		this.accomodationStartDate = accomodationStartDate;
		this.accomodationEndDate = accomodationEndDate;
		this.souvenirName = souvenirName;
		this.souvenirPrice = souvenirPrice;
		this.souvenirCnt = souvenirCnt;
	}
	public FavoriteVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}
