package com.musicCloud.search.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.common.vo.MusicFile;

public class SearchDao {
	
	private Properties prop = new Properties();
	
	public SearchDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(SearchDao.class.getResource("/db/query/searchQuery.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param conn
	 * @param search
	 * @return
	 * 설명 : 정확도 검색 정보 추출 Dao
	 */
	public ArrayList<MusicFile> searchListAccuracy(Connection conn, String search) {
		ArrayList<MusicFile> listAccuracy = new ArrayList<MusicFile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search +"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listAccuracy.add(new MusicFile(
									    rset.getInt("MUSIC_NO")
									  , rset.getString("MUSIC_PATH")
									  , rset.getString("IMAGE_PATH")
									  , rset.getString("MUSIC_TITLE")
									  , rset.getString("MUSIC_SINGER")
									)
								);
							}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listAccuracy;
	}
	
	public ArrayList<MusicFile> searchListPouplar(Connection conn, String search) {
		
		ArrayList<MusicFile> listPopular = new ArrayList<MusicFile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchListPopular");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search +"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
					listPopular.add(new MusicFile(
												  rset.getInt("MUSIC_NO") 
												, rset.getString("MUSIC_TITLE")
												, rset.getString("MUSIC_SINGER")
												, rset.getString("MUSIC_IMAGE_EDIT_NAME")
												, rset.getString("MUSIC_IMAGE_PATH")
												, rset.getString("POPULAR")    // Int로 바꿔줘야함
												)
					);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return listPopular;
	}
	public ArrayList<MusicFile> searchListPopularLocation(Connection conn, String search, int locationNo) {
		ArrayList<MusicFile> listPopular = new ArrayList<MusicFile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchListPopularLocation");

		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, locationNo);
			pstmt.setString(2, "%" + search + "%");
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				listPopular.add(new MusicFile(
											  rset.getInt("MUSIC_NO") 
											, rset.getString("MUSIC_TITLE")
											, rset.getString("MUSIC_SINGER")
											, rset.getString("MUSIC_IMAGE_EDIT_NAME")
											, rset.getString("MUSIC_IMAGE_PATH")
											, rset.getString("POPULAR")    // Int로 바꿔줘야함
											)
							);
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		// 보류
		return listPopular;
	}		
}


