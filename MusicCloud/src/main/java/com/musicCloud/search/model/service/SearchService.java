package com.musicCloud.search.model.service;

import java.sql.Connection;

import com.musicCloud.common.JDBCTemplate;
import com.musicCloud.search.model.dao.SearchDao;

public class SearchService {

	public void searchList(String search) {
	
		Connection conn = JDBCTemplate.getConnection();
		
		new SearchDao().searchList(conn, search);
		
		JDBCTemplate.close(conn);
	
	}

}
