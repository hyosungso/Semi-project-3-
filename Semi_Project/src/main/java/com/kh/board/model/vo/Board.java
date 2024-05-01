package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; //게시글 번호
	private String boardWriter; //작성자 아이디(회원번호->아이디)
	private String boardTitle; //게시글 제목
	private String boardContent; //게시글 내용
	private int count; //조회수
	private int recommend; //추천수 
	private Date uploadDate; //게시글 생성일
	private Date reviseDate; //게시글 마지막 수정일
	private String category; //카테고리(번호->카테고리이름)
	
	public Board() {
		super();
	}
	
	
	
	public Board(int boardNo, String category, String boardWriter, String boardTitle, int count, int recommend, Date uploadDate
			) {
		super();
		this.boardNo = boardNo;
		this.category = category;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.count = count;
		this.recommend = recommend;
		this.uploadDate = uploadDate;
		
	}



	public Board(int boardNo, String boardWriter, String boardTitle, String boardContent, int count, int recommend,
			Date uploadDate, Date reviseDate, String category) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.recommend = recommend;
		this.uploadDate = uploadDate;
		this.reviseDate = reviseDate;
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", count=" + count + ", recommend=" + recommend + ", uploadDate="
				+ uploadDate + ", reviseDate=" + reviseDate + ", category=" + category + "]";
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
	
}