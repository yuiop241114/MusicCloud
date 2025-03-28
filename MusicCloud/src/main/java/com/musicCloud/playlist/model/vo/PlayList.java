package com.musicCloud.playlist.model.vo;

public class PlayList {
	private int playlistNo;
	private int memberNo;
	private String playlistName;
	private String playlistTag;
	private String payment_status;
	
	//개인 플레이리스트 가져올때 사용하는 컬럼
	private String playListMusicTotal;
	
	public PlayList() {}

	public PlayList(int playlistNo, int memberNo, String playlistName, String playlistTag, String payment_status) {
		super();
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.playlistName = playlistName;
		this.playlistTag = playlistTag;
		this.payment_status = payment_status;
	}
	

	/**
	 * @param playlistNo
	 * @param memberNo
	 * @param playlistName
	 * @param playlistTag
	 * @param payment_status
	 * @param playListMusicTotal
	 * 설명 : 개인 플레이 리스트를 가져오기 위한 컬럼을 추가한 생성자
	 */
	public PlayList(int playlistNo, int memberNo, String playlistName, String playlistTag, String payment_status,
			String playListMusicTotal) {
		super();
		this.playlistNo = playlistNo;
		this.memberNo = memberNo;
		this.playlistName = playlistName;
		this.playlistTag = playlistTag;
		this.payment_status = payment_status;
		this.playListMusicTotal = playListMusicTotal;
	}
	
	

	public String getPlayListMusicTotal() {
		return playListMusicTotal;
	}

	public void setPlayListMusicTotal(String playListMusicTotal) {
		this.playListMusicTotal = playListMusicTotal;
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
		return "PlayList [playlistNo=" + playlistNo + ", memberNo=" + memberNo + ", playlistName=" + playlistName
				+ ", playlistTag=" + playlistTag + ", payment_status=" + payment_status + ", playListMusicTotal="
				+ playListMusicTotal + "]";
	}
}
