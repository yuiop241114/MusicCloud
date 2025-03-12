package com.musicCloud.search.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class SearchDao {
	
	private Properties prop = new Properties();
	
	public void searchList(Connection conn, String search) {
		
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("");
		

	}

}
