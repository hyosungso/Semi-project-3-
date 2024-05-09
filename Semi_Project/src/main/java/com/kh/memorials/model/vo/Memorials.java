package com.kh.memorials.model.vo;

import java.util.Date;

public class Memorials {
	
	private int memorialsNo;
	private int memorialsType;
	private Date memorialsDate; //사용자 지정 날짜
	private String memorialsTime;
	private String memorialsParts;
	private String memorialsContent;
	private int memorialsSelfScore;
	private int count;
	private Date createDate; // 서버에 올린 날짜
	private String status;
	
	public Memorials() {
		super();
	}

	public Memorials(int memorialsNo, int memorialsType, Date memorialsDate, String memorialsTime,
			String memorialsParts, String memorialsContent, int memorialsSelfScore, int count, Date createDate,
			String status) {
		super();
		this.memorialsNo = memorialsNo;
		this.memorialsType = memorialsType;
		this.memorialsDate = memorialsDate;
		this.memorialsTime = memorialsTime;
		this.memorialsParts = memorialsParts;
		this.memorialsContent = memorialsContent;
		this.memorialsSelfScore = memorialsSelfScore;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public int getMemorialsNo() {
		return memorialsNo;
	}

	public void setMemorialsNo(int memorialsNo) {
		this.memorialsNo = memorialsNo;
	}

	public int getMemorialsType() {
		return memorialsType;
	}

	public void setMemorialsType(int memorialsType) {
		this.memorialsType = memorialsType;
	}

	public Date getMemorialsDate() {
		return memorialsDate;
	}

	public void setMemorialsDate(Date memorialsDate) {
		this.memorialsDate = memorialsDate;
	}

	public String getMemorialsTime() {
		return memorialsTime;
	}

	public void setMemorialsTime(String memorialsTime) {
		this.memorialsTime = memorialsTime;
	}

	public String getMemorialsParts() {
		return memorialsParts;
	}

	public void setMemorialsParts(String memorialsParts) {
		this.memorialsParts = memorialsParts;
	}

	public String getMemorialsContent() {
		return memorialsContent;
	}

	public void setMemorialsContent(String memorialsContent) {
		this.memorialsContent = memorialsContent;
	}

	public int getMemorialsSelfScore() {
		return memorialsSelfScore;
	}

	public void setMemorialsSelfScore(int memorialsSelfScore) {
		this.memorialsSelfScore = memorialsSelfScore;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Memorials [memorialsNo=" + memorialsNo + ", memorialsType=" + memorialsType + ", memorialsDate="
				+ memorialsDate + ", memorialsTime=" + memorialsTime + ", memorialsParts=" + memorialsParts
				+ ", memorialsContent=" + memorialsContent + ", memorialsSelfScore=" + memorialsSelfScore + ", count="
				+ count + ", createDate=" + createDate + ", status=" + status + "]";
	}

	
	
	

	

}
