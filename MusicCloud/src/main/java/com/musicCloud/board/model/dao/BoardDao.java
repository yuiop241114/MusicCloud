package com.musicCloud.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate. *;

import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;
import com.musicCloud.member.model.vo.Member;

import oracle.net.aso.p;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML( new FileInputStream( BoardDao.class.getResource("/db/query/board-mapper.xml").getPath() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param conn
	 * @param pi
	 * @return 설명 : 멤버객체에서 받아오는 전체 회원 리스트
	 */
	public ArrayList<Member> adminMemberList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {

				
				list.add(
							new Member(
						        rset.getInt("member_no")
						      , rset.getInt("location_no")
						      , rset.getString("member_id")
						      , rset.getString("member_pwd")
						      , rset.getString("member_name")
						      , rset.getString("member_alias")
						      , rset.getString("email")
						      , rset.getString("gender")
						      , rset.getInt("age")
						      , rset.getDate("enroll_date")
						      , rset.getInt("report_count")
						      , rset.getString("status")
						      , rset.getString("pf_status")
						      )
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return list;
	}

	/**
	 * @param conn
	 * @param pi
	 * @return Board객체에서 받아오는 회원 신고 리스트
	 */
	public ArrayList<Board> adminBoardView(Connection conn, PageInfo pi) {

		ArrayList<Board> list = new ArrayList<Board>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(
						new Board(
								rset.getInt("memberNo")
								, rset.getString("memberName")
								, rset.getString("memberNo")
								, rset.getString("BoardStatus")
								)
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
		
	}
	
	public int selectBoardCount(Connection conn) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("BC");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	
	/**
	 * @param conn
	 * @return 음악 전체 카운트
	 */
	public int adminMusicCount(Connection conn) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminMusicCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("M");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}

	
	
	

}