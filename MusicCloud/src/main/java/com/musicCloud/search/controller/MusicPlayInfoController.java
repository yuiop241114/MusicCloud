package com.musicCloud.search.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.search.model.service.SearchService;

/**
 * Servlet implementation class MusicPlayInfoController
 */
@WebServlet("/musicSelect")
public class MusicPlayInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicPlayInfoController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int musicNo = Integer.parseInt(request.getParameter("musicNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int countResult = new SearchService().increaseCount(musicNo); //조회수 증가
		int updateRecentMusic = new SearchService().updateRecentMusic(memberNo, musicNo); //최근 감상 음원 갱신
		
		//만약 조회수 증가, 최근 감상 음원 갱신이 된다면 음원 정보 조회 및 전달
		if(countResult * updateRecentMusic > 0) {
			MusicFile mf = new SearchService().musicSelect(musicNo); //실행할 음원에 대한 정보
			
			//Gson으로 넘겨줌
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(mf, response.getWriter());
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
