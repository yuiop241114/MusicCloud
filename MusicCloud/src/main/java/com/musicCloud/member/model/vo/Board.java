package com.musicCloud.member.model.vo;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private int boardCount;
	private String boardEnrollDate;
	private int memberNo;
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
	 * 전체 매개변수 생성자
	 */
	public Board(int boardNo, String boardTitle, int boardCount, String boardEnrollDate, int memberNo,
			String memberAlias) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardEnrollDate = boardEnrollDate;
		this.memberNo = memberNo;
		this.memberAlias = memberAlias;
	}


	
	/**
	 * @param boardNo
	 * @param boardTitle
	 * @param boardCount
	 * @param boardEnrollDate
	 * @param memberNo
	 */
	public Board(int boardNo, String boardTitle, int boardCount, String boardEnrollDate, int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardCount = boardCount;
		this.boardEnrollDate = boardEnrollDate;
		this.memberNo = memberNo;
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
				+ ", boardEnrollDate=" + boardEnrollDate + ", memberNo=" + memberNo + ", memberAlias=" + memberAlias
				+ "]";
	}

}
