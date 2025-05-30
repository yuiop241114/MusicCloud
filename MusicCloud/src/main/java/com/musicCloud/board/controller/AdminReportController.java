package com.musicCloud.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.board.model.service.BoardService;
import com.musicCloud.board.model.vo.Board;
import com.musicCloud.common.model.vo.PageInfo;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class AdminReportController
 */
@WebServlet("/AdminReport.bo")
public class AdminReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int currentPage;
		int pageLimit = 10;
		int boardLimit = 10;
		
		String cpageParam = request.getParameter("cpage");
		currentPage = (cpageParam != null) ? Integer.parseInt(cpageParam) : 1;
		
		listCount = new BoardService().selectBoardCount();
		
		int maxPage;
		int startPage = ((currentPage -1) / pageLimit * pageLimit + 1);
		int endPage = startPage + pageLimit - 1 ;

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		endPage = startPage + pageLimit - 1;
		
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new ArrayList<Board>();
		list = new BoardService().adminBoardView(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		
        request.getRequestDispatcher("views/board/adminReportBoard.jsp").forward(request, response);
		
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
