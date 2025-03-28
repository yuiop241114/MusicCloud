package com.musicCloud.playlist.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;

import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.playlist.model.vo.PlayList;

public class PlayListDao {
	private Properties prop = new Properties();
	
	public PlayListDao() {
		String queryPath = PlayListDao.class.getResource("/db/query/playlistQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(queryPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param memberNo
	 * @return
	 * 설명 : 로그인한 회원의 플레이리스트 조회
	 */
	public ArrayList<PlayList> selectAllPlaylist(Connection conn, int memberNo) {
		//select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<PlayList> list = new ArrayList<PlayList>();
		
		String sql = prop.getProperty("selectAllPlaylist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new PlayList(
								  		rset.getInt("mno")
								  	  , rset.getInt("pno")
								  	  , rset.getString("pname")
								  	  , rset.getString("ptag")
								  	  , rset.getString("pstatus")
								  	  , rset.getString("total")
								  	  )
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	/**
	 * @param conn
	 * @return
	 * 설명 : 모든 음원 select Dao
	 */
//	public ArrayList<MusicFile> selectAllMusic(Connection conn){
//		//select
//		ArrayList<MusicFile> list = new ArrayList<MusicFile>();
//		ResultSet rset = null;
//		PreparedStatement pstmt = null;
//		String sql = prop.getProperty("selectAllMusic");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			rset = pstmt.executeQuery();
//			while(rset.next()) {
//				list.add(
//						  new MusicFile(
//								  		 rset.getInt("mno")
//								  	   , rset.getString("fileoriginname")
//								  	   , rset.getString("fileeditname")
//								  	   , rset.getString("filepath")
//								  	   , rset.getString("imageoriginname")
//								  	   , rset.getString("imageeditname")
//								  	   , rset.getString("imagepath")
//								  	   , rset.getInt("category")
//								  	   , rset.getString("mtitle")
//								  	   , rset.getString("msinger")
//								  	   , rset.getInt("mcount")
//								  	   , rset.getInt("mlike")
//								  	   , rset.getInt("mdislike")
//								  	   , rset.getString("lyrics")
//								  	   , rset.getString("status")
//								  	   )
//						);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//			close(rset);
//		}
//		return list;
//	}

}
