package com.musicCloud.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.board.model.service.BoardService;

/**
 * Servlet implementation class adminReportDelete
 */
@WebServlet("/adminDeleteBoard.bo")
public class adminReportDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminReportDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String Boards = request.getParameter("boards");
		String[] boardReportDelete = Boards.split(",");
		
		
		int result = new BoardService().admindeleteBoards(boardReportDelete);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		
		if(result > 0) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("fail");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
