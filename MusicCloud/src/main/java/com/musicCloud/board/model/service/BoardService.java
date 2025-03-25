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
	
	/**
	 * @return
	 * 설명 : 멤버에서 받아온 전체 회원의 수
	 */
	public int adminMemberCount() {
		Connection conn = getConnection();
		int result = new MemberDao().selectMemberCount(conn);
		
		close(conn);
		return result;
	}

	/**
	 * @param pi
	 * @return
	 * 보드 게시글조회
	 */
	public ArrayList<Board> adminBoardView(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().adminBoardView(conn, pi);
		

		
		close(conn);
		return list;
	}
	
	/**
	 * @return
	 * 보드 전체 카운트
	 */
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = new BoardDao().selectBoardCount(conn);
		
		close(conn);
		return result;
	}
	
	public int deleteBoards(String[] boardReportTitle) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteBoards(conn, boardReportTitle);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
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