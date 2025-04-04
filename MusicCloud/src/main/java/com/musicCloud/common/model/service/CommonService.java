package com.musicCloud.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.dao.CommonDao;
import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.playlist.model.vo.PlayList;

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
	
	
	/**
	 * @return
	 * 설명 : 메인 페이지 최신 게시글 5개 조회 서비스 메소드
	 */
	public ArrayList<Board> mainBoardList(){
		Connection conn = getConnection();
		ArrayList<Board> list = new CommonDao().mainBoardList(conn);
		close(conn);
		return list;
	}
	
	
	/**
	 * @return
	 * 설명 : 메인 페이지 플레이 리스트 조회 서비스 메소드
	 */
	public ArrayList<PlayList> mainPlaylist(int memberNo){
		Connection conn = getConnection();
		ArrayList<PlayList> list = new CommonDao().mainPlaylist(conn, memberNo);
		close(conn);
		return list;
	}
}
