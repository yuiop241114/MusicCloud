package com.musicCloud.board.model.service;

import static com.musicCloud.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.board.model.dao.BoardDao;
import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;
import com.musicCloud.member.model.dao.MemberDao;
import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;

public class BoardService {
	

	/**
	 * @param pi
	 * @return 설명 : 멤버에서 받아오는 전체 회원리스트
	 */
	public ArrayList<Member> adminMemberList(PageInfo pi) {

		Connection conn = getConnection();
		ArrayList<Member> list = new BoardDao().adminMemberList(conn, pi);
		
		close(conn);
		return list;
	}
	
	public int adminMemberCount() {
		Connection conn = getConnection();
		int result = new MemberDao().selectMemberCount(conn);
		
		close(conn);
		return result;
	}
	
	

	public ArrayList<Board> adminReportList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().adminReportList(conn, pi);
		
		close(conn);
		return list;
	}


	public int adminMusicCount() {
		Connection conn = getConnection();
		int result = new BoardDao().adminMusicCount(conn);
		
		
		close(conn);
		return result;
	}

	
	/**
	 * @return
	 * 설명 : 음원전체조회 후 리스트 나오게하려했는데 음원파일 기본생성자 클래스가 없음
	 */
	/*
	public ArrayList<Music> adminSelectMusic(){

	}
	*/



	
	
	
	

}