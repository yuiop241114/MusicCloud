package com.musicCloud.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.BoardService;
import com.musicCloud.member.model.vo.Board;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardService boardService = new BoardService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Board> boardList = boardService.getAllBoards();
        
        request.setAttribute("boardList", boardList);
        request.getRequestDispatcher("/WEB-INF/views/board/boardList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}