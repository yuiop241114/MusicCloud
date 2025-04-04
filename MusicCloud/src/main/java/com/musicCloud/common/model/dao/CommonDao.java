package com.musicCloud.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;

import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.playlist.model.vo.PlayList;

public class CommonDao {

	private Properties prop = new Properties();
	
	public CommonDao() {
		String sqlPath = CommonDao.class.getResource("/db/query/commonQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(sqlPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param conn
	 * @return
	 * 설명 : 전체 음원 표지 출력데이터 조회 Dao
	 */
	public ArrayList<MusicFile> selectMusicInfo(Connection conn){
		//select 
		ArrayList<MusicFile> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMusicInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new MusicFile(
								         rset.getInt("mno")
								       , rset.getString("IMAGE_PATH")
								       , rset.getInt("category")
								       , rset.getString("mtitle")
								       , rset.getString("msinger")
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
	 * 설명 : 인기순 음원 표지 출력 데이터 조회 Dao
	 */
	public ArrayList<MusicFile> mainPopularMusic(Connection conn){
		//select
		ArrayList<MusicFile> list = new ArrayList<MusicFile>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mainPopularMusic");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new MusicFile(
								  	     rset.getInt("MNO")
								  	     , rset.getString("IMAGE_PATH")
								  	     , rset.getString("mtitle")
								       , rset.getString("msinger")
								       , rset.getInt("music_count")
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
	 * 설명 : 메인페이지 최신 게시물 5개 조회 Dao
	 */
	public ArrayList<Board> mainBoardList(Connection conn){
		//select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = prop.getProperty("mainBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
						  new Board(
								  	 rset.getInt("board_no")
							  	   , rset.getString("board_title")
							  	   , rset.getInt("board_count")
							  	   , rset.getString("board_date")
								   , rset.getInt("member_no")
								   , rset.getString("member_alias")
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
	 * 설명 : 메인 페이지 플레이 리스트 정보 조회 Dao
	 */
	public ArrayList<PlayList> mainPlaylist(Connection conn, int memberNo){
		//select
		ArrayList<PlayList> list = new ArrayList<PlayList>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mainPlaylist");
		
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
}
