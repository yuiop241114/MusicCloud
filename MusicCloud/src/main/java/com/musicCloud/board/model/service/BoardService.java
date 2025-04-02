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

import java.sql.SQLException;
import java.util.List;


import static com.musicCloud.common.JDBCTemplate.*;

public class BoardService {
	private BoardDao boardDao = new BoardDao();

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
	
	public int admindeleteBoards(String[] boardReportDelete) {
		Connection conn = getConnection();
		int result = new BoardDao().admindeleteBoards(conn, boardReportDelete);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int admininsertBoards(String[] boardReportInsert) {
		Connection conn = getConnection();
		int result = new BoardDao().admininsertBoards(conn, boardReportInsert);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
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



	
	
	
	





    

    // 게시글 목록 조회
    public List<Board> getAllBoards() {
        Connection conn = getConnection();
        List<Board> list = null;
        try {
            list = boardDao.getAllBoards(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn);
        }
        return list;
    }

    // 게시글 등록
    public int insertBoard(Board board) {
        Connection conn = getConnection();
        int result = 0;
        try {
            result = boardDao.insertBoard(conn, board);
            if (result > 0) {
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);
        } finally {
            close(conn);
        }
        return result;
    }

    // 게시글 수정
    public int updateBoard(Board board) {
        Connection conn = getConnection();
        int result = 0;
        try {
            result = boardDao.updateBoard(conn, board);
            if (result > 0) {
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);
        } finally {
            close(conn);
        }
        return result;
    }
    
    

    // 게시글 삭제
    public int deleteBoard(int boardNo) {
        Connection conn = getConnection();
        int result = 0;
        try {
            result = boardDao.deleteBoard(conn, boardNo);
            if (result > 0) {
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            rollback(conn);
        } finally {
            close(conn);
        }
        return result;
    }

    // 게시글 조회
    public Board getBoardById(int boardNo) {
        Connection conn = getConnection();
        Board board = null;
        try {
            board = boardDao.getBoardById(conn, boardNo);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn);
        }
        return board;
    }
    
    public int selectListCount() {
        Connection conn = getConnection();
        int listCount = boardDao.selectListCount(conn);
        close(conn);
        return listCount;
    }
    
    public List<Board> selectList(PageInfo pi) {
        Connection conn = getConnection();
        List<Board> list = boardDao.selectList(conn, pi);
        close(conn);
        return list;
    }
    
}