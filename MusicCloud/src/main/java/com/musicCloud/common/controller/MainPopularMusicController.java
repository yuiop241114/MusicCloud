package com.musicCloud.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.musicCloud.common.model.service.CommonService;
import com.musicCloud.common.vo.MusicFile;

/**
 * Servlet implementation class MainPopularMusicController
 */
@WebServlet("/mainPopularMusic")
public class MainPopularMusicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPopularMusicController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인기순 음원
		ArrayList<MusicFile> list = new CommonService().mainPopularMusic();
		
		//가수명, 음원명 너무 길면 자르는 조건문
		for(MusicFile m : list) {
			if(m.getMusicTitle().length() >= 20) {
				String str1 = m.getMusicTitle().substring(0, 19);
				m.setMusicTitle(str1.concat("...")); 
				
			}else if(m.getMusicTitle().getBytes().length >= 36){ //한글로 30바이트 = 10글자
				String str1 = m.getMusicTitle().substring(0, 11);
				m.setMusicTitle(str1.concat("...")); 
			}
			if(m.getMusicSinger().length() >= 20) {
				String str2 = m.getMusicSinger().substring(0, 18);
				m.setMusicSinger(str2.concat("..."));
			}
		}
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
