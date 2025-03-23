package com.musicCloud.playlist.model.vo;

public class PlayList {
	private int playlistNo;
	private int memberNo;
	private String playlistName;
	private String playlistTag;
	private String payment_status;
	
	public PlayList() {}

	public PlayList(int playlistNo, int memberNo, String playlistName, String playlistTag, String payment_status) {
		super();
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.playlistName = playlistName;
		this.playlistTag = playlistTag;
		this.payment_status = payment_status;
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

	public String getPlaylistName() {
		return playlistName;
	}

	public void setPlaylistName(String playlistName) {
		this.playlistName = playlistName;
	}

	public String getPlaylistTag() {
		return playlistTag;
	}

	public void setPlaylistTag(String playlistTag) {
		this.playlistTag = playlistTag;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	@Override
	public String toString() {
		return "playList [playlistNo=" + playlistNo + ", memberNo=" + memberNo + ", playlistName=" + playlistName
				+ ", playlistTag=" + playlistTag + ", payment_status=" + payment_status + "]";
	}
}
