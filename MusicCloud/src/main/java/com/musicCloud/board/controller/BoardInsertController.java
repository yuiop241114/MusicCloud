package com.musicCloud.board.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.board.model.service.BoardService;
import com.musicCloud.board.model.vo.Board;

@WebServlet("/boardInsert")
public class BoardInsertController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BoardService boardService = new BoardService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        String boardTitle = request.getParameter("boardTitle");
        int boardCount = Integer.parseInt(request.getParameter("boardCount"));
        int memberNo = Integer.parseInt(request.getParameter("memberNo"));

        // 현재 날짜와 시간을 가져와서 문자열로 변환합니다.
        String currentEnrollDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        Board board = new Board();
        board.setBoardNo(boardNo);
        board.setBoardTitle(boardTitle);
        board.setBoardCount(boardCount); // 초기 조회수는 0으로 설정
        board.setBoardEnrollDate(currentEnrollDate);
        board.setMemberNo(memberNo);

        int result = boardService.insertBoard(board);

        if (result > 0) {
            response.sendRedirect("boardInsertSuccess.jsp");
        } else {
            response.sendRedirect("boardInsertFail.jsp");
        }
    }
}