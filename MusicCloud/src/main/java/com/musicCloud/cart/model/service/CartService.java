package com.musicCloud.cart.model.service;

import java.sql.Connection;

import com.musicCloud.cart.model.dao.CartDao;
import com.musicCloud.cart.model.vo.Cart;
import com.musicCloud.common.vo.MusicFile;

import static com.musicCloud.common.JDBCTemplate.*;

public class CartService {


	/**
	 * @param memberNo
	 * @return
	 * 설명 : 회원 반호로 장바구니 정보 조회 서비스 메소드
	 */
	public Cart cartList(int memberNo) {
		Connection conn = getConnection();
		Cart c =  new CartDao().cartList(conn, memberNo);
		close(conn);
		return c;
	}
}
