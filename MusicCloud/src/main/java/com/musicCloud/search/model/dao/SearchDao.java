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
		String sql = prop.getProperty("searchAccuracyList");

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
	
	/**
	 * @param conn
	 * @param search
	 * @return
	 * 설명 : 인기순 검색 정보 추출 Dao
	 */
	public ArrayList<MusicFile> searchListPouplar(Connection conn, String search) {
		
		ArrayList<MusicFile> listPopular = new ArrayList<MusicFile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPopularList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%" + search +"%");
			pstmt.setString(2, "%" + search +"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
					listPopular.add(new MusicFile(
												  rset.getInt("MUSIC_NO") 
												, rset.getString("IMAGE_PATH")
												, rset.getString("MUSIC_TITLE")
												, rset.getString("MUSIC_SINGER")
												, rset.getInt("POPULAR")
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
	
	
	/**
	 * @param conn
	 * @param search
	 * @param locationNo
	 * @return
	 * 설명 : 지역별 인기 순위 정보 추출 Dao
	 */
	public ArrayList<MusicFile> searchListPopularLocation(Connection conn, String search, int locationNo) {
		ArrayList<MusicFile> listPopular = new ArrayList<MusicFile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchPopularLocationList");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, locationNo);
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listPopular.add(new MusicFile(
											  rset.getInt("MUSIC_NO") 
											, rset.getString("LOCATION_NAME")
											, rset.getString("IMAGE_PATH")
											, rset.getString("MUSIC_TITLE")
											, rset.getString("MUSIC_SINGER")
											, rset.getInt("POPULAR")    // Int로 바꿔줘야함
											)
							);
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listPopular;
	}	
	
	/**
	 * @param conn
	 * @param musicNo
	 * @return
	 * 설명 : 음원 재생에 필요한 정보 select Dao
	 */
	public MusicFile musicSelect(Connection conn, int musicNo) {
		//select 
		MusicFile mf = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("musicSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, musicNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				mf = new MusicFile(
					    rset.getInt("MUSIC_NO")
					  , rset.getString("MUSIC_PATH")
					  , rset.getString("IMAGE_PATH")
					  , rset.getString("MUSIC_TITLE")
					  , rset.getString("MUSIC_SINGER")
					  , rset.getInt("music_count")
					  , rset.getInt("music_like")
					  , rset.getInt("music_dislike")
					  , rset.getString("LYRICS")
					);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return mf;
	}
	
	/**
	 * @param conn
	 * @param musicNo
	 * @return
	 * 설명 : 음원 조회수 증가 Dao
	 */
	public int increaseCount(Connection conn, int musicNo) {
		//update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, musicNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * @param conn
	 * @param memberNo
	 * @param musicNo
	 * @return
	 * 설명 : 음원 실행시 현재 음원을 최근 감상한 음원으로 갱신 Dao
	 */
	public int updateRecentMusic(Connection conn, int memberNo, int musicNo) {
		//update 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateRecentMusic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, musicNo);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}


