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
 * Servlet implementation class MemberSecessionController
 */
@WebServlet("/memberSecession")
public class MemberSecessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSecessionController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo")); 
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		int result = new MyPageService().memberSecession(memberNo, memberId, memberPwd);
		HttpSession session = request.getSession();
		
		if(result > 0) {
			//회원탈퇴 성공
			session.setAttribute("alertMsg", "성공적으로 탈퇴 되었습니다");
			session.removeAttribute("loginMember");
			response.sendRedirect(request.getContextPath());
		}else {
			//실패
			session.setAttribute("alertMsg", "회원탈퇴에 실패하였습니다. 다시 시도해주세요");
			response.sendRedirect(request.getContextPath() + "/myPageForm");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
