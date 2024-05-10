package com.kh.exercise.model.vo;

public class Exercise {
	private int exerNo;				//운동고유번호 	: 게시글 고유 번호
	private String exerTitle;		//운동명			: 운동의 이름
	private String exerType;		//운동종류		: 유산소, 무기호흡(근력운동)
	private String exerInf;			//운동횟수		: 운동하려는 횟수
	private String exerContent;	//운동내용		: 해당 운동의 정보 상세내용
	private String exerPart;		//운동부위		: 부위로 목, 어깨, 팔, 가슴, 복근, 허벅지, 종아리 
	//(추가 조언 필요- 운동부위를 나눠보니 거의 무기호흡에 해당, 유산소운동과 운동부위 연관된 운동이 있나요?)
	
	public int getExerNo() {
		return exerNo;
	}
	public void setExerNo(int exerNo) {
		this.exerNo = exerNo;
	}
	public String getExerTitle() {
		return exerTitle;
	}
	public void setExerTitle(String exerTitle) {
		this.exerTitle = exerTitle;
	}
	public String getExerType() {
		return exerType;
	}
	public void setExerType(String exerType) {
		this.exerType = exerType;
	}
	public String getExerInf() {
		return exerInf;
	}
	public void setExerInf(String exerInf) {
		this.exerInf = exerInf;
	}
	public String getExerContent() {
		return exerContent;
	}
	public void setExerContent(String exerContent) {
		this.exerContent = exerContent;
	}
	public String getExerPart() {
		return exerPart;
	}
	public void setExerPart(String exerPart) {
		this.exerPart = exerPart;
	}
	public Exercise(int exerNo, String exerType, String exerTitle, String exerInf, String exerContent, String exerPart) {
		super();
		this.exerNo = exerNo;
		this.exerType = exerType;
		this.exerTitle = exerTitle;
		this.exerInf = exerInf;
		this.exerContent = exerContent;
		this.exerPart = exerPart;
	}
	
	
	
	
	public Exercise() {
		super();
	}
	public String toString() {
		return "Exercise [exerNo=" + exerNo + ", exerTitle=" + exerTitle + ", exerType=" + exerType + ", exerInf="
				+ exerInf + ", exerContent=" + exerContent + ", exerPart=" + exerPart + "]";
	}
	
}
