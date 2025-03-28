package com.musicCloud.member.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/memberEnroll")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//입력한 값
		int locationNo = Integer.parseInt(request.getParameter("locationNo")); 
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberAlias = request.getParameter("memberAlias");
		if(memberAlias.equals("")) {
			memberAlias += memberId;
		}
		String email = request.getParameter("memberEmail");
		String gender = request.getParameter("gender");
		//일반나이로 계산
		int age = 2025 - Integer.parseInt((request.getParameter("ageDate") + "").substring(0,4)) + 1;

		Member m = new Member(locationNo, memberId, memberPwd, memberName, memberAlias, email, gender, age);
		
		int result = new MemberSerivce().insertMember(m);
		if(result > 0) {
			//성공
			request.getSession().setAttribute("alertMsg", "회원가입에 성공 하셨습니다. 메인페이지로 이동합니다");
			response.sendRedirect(request.getContextPath());
		}else {
			//실패
			request.getSession().setAttribute("alertMsgEnroll", "회원가입에 실패 하였습니다. 다시 시도해주세요");
			response.sendRedirect(request.getContextPath() + "/memberEnrollForm");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
