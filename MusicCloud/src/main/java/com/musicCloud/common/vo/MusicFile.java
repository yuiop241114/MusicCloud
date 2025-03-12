package com.musicCloud.common.vo;

public class MusicFile {

	    private int musicNo;
	    private String musicFileOriginName;
	    private String musicFileEditName;
	    private String musicFileStorePath;
	    private String musicImageOriginName;
	    private String musicImageEditName;
	    private String musicImagePath;
	    
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
		
	    
	    // 이거 정확도순 뽑기용임
	    
	    public MusicFile(int musicNo, String musicFileOriginName, String musicFileEditName, String musicImageEditName,
				String musicImagePath) {
			super();
			this.musicNo = musicNo;
			this.musicFileOriginName = musicFileOriginName;
			this.musicFileEditName = musicFileEditName;
			this.musicImageEditName = musicImageEditName;
			this.musicImagePath = musicImagePath;
		}
		
	
		// 이거 인기순 뽑기용
		

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
		
		
		
		// 이거 지역별 인기순 뽑기용
		
		
		
		
		
		
		
		



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
					+ ", musicImagePath=" + musicImagePath + "]";
		}    
}
	    
	
	