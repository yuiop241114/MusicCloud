package com.musicCloud.myPage.model.vo;

import java.util.Date;

public class Subscribe {
	
	private int memberNo;
	private String startDate;
	private String endDate;
	
	public Subscribe() {}

	public Subscribe(int memberNo, String startDate, String endDate) {
		super();
		this.memberNo = memberNo;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Subscribe [memberNo=" + memberNo + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
