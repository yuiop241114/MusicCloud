package com.musicCloud.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.BoardService;
import com.musicCloud.member.model.vo.Board;

@WebServlet("/boardUpdate")
public class BoardUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BoardService boardService = new BoardService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        String title = request.getParameter("title");
        int boardCount = Integer.parseInt(request.getParameter("boardCount"));
        String memberNo = request.getParameter("memberNo");

        Board board = new Board();
        board.setBoardNo(boardNo);
        board.setBoardTitle(title);
        board.setBoardCount(boardCount);

        int result = boardService.updateBoard(board);

        if (result > 0) {
            response.sendRedirect("boardUpdateSuccess.jsp");
        } else {
            response.sendRedirect("boardUpdateFail.jsp");
        }
    }
}
