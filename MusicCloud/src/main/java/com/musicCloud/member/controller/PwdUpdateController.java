package com.musicCloud.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;

/**
 * Servlet implementation class PwdUpdateController
 */
@WebServlet("/pwdUpdate")
public class PwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//변경한 비밀번호를 가져가서 기존 비밀번호와 일치하는지 확인
		//회원 아이디를 숨겨서 가져옴
		String memberId = request.getParameter("memberId");
		String updatePwd = request.getParameter("updatePwd");
		
		int result = new MemberSerivce().updatePwd(memberId, updatePwd);
		if(result > 0) {
			//변경 성공
			request.getSession().setAttribute("alertMsg", "변경에 성공하였습니다");
			response.sendRedirect(request.getContextPath());
		}else {
			//변경 실패
			request.getSession().setAttribute("alertMsg", "기존에 사용하고 있는 비밀번호 입니다");
			response.sendRedirect(request.getContextPath() + "/pwdUpdateForm");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
