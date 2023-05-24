package com.kh.app.admin.vo;

public class SellRequestDetailVo {
	
	private String no;
	private String writer;
	private String title;
	private String content;
	private String enrollDate;
	private String boardImg;
	
	public SellRequestDetailVo() {
		super();
	}

	public SellRequestDetailVo(String no, String writer, String title, String content, String enrollDate,
			String boardImg) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
		this.boardImg = boardImg;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getBoardImg() {
		return boardImg;
	}

	public void setBoardImg(String boardImg) {
		this.boardImg = boardImg;
	}

	@Override
	public String toString() {
		return "SellRequestDetailVo [no=" + no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", enrollDate=" + enrollDate + ", boardImg=" + boardImg + "]";
	}
	
}
