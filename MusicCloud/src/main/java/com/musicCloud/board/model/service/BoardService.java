package com.musicCloud.board.model.service;

import static com.musicCloud.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.board.model.dao.BoardDao;
import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;
import com.musicCloud.member.model.vo.Member;

public class BoardService {
	
	public ArrayList<Member> adminMemberList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Member> list = new BoardDao().adminselectList(conn, pi);
		
		close(conn);
		return list;
	}

	public ArrayList<Member> adminselectList(PageInfo pi) {

		Connection conn = getConnection();
		ArrayList<Member> list = new BoardDao().adminselectList(conn, pi);
		
		close(conn);
		return list;
	}

	public ArrayList<Board> adminReportList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().adminReportList(conn, pi);
		
		close(conn);
		return list;
	}

	public int adminselectList() {
		// TODO Auto-generated method stub
		return 0;
	}


	
	
	
	

}