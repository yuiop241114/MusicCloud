package com.musicCloud.board.model.vo;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.common.model.vo.PageInfo;

public class Board {
	
	private int boardNo;
	private int playlistNo;
	private int memberNo;
	private int musicNo;
	private String boardTitle;
	private String boardContent;
	private int count;
	private String enrollDate;
	private String status;
	private String category;
	private String boardStatus;
	
	private String memberId;
	private String memberName;
	
	private int reportNo;
	private int reportMemberNo;
	private String reportDate;
	
	public Board() {}

	public Board(int boardNo, int playlistNo, int memberNo, int musicNo, String boardTitle, String boardContent,
			int count, String enrollDate, String status, String category) {
		super();
		this.boardNo = boardNo;
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.musicNo = musicNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.category = category;
	}
	
	

	public Board(int boardNo, int playlistNo, int memberNo, int musicNo, String boardTitle, String boardContent,
			int count, String enrollDate, String status, String category, String boardStatus, String memberId,
			String memberName, int reportNo, int reportMemberNo, String reportDate) {
		super();
		this.boardNo = boardNo;
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.musicNo = musicNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.category = category;
		this.boardStatus = boardStatus;
		this.memberId = memberId;
		this.memberName = memberName;
		this.reportNo = reportNo;
		this.reportMemberNo = reportMemberNo;
		this.reportDate = reportDate;
	}


	public Board(int boardNo, int playlistNo, int memberNo, int musicNo, String boardTitle, String boardContent,
			int count, String enrollDate, String status, String category, String memberId, String memberName) {
		super();
		this.boardNo = boardNo;
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.musicNo = musicNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.category = category;
		this.memberId = memberId;
		this.memberName = memberName;
	}
	
	

	public Board(int boardNo, int playlistNo, int memberNo, int musicNo, String boardTitle, String boardContent,
			int count, String enrollDate, String status, String category, String memberId, String memberName,
			int reportNo, int reportMemberNo, String reportDate) {
		super();
		this.boardNo = boardNo;
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.musicNo = musicNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.enrollDate = enrollDate;
		this.status = status;
		this.category = category;
		this.memberId = memberId;
		this.memberName = memberName;
		this.reportNo = reportNo;
		this.reportMemberNo = reportMemberNo;
		this.reportDate = reportDate;
	}

	

	public Board(int memberNo, String boardTitle, String boardStatus, String memberName) {
		super();
		this.memberNo = memberNo;
		this.boardTitle = boardTitle;
		this.boardStatus = boardStatus;
		this.memberName = memberName;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportMemberNo() {
		return reportMemberNo;
	}

	public void setReportMemberNo(int reportMemberNo) {
		this.reportMemberNo = reportMemberNo;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getPlaylistNo() {
		return playlistNo;
	}

	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
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

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBoardStatus() {
		return boardStatus;
	}
	
	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", playlistNo=" + playlistNo + ", memberNo=" + memberNo + ", musicNo="
				+ musicNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", count=" + count
				+ ", enrollDate=" + enrollDate + ", status=" + status + ", category=" + category + ", boardStatus="
				+ boardStatus + ", memberId=" + memberId + ", memberName=" + memberName + ", reportNo=" + reportNo
				+ ", reportMemberNo=" + reportMemberNo + ", reportDate=" + reportDate + "]";
	}

	

	

	


	
	
}