package com.musicCloud.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;

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

	public ArrayList<Board> adminselectList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<Board>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminselectList");
		
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
								   rset.getInt("board_no")
								 , rset.getInt("playlist_no")
								 , rset.getInt("member_no")
								 , rset.getInt("music_no")
								 , rset.getString("board_title")
								 , rset.getString("board_content")
								 , rset.getInt("count")
								 , rset.getString("enroll_date")
								 , rset.getString("status")
								 , rset.getString("category")
								 )
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	

}