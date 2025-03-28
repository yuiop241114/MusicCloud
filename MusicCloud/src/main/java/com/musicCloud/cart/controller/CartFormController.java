package com.musicCloud.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musicCloud.cart.model.service.CartService;
import com.musicCloud.cart.model.vo.Cart;
import com.musicCloud.member.model.vo.Member;

/**
 * Servlet implementation class CartFormController
 */
@WebServlet("/cartForm")
public class CartFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member m = (Member)request.getSession().getAttribute("loginMember");	
		
		if(m != null) {
			//로그인 상태
			//회원번호로 장바구니 정보 조회 후 세션에 세팅
			request.getSession().setAttribute("cart", new CartService().cartList(m.getMemberNo()));
			request.getRequestDispatcher("views/cart/bucketList.jsp").forward(request, response);	
		}else {
			request.getSession().setAttribute("alertMsg", "로그인 후 이용 가능합니다");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
