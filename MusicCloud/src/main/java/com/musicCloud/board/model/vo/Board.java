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
	private int boardcount;
	private String enrollDate;
	private String status;
	private String category;
	private String boardStatus;
	private String memberId;
	private String memberName;
	private int reportNo;
	private int reportMemberNo;
	private String reportDate;
	
	private int boardCount;
	//private String boardEnrollDate;
	//게시판 전체 조회시 사용
	private String memberAlias;
	
	public Board() {}

	/**
	 * @param boardNo
	 * @param boardTitle
	 * @param boardCount
	 * @param boardEnrollDate
	 * @param memberNo
	 * @param memberAlias
	 */
	public Board(int boardNo, String boardTitle, int boardCount, String boardEnrollDate, int memberNo,
			String memberAlias) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.enrollDate = boardEnrollDate;
		this.memberNo = memberNo;
		this.memberAlias = memberAlias;
	}
	
	/**
	 * @param boardNo
	 * @param memberNo
	 * @param boardTitle
	 * @param boardContent
	 * @param boardcount
	 * @param enrollDate
	 * @param boardStatus
	 * @param memberName
	 * @param reportNo
	 * @param reportMemberNo
	 * @param reportDate
	 * 게시글 조회
	 */
	public Board(int boardNo, int memberNo, String boardTitle, String boardContent, int boardcount, String enrollDate,
			String boardStatus, String memberName, int reportNo, int reportMemberNo, String reportDate) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardcount = boardcount;
		this.enrollDate = enrollDate;
		this.boardStatus = boardStatus;
		this.memberName = memberName;
		this.reportNo = reportNo;
		this.reportMemberNo = reportMemberNo;
		this.reportDate = reportDate;
	}


	public Board(int boardNo, String boardTitle, int boardCount, String boardEnrollDate, int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.enrollDate = boardEnrollDate;
		this.memberNo = memberNo;
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
	
	public String getMemberAlias() {
		return memberAlias;
	}

	public void setMemberAlias(String memberAlias) {
		this.memberAlias = memberAlias;
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
	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
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


	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
				+ musicNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardcount="
				+ boardcount + ", enrollDate=" + enrollDate + ", status=" + status + ", category=" + category
				+ ", boardStatus=" + boardStatus + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", reportNo=" + reportNo + ", reportMemberNo=" + reportMemberNo + ", reportDate=" + reportDate
				+ ", boardCount=" + boardCount + ", memberAlias=" + memberAlias + "]";
	}




}
