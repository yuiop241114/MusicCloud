package com.musicCloud.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.member.model.service.MemberSerivce;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.member.model.vo.NaverMember;

/**
 * Servlet implementation class NaverLoginController
 */
@WebServlet("/naverLogin")
public class NaverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 네이버 소셜 로그인 시 member 테이블에 insert 로그인한 경우가 있으면 회원정보만 가져와서 메엔페이지 이동
		 * memberId = 고유 식별 아이디
		 * locationNo = 1로 임의로 insert
		 * memberPwd = 1로 임의로 insert
		 */

		String uniqueId = (String)request.getAttribute("uniqueId");
		String nickName = (String)request.getAttribute("nickName");
		String name = (String)request.getAttribute("name");
		String email = (String)request.getAttribute("email");
		String age = (String)request.getAttribute("age");
		String gender = (String)request.getAttribute("gender");
		String birthday = (String)request.getAttribute("birthday");
		String birthyear = (String)request.getAttribute("birthyear");
		String mobile = (String)request.getAttribute("mobile"); 
		
		/*
		System.out.println(uniqueId);
    	System.out.println(nickName);
    	System.out.println(name);
    	System.out.println(email);
    	System.out.println(age);
    	System.out.println(gender);
    	System.out.println(birthday);
    	System.out.println(birthyear);
    	System.out.println(mobile);
    	*/
    	
    	NaverMember naver = new NaverMember(uniqueId, nickName, name, email, age, gender, birthday, birthyear, mobile);
    	//나이 계산을 위한 이번년도 출력
    	Date today = new Date();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
    	
    	int result = new MemberSerivce().memberIdCheck(uniqueId); //아이디로 select 절에서 count 개수 가져 오는 메소드
    	Member m = null;
    	if(result <= 0) {
    		//네이버로 로그인한 전적이 없는 경우
    		//DB에 정보저장
    		new MemberSerivce().insertMember( new Member( 1, uniqueId, "1", name, nickName, email, gender, Integer.parseInt(dateFormat.format(today)) -  Integer.parseInt(birthyear) ) );
    	}
    	//로그인을 위한 정보를 가져옴
    	m = new MemberSerivce().loginMember(uniqueId, "1");
		//System.out.println(m);
    	request.getSession().setAttribute("loginMember", m);
    	response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
