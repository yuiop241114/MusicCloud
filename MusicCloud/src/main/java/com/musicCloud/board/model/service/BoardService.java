package com.musicCloud.board.model.service;

import static com.musicCloud.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.board.model.dao.BoardDao;
import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		int result = 0;
		
		
		
		
		return result;
	}

	public ArrayList<Board> adminselectList(PageInfo pi) {

		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().adminselectList(conn, pi);
		
		close(conn);
		return list;
	}
	
	
	
	

}