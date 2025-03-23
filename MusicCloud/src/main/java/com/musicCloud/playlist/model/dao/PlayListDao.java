package com.musicCloud.playlist.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.musicCloud.playlist.model.vo.PlayList;

public class PlayListDao {
	private Properties prop;
	
	public PlayListDao() {
		String queryPath = PlayListDao.class.getResource("db/query/playlistQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(queryPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<PlayList> selectAllPlaylist(int memberNo) {
		//select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<PlayList> list = new ArrayList<PlayList>();
	}

}
