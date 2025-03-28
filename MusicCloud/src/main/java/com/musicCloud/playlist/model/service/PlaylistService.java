package com.musicCloud.playlist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.musicCloud.common.JDBCTemplate.*;

import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.playlist.model.dao.PlayListDao;
import com.musicCloud.playlist.model.vo.PlayList;

public class PlaylistService {

	/**
	 * @param memberNo
	 * @return
	 * 설명 : 회원번호로 플레이 리스트 조회 서비스 메소드
	 */
	public ArrayList<PlayList> selectAllPlaylist(int memberNo) {
		Connection conn = getConnection();
		ArrayList<PlayList> list = new PlayListDao().selectAllPlaylist(conn, memberNo);
		close(conn);
		return list;
	}
	
	public ArrayList<MusicFile> selectAllMusic() {
		Connection conn = getConnection();
		ArrayList<MusicFile> list = new PlayListDao().selectAllMusic(conn);
		close(conn);
		return list;
	}
}
