package com.kh.app.admin.vo;

public class ReportSearchVo {
	
	private String no;
	private String sanctionName;
	private String memberNick;
	private String enrollDate;
	private String cancelEnrollDate;
	
	public ReportSearchVo() {
		super();
	}

	public ReportSearchVo(String no, String sanctionName, String memberNick, String enrollDate,
			String cancelEnrollDate) {
		super();
		this.no = no;
		this.sanctionName = sanctionName;
		this.memberNick = memberNick;
		this.enrollDate = enrollDate;
		this.cancelEnrollDate = cancelEnrollDate;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSanctionName() {
		return sanctionName;
	}

	public void setSanctionName(String sanctionName) {
		this.sanctionName = sanctionName;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getCancelEnrollDate() {
		return cancelEnrollDate;
	}

	public void setCancelEnrollDate(String cancelEnrollDate) {
		this.cancelEnrollDate = cancelEnrollDate;
	}

	@Override
	public String toString() {
		return "ReportSearchVo [no=" + no + ", sanctionName=" + sanctionName + ", memberNick=" + memberNick
				+ ", enrollDate=" + enrollDate + ", cancelEnrollDate=" + cancelEnrollDate + "]";
	}

}
