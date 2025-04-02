package com.musicCloud.board.model.vo;

public class Report {
	
	private int reportNo;
	private String reportName;
	
	public Report() {}

	public Report(int reportNo, String reportName) {
		super();
		this.reportNo = reportNo;
		this.reportName = reportName;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportName=" + reportName + "]";
	}
	
	
}