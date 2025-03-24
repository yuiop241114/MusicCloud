package com.musicCloud.common.vo;

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
		
	    
	    //정확도순 뽑기용임
	    public MusicFile(int musicNo, String musicFileOriginName, String musicFileEditName, String musicImageEditName,
				String musicImagePath) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicFileEditName = musicFileEditName;
			this.musicImageEditName = musicImageEditName;
			this.musicImagePath = musicImagePath;
		}
		
	
		//인기순 뽑기용
		public MusicFile(int musicNo, String musicFileOriginName, String musicFileEditName, String musicFileStorePath,
				String musicImageOriginName, String musicImageEditName) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicFileEditName = musicFileEditName;
			this.musicFileStorePath = musicFileStorePath;
			this.musicImageOriginName = musicImageOriginName;
			this.musicImageEditName = musicImageEditName;   // 인기순 숫자를 담아야해서 String 으로 변환 필요
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
					+ ", dislike=" + dislike + ", lyrics=" + lyrics + ", status=" + status + "]";
		}
}
	    
	
	