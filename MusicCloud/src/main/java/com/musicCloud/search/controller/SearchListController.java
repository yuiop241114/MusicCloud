package com.musicCloud.search.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.search.model.service.SearchService;

/**
 * Servlet implementation class searchListController
 */
@WebServlet("/searchList.li") //
public class SearchListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		// 서블릿에서 데이터 설정
		String search = request.getParameter("search"); // 클라이언트에서 넘어온 검색어
		request.setAttribute("search", search);

		// 검색 결과 JSP로 포워드
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/search/searchList.jsp");
		dispatcher.forward(request, response);
		
		System.out.println(request.getContextPath());
		
	
		
		new SearchService().searchList(search);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
