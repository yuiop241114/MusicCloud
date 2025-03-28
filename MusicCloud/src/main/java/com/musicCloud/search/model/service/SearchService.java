package com.musicCloud.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.search.model.dao.SearchDao;

public class SearchService {

	/**
	 * @param search
	 * @return
	 * 설명 : 정확도 검색 정보 추출 서비스 메소드
	 */
	public ArrayList<MusicFile> searchListAccuracy(String search) {
		Connection conn = getConnection();
		ArrayList<MusicFile> listAccuracy = new SearchDao().searchListAccuracy(conn, search);
		close(conn);
		return listAccuracy;
	}

	/**
	 * @param search
	 * @return
	 * 설명 : 인기순 검색 정보 추출 서비스 메소드
	 */
	public ArrayList<MusicFile> searchListPoupular(String search) {
		Connection conn = getConnection();
		ArrayList<MusicFile> listPopular = new SearchDao().searchListPouplar(conn, search);
		close(conn);
		return listPopular;
	}

	/**
	 * @param search
	 * @param locationNo
	 * @return
	 * 설명 : 지역별 인기 순위 검색 정보 추출 서비스 메소드
	 */
	public ArrayList<MusicFile> searchListPopularLocation(String search, int locationNo) {
		Connection conn = getConnection();
		ArrayList<MusicFile> listPopularLocation = new SearchDao().searchListPopularLocation(conn, search, locationNo);
		close(conn);
		return listPopularLocation;
		}
	
	
	/**
	 * @param musicNo
	 * @return
	 * 설명 : 음원 재생용 정보 select 서비스 메소드
	 */
	public MusicFile musicSelect(int musicNo) {
		Connection conn = getConnection();
		MusicFile mf = new SearchDao().musicSelect(conn, musicNo);
		close(conn);
		return mf;
	}
	
	/**
	 * @param musicNo
	 * @return
	 * 설명 : 음원 조회수 증가 서비스 메소드
	 */
	public int increaseCount(int musicNo) {
		Connection conn = getConnection();
		int result = new SearchDao().increaseCount(conn, musicNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
}
