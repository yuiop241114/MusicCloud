package com.musicCloud.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.musicCloud.cart.model.service.CartService;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class AddMusicCartController
 */
@WebServlet("/addCart")
public class AddMusicCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMusicCartController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int musicNo = Integer.parseInt(request.getParameter("musicNo"));
		Member m = (Member)request.getSession().getAttribute("loginMember");
		
		int result = new CartService().addCart(musicNo, m.getMemberNo());
		System.out.println("Controller result : " + result);
		JSONObject o = new JSONObject();
		o.put("result", result);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(o);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
