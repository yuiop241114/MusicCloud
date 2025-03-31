package com.musicCloud.member.model.vo;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private int boardCount;
	private String boardEnrollDate;
	private int memberNo;
	
	public Board() {}

	public Board(int boardNo, String boardTitle, int boardCount, String boardEnrollDate, int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardEnrollDate = boardEnrollDate;
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getBoardEnrollDate() {
		return boardEnrollDate;
	}

	public void setBoardEnrollDate(String boardEnrollDate) {
		this.boardEnrollDate = boardEnrollDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardCount=" + boardCount
				+ ", boardEnrollDate=" + boardEnrollDate + ", memberNo=" + memberNo + "]";
	}

}
