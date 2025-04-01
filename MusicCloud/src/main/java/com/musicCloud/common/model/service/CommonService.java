package com.musicCloud.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.common.model.dao.CommonDao;
import com.musicCloud.common.vo.MusicFile;

import static com.musicCloud.common.JDBCTemplate.*;

public class CommonService {

	
	/**
	 * @return
	 * 설명 : 전체 음원 표지 출력 데이터 조회 서비스 메소드
	 */
	public ArrayList<MusicFile> selectMusicInfo(){
		Connection conn = getConnection();
		ArrayList<MusicFile> list = new CommonDao().selectMusicInfo(conn);
		close(conn);
		return list;
	}
	
	/**
	 * @return
	 * 설명 : 인기순 음원 표지 출력 데이터 조회 서비스 메소드
	 */
	public ArrayList<MusicFile> mainPopularMusic(){
		Connection conn = getConnection();
		ArrayList<MusicFile> list = new CommonDao().mainPopularMusic(conn);
		close(conn);
		return list;
	}
}
