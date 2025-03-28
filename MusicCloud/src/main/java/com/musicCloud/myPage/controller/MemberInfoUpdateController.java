package com.musicCloud.myPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.myPage.model.service.MyPageService;

/**
 * Servlet implementation class MemberInfoUpdateController
 */
@WebServlet("/updateMemberInfo")
public class MemberInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberAlias = request.getParameter("memberAlias");
		String email = request.getParameter("memberEmail");
		int age = Integer.parseInt(request.getParameter("age")); 
		String gender = request.getParameter("gender");
		int loationNo = Integer.parseInt(request.getParameter("locationNo"));
		
		//수정된 정보를 가지고 서비스 클래스로 이동 
		Member m = new Member(memberNo, loationNo, memberId, memberName, memberAlias, email, gender, age);
		int result = new MyPageService().updateMemberInfo(m);
		if(result > 0) {
			//정보 수정 성공
			request.getSession().setAttribute("alertMsg", "정보 수정에 성공하였습니다");
			request.getSession().setAttribute("loginMember", new MyPageService().selectMemberInfo(memberNo));
			response.sendRedirect(request.getContextPath() + "/myPageForm");
		}else {
			//정보 수정 실패
			request.getSession().setAttribute("alertMsg", "정보 수정에 실패하였습니다");
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
