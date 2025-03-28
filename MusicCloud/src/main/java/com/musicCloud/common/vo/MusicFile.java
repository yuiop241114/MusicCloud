package com.musicCloud.common.vo;

import java.util.Date;

public class MusicFile {

	    private int musicNo;
	    private String musicFileOriginName;
	    private String musicFileEditName;
	    private String musicFileStorePath;
	    private String musicImageOriginName;
	    private String musicImageEditName;
	    private String musicImagePath;
	    
	    //음원 정보랑 같이 가져올때 사용
	    private int musicCategoryNo;
	    private String musicTitle;
	    private String musicSinger;
	    private int musicCount;
	    private int like;
	    private int dislike;
	    private String lyrics;
	    private String status;
	    
	    //음원 댓글 관련 컬럼
	    private int commentNo;
	    private int commentMemberNo;
	    private String commentContent;
	    private int commentLike;
	    private int commentDislike;
	    private Date commentDate;
	    
	    
	    public MusicFile() {}
		public MusicFile(int musicNo, String musicFileOriginName, String musicFileEditName, String musicFileStorePath,
				String musicImageOriginName, String musicImageEditName, String musicImagePath) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicFileEditName = musicFileEditName;
			this.musicFileStorePath = musicFileStorePath;
			this.musicImageOriginName = musicImageOriginName;
			this.musicImageEditName = musicImageEditName;
			this.musicImagePath = musicImagePath;
		}
		
		/**
		 * @param musicNo
		 * @param musicFileStorePath
		 * @param musicImagePath
		 * @param musicTitle
		 * @param musicSinger
		 * 설명 : 정확도 음원 정보 저장 생성자
		 */
		public MusicFile(int musicNo, String musicFileStorePath, String musicImagePath, String musicTitle,
				String musicSinger) {
			super();
			this.musicNo = musicNo;
			this.musicFileStorePath = musicFileStorePath;
			this.musicImagePath = musicImagePath;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
		}
		
		/**
		 * @param musicNo
		 * @param musicImagePath
		 * @param musicTitle
		 * @param musicSinger
		 * @param musicCount
		 * 설명 : 인기순 음원 정보 저장 생성자
		 */
		public MusicFile(int musicNo, String musicImagePath, String musicTitle, String musicSinger, int musicCount) {
			super();
			this.musicNo = musicNo;
			this.musicImagePath = musicImagePath;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
			this.musicCount = musicCount;
		}
		
		
		
		/**
		 * @param musicNo
		 * @param musicFileOriginName : 지역이름 담을 변수
		 * @param musicImagePath
		 * @param musicTitle
		 * @param musicSinger
		 * @param musicCount
		 * 설명 : 지역별 인기 순위 정보 저장 생성자
		 */
		public MusicFile(int musicNo, String musicFileOriginName, String musicImagePath, String musicTitle,
				String musicSinger, int musicCount) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicImagePath = musicImagePath;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
			this.musicCount = musicCount;
		}
		/**
		 * @param musicNo
		 * @param musicFileOriginName
		 * @param musicFileEditName
		 * @param musicFileStorePath
		 * @param musicImageOriginName
		 * @param musicImageEditName
		 * @param musicImagePath
		 * @param musicCategoryNo
		 * @param musicTitle
		 * @param musicSinger
		 * @param musicCount
		 * @param like
		 * @param dislike
		 * @param lyrics
		 * @param status
		 * 설명 : 플레이 리스트 음원 출력용 생성자
		 */
		public MusicFile(int musicNo, String musicFileOriginName, String musicFileEditName, String musicFileStorePath,
				String musicImageOriginName, String musicImageEditName, String musicImagePath, int musicCategoryNo,
				String musicTitle, String musicSinger, int musicCount, int like, int dislike, String lyrics,
				String status) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicFileEditName = musicFileEditName;
			this.musicFileStorePath = musicFileStorePath;
			this.musicImageOriginName = musicImageOriginName;
			this.musicImageEditName = musicImageEditName;
			this.musicImagePath = musicImagePath;
			this.musicCategoryNo = musicCategoryNo;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
			this.musicCount = musicCount;
			this.like = like;
			this.dislike = dislike;
			this.lyrics = lyrics;
			this.status = status;
		}
		
		
		/**
		 * @param musicNo
		 * @param musicFileStorePath
		 * @param musicImagePath
		 * @param musicTitle
		 * @param musicSinger
		 * @param musicCount
		 * @param like
		 * @param dislike
		 * @param lyrics
		 * 설명 : 음원 재생용 정보 담는 생성자
		 */
		public MusicFile(int musicNo, String musicFileStorePath, String musicImagePath, String musicTitle,
				String musicSinger, int musicCount, int like, int dislike, String lyrics) {
			super();
			this.musicNo = musicNo;
			this.musicFileStorePath = musicFileStorePath;
			this.musicImagePath = musicImagePath;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
			this.musicCount = musicCount;
			this.like = like;
			this.dislike = dislike;
			this.lyrics = lyrics;
		}
		
		
		/**
		 * @param musicNo
		 * @param musicImagePath
		 * @param musicCategoryNo
		 * @param musicTitle
		 * @param musicSinger
		 * 설명 : 모든 음원 표지 출력 데이터 저장 생성자
		 */
		public MusicFile(int musicNo, String musicImagePath, int musicCategoryNo, String musicTitle,
				String musicSinger) {
			super();
			this.musicNo = musicNo;
			this.musicImagePath = musicImagePath;
			this.musicCategoryNo = musicCategoryNo;
			this.musicTitle = musicTitle;
			this.musicSinger = musicSinger;
		}
		
		
		
		public int getCommentNo() {
			return commentNo;
		}
		public void setCommentNo(int commentNo) {
			this.commentNo = commentNo;
		}
		public int getCommentMemberNo() {
			return commentMemberNo;
		}
		public void setCommentMemberNo(int commentMemberNo) {
			this.commentMemberNo = commentMemberNo;
		}
		public String getCommentContent() {
			return commentContent;
		}
		public void setCommentContent(String commentContent) {
			this.commentContent = commentContent;
		}
		public int getCommentLike() {
			return commentLike;
		}
		public void setCommentLike(int commentLike) {
			this.commentLike = commentLike;
		}
		public int getCommentDislike() {
			return commentDislike;
		}
		public void setCommentDislike(int commentDislike) {
			this.commentDislike = commentDislike;
		}
		public Date getCommentDate() {
			return commentDate;
		}
		public void setCommentDate(Date commentDate) {
			this.commentDate = commentDate;
		}
		public int getMusicCategoryNo() {
			return musicCategoryNo;
		}
		public void setMusicCategoryNo(int musicCategoryNo) {
			this.musicCategoryNo = musicCategoryNo;
		}
		public String getMusicTitle() {
			return musicTitle;
		}
		public void setMusicTitle(String musicTitle) {
			this.musicTitle = musicTitle;
		}
		public String getMusicSinger() {
			return musicSinger;
		}
		public void setMusicSinger(String musicSinger) {
			this.musicSinger = musicSinger;
		}
		public int getMusicCount() {
			return musicCount;
		}
		public void setMusicCount(int musicCount) {
			this.musicCount = musicCount;
		}
		public int getLike() {
			return like;
		}
		public void setLike(int like) {
			this.like = like;
		}
		public int getDislike() {
			return dislike;
		}
		public void setDislike(int dislike) {
			this.dislike = dislike;
		}
		public String getLyrics() {
			return lyrics;
		}
		public void setLyrics(String lyrics) {
			this.lyrics = lyrics;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public int getMusicNo() {
			return musicNo;
		}

		public void setMusicNo(int musicNo) {
			this.musicNo = musicNo;
		}

		public String getMusicFileOriginName() {
			return musicFileOriginName;
		}

		public void setMusicFileOriginName(String musicFileOriginName) {
			this.musicFileOriginName = musicFileOriginName;
		}

		public String getMusicFileEditName() {
			return musicFileEditName;
		}

		public void setMusicFileEditName(String musicFileEditName) {
			this.musicFileEditName = musicFileEditName;
		}

		public String getMusicFileStorePath() {
			return musicFileStorePath;
		}

		public void setMusicFileStorePath(String musicFileStorePath) {
			this.musicFileStorePath = musicFileStorePath;
		}

		public String getMusicImageOriginName() {
			return musicImageOriginName;
		}

		public void setMusicImageOriginName(String musicImageOriginName) {
			this.musicImageOriginName = musicImageOriginName;
		}

		public String getMusicImageEditName() {
			return musicImageEditName;
		}

		public void setMusicImageEditName(String musicImageEditName) {
			this.musicImageEditName = musicImageEditName;
		}

		public String getMusicImagePath() {
			return musicImagePath;
		}

		public void setMusicImagePath(String musicImagePath) {
			this.musicImagePath = musicImagePath;
		}
		@Override
		public String toString() {
			return "MusicFile [musicNo=" + musicNo + ", musicFileOriginName=" + musicFileOriginName
					+ ", musicFileEditName=" + musicFileEditName + ", musicFileStorePath=" + musicFileStorePath
					+ ", musicImageOriginName=" + musicImageOriginName + ", musicImageEditName=" + musicImageEditName
					+ ", musicImagePath=" + musicImagePath + ", musicCategoryNo=" + musicCategoryNo + ", musicTitle="
					+ musicTitle + ", musicSinger=" + musicSinger + ", musicCount=" + musicCount + ", like=" + like
					+ ", dislike=" + dislike + ", lyrics=" + lyrics + ", status=" + status + ", commentNo=" + commentNo
					+ ", commentMemberNo=" + commentMemberNo + ", commentContent=" + commentContent + ", commentLike="
					+ commentLike + ", commentDislike=" + commentDislike + ", commentDate=" + commentDate + "]";
		}
		
		
}
	    
	
	