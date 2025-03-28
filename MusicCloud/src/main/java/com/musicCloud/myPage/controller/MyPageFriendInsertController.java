package com.musicCloud.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicCloud.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MyPageFriendInsertController
 */
@WebServlet("/friendInsert")
public class MyPageFriendInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageFriendInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String insertInfo = "";
		HttpSession session = request.getSession();
		//아이디를 받았으면 아이디를 저장
		if(request.getParameter("memberId") != null) {
			insertInfo = request.getParameter("memberId");
		}
		//별칭을 받았으면 별칭을 저장
		if(request.getParameter("memberAlias") != null) {
			insertInfo = request.getParameter("memberAlias");
		}
		
		int result = new MyPageService().friendInsert(memberNo, insertInfo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "친구 추가 성공하였습니다");
			response.sendRedirect(request.getContextPath() + "/myPageForm");
		}else {
			session.setAttribute("alertMsg", "친구 추가 실패하였습니다");
			response.sendRedirect(request.getContextPath() + "/myPageForm");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
