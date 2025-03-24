package com.musicCloud.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/login")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 비밀번호는 한글 없어서 인코딩 생략
		request.setCharacterEncoding("utf-8");
		
		//받아온 정보 저장 후 요청 처리
		String loginId = request.getParameter("loginId");
		String loginPwd = request.getParameter("loginPwd");
		
		Member m =  new MemberSerivce().loginMember(loginId, loginPwd);
		if(m == null) {
			//실패
			request.getSession().setAttribute("alertMsg", "로그인 실패 다시 시도해주세요");
			response.sendRedirect(request.getContextPath());
		}else {
			//성공
			request.getSession().setAttribute("loginMember", m); //회원의 모든 정보를 가지고 있는 객체
			response.sendRedirect(request.getContextPath());
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