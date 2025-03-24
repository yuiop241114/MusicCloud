package com.musicCloud.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.common.JDBCTemplate;
import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.search.model.dao.SearchDao;

public class SearchService {

	public ArrayList<MusicFile> searchListAccuracy(String search) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<MusicFile> listAccuracy = new SearchDao().searchListAccuracy(conn, search);
		
		
		JDBCTemplate.close(conn);
		
		return listAccuracy;
	}

	public ArrayList<MusicFile> searchListPoupular(String search) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<MusicFile> listPopular = new SearchDao().searchListPouplar(conn, search);
		
		JDBCTemplate.close(conn);
		
		return listPopular;
	}

	public ArrayList<MusicFile> searchListPopularLocation(String search, int locationNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<MusicFile> listPopularLocation = new SearchDao().searchListPopularLocation(conn, search, locationNo);
		
		
		JDBCTemplate.close(conn);
		
		return listPopularLocation;
		}
}
