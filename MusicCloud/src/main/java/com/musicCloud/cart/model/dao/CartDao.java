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
}
