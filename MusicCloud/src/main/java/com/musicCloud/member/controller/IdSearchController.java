package com.musicCloud.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class IdSearchController
 */
@WebServlet("/idCheck")
public class IdSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearchController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 찾기 기능 구현
		String email = request.getParameter("memberEmail");
		String memberName = request.getParameter("memberName");
		
		Member member = new MemberSerivce().idCheck(email, memberName);
		
		//GJSON
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(member, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
