package com.musicCloud.cart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.musicCloud.cart.model.vo.Cart;
import static com.musicCloud.common.JDBCTemplate.*;

public class CartDao {

	private Properties prop = new Properties();
	
	public CartDao() {
		String queryPath = CartDao.class.getResource("/db/query/cartQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(queryPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param conn
	 * @param memberNo
	 * @return
	 * 설명 : 회원 번호로 장바구니 정보 조회 Dao
	 */
	public Cart cartList(Connection conn, int memberNo) {
		//select
		Cart c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("cartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				c = new Cart(
							  rset.getInt("cart_no")
							, rset.getInt("member_no")
							, rset.getString("MUSIC_NO_TOTAL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	
	/**
	 * @param conn
	 * @param musicList
	 * @param memberNo
	 * @return
	 * 설명 : 장바구니에 음원 추가 Dao
	 */
	public int addCart(Connection conn, String musicList, int memberNo) {
		//update
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("addCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, musicList);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
