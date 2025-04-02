package com.musicCloud.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicCloud.common.vo.MusicFile;
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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String search = request.getParameter("search"); // 검색어
		int locationNo = Integer.parseInt(request.getParameter("locationNo"));
		HttpSession session = request.getSession();
		
		ArrayList<MusicFile> listAccuracy = new SearchService().searchListAccuracy(search);
		ArrayList<MusicFile> listPopular = new SearchService().searchListPoupular(search);		
		ArrayList<MusicFile> listPopularLocation = new SearchService().searchListPopularLocation(search, locationNo);
		
		for(MusicFile l : listPopular) {
			System.out.println(l);
		}
		
		for(MusicFile l : listPopularLocation) {
			System.out.println(l);
		}
		
		request.setAttribute("search", search);
		session.setAttribute("listAccuracy", listAccuracy);
		session.setAttribute("listPopular", listPopular);
		session.setAttribute("listPopularLocation", listPopularLocation);
			
		request.getRequestDispatcher("views/search/searchList.jsp").forward(request, response);
	} 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
