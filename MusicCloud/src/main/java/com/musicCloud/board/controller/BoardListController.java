package com.musicCloud.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.board.model.service.BoardService;
import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private BoardService boardService = new BoardService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Board> boardList = boardService.getAllBoards();
        
        int listCount = boardService.selectListCount();

        int currentPage = 1;
        if (request.getParameter("cpage") != null) {
            currentPage = Integer.parseInt(request.getParameter("cpage"));
        }
        
        int pageLimit = 5;
        int boardLimit = 5;
        
        int maxPage = (int) Math.ceil((double) listCount / boardLimit);
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        int endPage = startPage + pageLimit - 1;
        
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        
        List<Board> list = boardService.selectList(pi);
        
        request.setAttribute("pi", pi);
        request.setAttribute("list", list);
        request.setAttribute("boardList", boardList);
        
        request.getRequestDispatcher("views/board/boardList.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}