package com.musicCloud.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;

/**
 * Servlet implementation class PwdUpdateFormController
 */
@WebServlet("/pwdUpdateForm")
public class PwdUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpdateFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원 아이디 , 이메일 
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("memberEmail");
		
		int result = new MemberSerivce().pwdUpdateForm(memberId, email);
		if(result > 0) {
			//성공
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("views/member/pwdUpdateForm.jsp").forward(request, response);;
		}else {
			//실패
			request.getSession().setAttribute("alertMsg", "일치하는 정보가 없습니다. 다시 입력해주세요");
			response.sendRedirect(request.getContextPath() + "/pwdSearchForm");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
