package com.musicCloud.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
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
	 * @return Board객체에서 받아오는 게시글 조회
	 */
	public ArrayList<Board> adminBoardView(Connection conn, PageInfo pi) {
	    ArrayList<Board> list = new ArrayList<>();
	    ResultSet rset = null;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("adminBoardListView");

	    try {
	        pstmt = conn.prepareStatement(sql);
	        rset = pstmt.executeQuery();

	        while (rset.next()) {
	            list.add(new Board(
	                rset.getInt("boardNo"),
	                rset.getInt("memberNo"),
	                rset.getString("boardTitle"),
	                rset.getString("boardContent"),
	                rset.getInt("boardCount"),
	                rset.getString("boardEnrollDate"),
	                rset.getString("boardStatus"),
	                rset.getString("memberName"),
	                rset.getInt("reportNo"),
	                rset.getInt("reportMemberNo"),
	                rset.getString("reportDate")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rset);
	        close(pstmt);
	    }

	    return list;
	}

	
	/**
	 * @param conn
	 * @return 게시글 전체 카운트
	 */
	public int selectBoardCount(Connection conn) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
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
	 * @param boardReportTitle
	 * @return 게시글 삭제 메소드
	 */
	public int admindeleteBoards(Connection conn, String[] boardReportDelete) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String baseSql = prop.getProperty("adminDeleteBoard");
			
			String placeholders = String.join(",", Collections.nCopies(boardReportDelete.length, "?"));
			String sql = baseSql.replace("?", placeholders);
			
				pstmt = conn.prepareStatement(sql);
				
				for(int i = 0; i<boardReportDelete.length; i++) {
					pstmt.setInt(i + 1, Integer.parseInt(boardReportDelete[i]));
				}
				
				result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public int admininsertBoards(Connection conn, String[] boardReportInsert) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String baseSql = prop.getProperty("adminInsertBoard");
			
			String placeholders = String.join(",", Collections.nCopies(boardReportInsert.length, "?"));
			String sql = baseSql.replace("?", placeholders);
			
				pstmt = conn.prepareStatement(sql);
				
				for(int i = 0; i<boardReportInsert.length; i++) {
					pstmt.setInt(i + 1, Integer.parseInt(boardReportInsert[i]));
				}
				
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