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
	 * 설명 : 회원 번호로 장바구니 정보 조회 서비스 메소드
	 */
	public Cart cartList(int memberNo) {
		Connection conn = getConnection();
		Cart c =  new CartDao().cartList(conn, memberNo);
		close(conn);
		return c;
	}
	
	/**
	 * @param musicNo
	 * @param memberNo
	 * @return
	 * 설명 : 음원 장바구니에 추가하는 서비스 메소드
	 */
	public int addCart(int musicNo, int memberNo) {
		Connection conn = getConnection();
		Cart c = cartList(memberNo);
		
		//음원 번호 중에 겹치는 음원번호가 있는지 없는지 확인
		int musicFilter = 0;
		
		if(c.getMusicNoTotal() != null) { //장바구니에 음원이 존재하는 경우
			String[] list = c.getMusicNoTotal().split(",");
			for(String i : list) {
				if(Integer.parseInt(i) == musicNo) { 
					musicFilter = 0;
					break;
				}else {
					musicFilter = 1;
				}
			}
		}else { //장바구니에 등록된 음원이 없는 경우
			musicFilter = 1;
		}
		
		//음원 종합 문자열를 가져와서 가져온 음원번호 추가 후 db에 update
		int result = 0;
		String musicList = "";
		if(musicFilter > 0) {
			if(c.getMusicNoTotal() != null) { //장바구니에 음원이 존재하는 경우
				musicList = c.getMusicNoTotal() + "," + musicNo;
			}else { //장바구니에 등록된 음원이 없는 경우
				musicList = musicNo + ""; //등록된 음원이 없으면 , 없이 한개의 번호만 추가
			}
			
			result = new CartDao().addCart(conn, musicList, memberNo);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
		}
		
		return result * musicFilter;
	}
}
