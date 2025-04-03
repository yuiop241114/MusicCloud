package com.musicCloud.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicCloud.member.model.vo.Member;
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
		HttpSession session = request.getSession();
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		Member m = (Member)session.getAttribute("loginMember");
		String insertInfo = "";
		
		//아이디를 받았으면 아이디를 저장
		if(request.getParameter("memberId") != null) {
			//본인일 경우 친구 추가 불가
			if(m.getMemberId().equals(request.getParameter("memberId"))) {
				session.setAttribute("alertMsg", "본인 입니다");
				response.sendRedirect(request.getContextPath() + "/myPageForm");
			}else {
				insertInfo = request.getParameter("memberId");
				
				//친구 중복 체크
				int friendFilter = new MyPageService().friendFilter(memberNo, insertInfo);
				if(friendFilter == 0) { 
					int result = new MyPageService().friendInsert(memberNo, insertInfo);
					
					if(result > 0) {
						session.setAttribute("alertMsg", "친구 추가 성공하였습니다");
						response.sendRedirect(request.getContextPath() + "/myPageForm");
					}else {
						session.setAttribute("alertMsg", "친구 추가 실패하였습니다");
						response.sendRedirect(request.getContextPath() + "/myPageForm");
					}
				}else {
					session.setAttribute("alertMsg", "이미 존재하는 친구 입니다");
					response.sendRedirect(request.getContextPath() + "/myPageForm");
				}
			}
		}
		
		//별칭을 받았으면 별칭을 저장
		if(request.getParameter("memberAlias") != null) {
			//본인일 경우 친구 추가 불가
			if(m.getMemberAlias().equals(request.getParameter("memberAlias"))) {
				session.setAttribute("alertMsg", "본인 입니다");
				response.sendRedirect(request.getContextPath() + "/myPageForm");
			}else {
				insertInfo = request.getParameter("memberAlias");
				
				//친구 중복 체크
				int friendFilter = new MyPageService().friendFilter(memberNo, insertInfo);
				if(friendFilter == 0) { 
					int result = new MyPageService().friendInsert(memberNo, insertInfo);
					
					if(result > 0) {
						session.setAttribute("alertMsg", "친구 추가 성공하였습니다");
						response.sendRedirect(request.getContextPath() + "/myPageForm");
					}else {
						session.setAttribute("alertMsg", "친구 추가 실패하였습니다");
						response.sendRedirect(request.getContextPath() + "/myPageForm");
					}
				}else {
					session.setAttribute("alertMsg", "이미 존재하는 친구 입니다");
					response.sendRedirect(request.getContextPath() + "/myPageForm");
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
