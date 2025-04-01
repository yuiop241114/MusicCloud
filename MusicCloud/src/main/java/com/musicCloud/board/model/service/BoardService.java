package com.musicCloud.board.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.musicCloud.board.model.dao.BoardDao;
import com.musicCloud.board.model.vo.Board;
import static com.musicCloud.common.JDBCTemplate.*;

public class BoardService {
    private BoardDao boardDao = new BoardDao();

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
    	int result = 0;
    	
    	result = new BoardDao().selectListCount(conn);
    }
}
