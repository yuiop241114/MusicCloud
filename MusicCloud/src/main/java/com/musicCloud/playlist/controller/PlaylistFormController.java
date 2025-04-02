package com.musicCloud.playlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicCloud.common.vo.MusicFile;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.playlist.model.service.PlaylistService;
import com.musicCloud.playlist.model.vo.PlayList;

/**
 * Servlet implementation class PlaylistFormController
 */
@WebServlet("/playlistForm")
public class PlaylistFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaylistFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		

		if(session.getAttribute("loginMember") != null) {
			//개인 플레이 리스트 조회 
			ArrayList<PlayList> playlist = new PlaylistService().selectAllPlaylist(m.getMemberNo());
			session.setAttribute("playlist", playlist);
			request.getRequestDispatcher("views/play/playList.jsp").forward(request, response);
		}else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능합니다");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
