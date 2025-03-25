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

	public ArrayList<MusicFile> searchListPoupular(String search) {

		Connection conn = getConnection();
		
		ArrayList<MusicFile> listPopular = new SearchDao().searchListPouplar(conn, search);
		
		close(conn);
		
		return listPopular;
	}

	public ArrayList<MusicFile> searchListPopularLocation(String search, int locationNo) {
		
		Connection conn = getConnection();
		
		ArrayList<MusicFile> listPopularLocation = new SearchDao().searchListPopularLocation(conn, search, locationNo);
		
		close(conn);
		
		return listPopularLocation;
		}
}
