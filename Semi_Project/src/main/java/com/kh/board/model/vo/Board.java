package com.kh.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo;// BOARD_NO NUMBER
	private int boardWriter;// BOARD_WRITER NUMBER
	private String boardTitle;// BOARD_TITLE VARCHAR2(100 BYTE)
	private String boardContent;// BOARD_CONTENT VARCHAR2(4000 BYTE)
	private int count;// COUNT NUMBER
	private int recommend;// RECOMMEND NUMBER
	private Date uploadDate;// UPLOAD_DATE DATE
	private Date reviseDate;// REVISE_DATE DATE
	private int categoryNo;// CATEGORY_NO NUMBER
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Date getReviseDate() {
		return reviseDate;
	}
	public void setReviseDate(Date reviseDate) {
		this.reviseDate = reviseDate;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Board() {
		super();
	}
	public Board(int boardNo, int boardWriter, String boardTitle, String boardContent, int count, int recommend,
			Date uploadDate, Date reviseDate, int categoryNo) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.recommend = recommend;
		this.uploadDate = uploadDate;
		this.reviseDate = reviseDate;
		this.categoryNo = categoryNo;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", count=" + count + ", recommend=" + recommend + ", uploadDate="
				+ uploadDate + ", reviseDate=" + reviseDate + ", categoryNo=" + categoryNo + "]";
	}
	
	

	
}
