package com.musicCloud.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.musicCloud.member.model.vo.Board;

public class BoardDao {

    // 게시글 목록 조회
    public List<Board> getAllBoards(Connection conn) throws SQLException {
        List<Board> list = new ArrayList<>();
        String query = "SELECT * FROM board";
        
        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                Board board = new Board();
                board.setBoardNo(rs.getInt("board_no"));
                board.setBoardTitle(rs.getString("board_title"));
                board.setBoardCount(rs.getInt("board_count"));
                board.setBoardEnrollDate(rs.getString("board_enroll_date"));
                board.setMemberNo(rs.getInt("member_no"));
                list.add(board);
            }
        }
        
        return list;
    }

    // 게시글 등록
    public int insertBoard(Connection conn, Board board) throws SQLException {
        String query = "INSERT INTO board (board_title, board_count, board_enroll_date, member_no) VALUES (?, ?, ?, ?)";
        int result = 0;
        
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, board.getBoardTitle());
            pstmt.setInt(2, board.getBoardCount());
            pstmt.setString(3, board.getBoardEnrollDate());
            pstmt.setInt(4, board.getMemberNo());
            result = pstmt.executeUpdate();
        }
        
        return result;
    }

    // 게시글 수정
    public int updateBoard(Connection conn, Board board) throws SQLException {
        String query = "UPDATE board SET board_title = ?, board_count = ?, board_enroll_date = ?, member_no = ? WHERE board_no = ?";
        int result = 0;
        
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, board.getBoardTitle());
            pstmt.setInt(2, board.getBoardCount());
            pstmt.setString(3, board.getBoardEnrollDate());
            pstmt.setInt(4, board.getMemberNo());
            pstmt.setInt(5, board.getBoardNo());
            result = pstmt.executeUpdate();
        }
        
        return result;
    }

    // 게시글 삭제
    public int deleteBoard(Connection conn, int boardNo) throws SQLException {
        String query = "DELETE FROM board WHERE board_no = ?";
        int result = 0;
        
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, boardNo);
            result = pstmt.executeUpdate();
        }
        
        return result;
    }

    // 게시글 조회
    public Board getBoardById(Connection conn, int boardNo) throws SQLException {
        String query = "SELECT * FROM board WHERE board_no = ?";
        Board board = null;
        
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, boardNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    board = new Board();
                    board.setBoardNo(rs.getInt("board_no"));
                    board.setBoardTitle(rs.getString("board_title"));
                    board.setBoardCount(rs.getInt("board_count"));
                    board.setBoardEnrollDate(rs.getString("board_enroll_date"));
                    board.setMemberNo(rs.getInt("member_no"));
                }
            }
        }
        
        return board;
    }
}
