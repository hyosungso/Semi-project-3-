package com.kh.market.model.vo;

import java.sql.Date;

public class Attachment {
	private int fileNo;
	private int refNo;
	private int fileLev;
	private String originName;
	private String changeName;
	private String status;
	private String filePath;
	private Date uploadDate;
	
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Attachment(int fileNo, int refNo, int fileLev, String originName, String changeName, String status,
			String filePath, Date uploadDate) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.fileLev = fileLev;
		this.originName = originName;
		this.changeName = changeName;
		this.status = status;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public int getRefNo() {
		return refNo;
	}


	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}


	public int getFileLev() {
		return fileLev;
	}


	public void setFileLev(int fileLev) {
		this.fileLev = fileLev;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", fileLev=" + fileLev + ", originName="
				+ originName + ", changeName=" + changeName + ", status=" + status + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + "]";
	}
	
	
	
	
}
