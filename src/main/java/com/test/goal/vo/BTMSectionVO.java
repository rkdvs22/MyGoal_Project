package com.test.goal.vo;

/*
* 작성자 강주영
* BTMSection를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class BTMSectionVO {
	
	private int BTMSectionNum;
	private int SectionNum;
	
	public BTMSectionVO() {
	}

	public int getBTMSectionNum() {
		return BTMSectionNum;
	}

	public void setBTMSectionNum(int bTMSectionNum) {
		BTMSectionNum = bTMSectionNum;
	}

	public int getSectionNum() {
		return SectionNum;
	}

	public void setSectionNum(int sectionNum) {
		SectionNum = sectionNum;
	}

	@Override
	public String toString() {
		return "BTMSectionVO [BTMSectionNum=" + BTMSectionNum + ", SectionNum=" + SectionNum + "]";
	}
	
}
