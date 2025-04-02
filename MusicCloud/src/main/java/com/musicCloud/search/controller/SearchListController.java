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
		
		//음원명, 가수명
		//일정 길이가 넘어갈 경우 뒷부분을 ...으로 대체
		for(MusicFile m : listAccuracy) {
			if(m.getMusicTitle().length() >= 20) {
				String str1 = m.getMusicTitle().substring(0, 18);
				m.setMusicTitle(str1.concat("..."));
			}
			if(m.getMusicSinger().length() >= 20) {
				String str2 = m.getMusicSinger().substring(0,18);
				m.setMusicSinger(str2.concat("..."));
			}
		}
		
		for(MusicFile m : listPopular) {
			if(m.getMusicTitle().length() >= 20) {
				String str1 = m.getMusicTitle().substring(0, 18);
				m.setMusicTitle(str1.concat("..."));
			}
			if(m.getMusicSinger().length() >= 20) {
				String str2 = m.getMusicSinger().substring(0,18);
				m.setMusicSinger(str2.concat("..."));
			}
		}
		
		for(MusicFile m : listPopularLocation) {
			if(m.getMusicTitle().length() >= 20) {
				String str1 = m.getMusicTitle().substring(0, 18);
				m.setMusicTitle(str1.concat("..."));
			}
			if(m.getMusicSinger().length() >= 20) {
				String str2 = m.getMusicSinger().substring(0,18);
				m.setMusicSinger(str2.concat("..."));
			}
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
