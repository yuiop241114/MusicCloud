package com.musicCloud.board.model.vo;


public class ReportDetail {
	
	private int MemberNo;
	private int ReportNo;
	private int ReportMemberNo;
	private String ReportDate;
	
	public ReportDetail() {}

	public ReportDetail(int memberNo, int reportNo, int reportMemberNo, String reportDate) {
		super();
		MemberNo = memberNo;
		ReportNo = reportNo;
		ReportMemberNo = reportMemberNo;
		ReportDate = reportDate;
	}

	public int getMemberNo() {
		return MemberNo;
	}

	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	public int getReportNo() {
		return ReportNo;
	}

	public void setReportNo(int reportNo) {
		ReportNo = reportNo;
	}

	public int getReportMemberNo() {
		return ReportMemberNo;
	}

	public void setReportMemberNo(int reportMemberNo) {
		ReportMemberNo = reportMemberNo;
	}

	public String getReportDate() {
		return ReportDate;
	}

	public void setReportDate(String reportDate) {
		ReportDate = reportDate;
	}

	@Override
	public String toString() {
		return "ReportDetail [MemberNo=" + MemberNo + ", ReportNo=" + ReportNo + ", ReportMemberNo=" + ReportMemberNo
				+ ", ReportDate=" + ReportDate + "]";
	}
	
	

}