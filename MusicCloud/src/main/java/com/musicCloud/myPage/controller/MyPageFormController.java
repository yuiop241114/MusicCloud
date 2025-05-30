package com.musicCloud.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Location;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class MyPageFormController
 */
@WebServlet("/myPageForm")
public class MyPageFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");	
		ArrayList<Location> location = new MemberSerivce().selectAllLocation();
		
		
		if(loginMember != null) {
			//로그인 상태
			request.setAttribute("locationList", location);
			request.getRequestDispatcher("views/myPage/myPage.jsp").forward(request, response);	
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다");
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
