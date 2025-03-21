package com.musicCloud.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.myPage.model.dao.MyPageDao;
import com.musicCloud.myPage.model.vo.Subscribe;

public class MyPageService {

	
	/**
	 * @param m
	 * @return
	 * 설명 : 회원정보 수정 서비스 메소드
	 */
	public int updateMemberInfo(Member m) {
		Connection conn = getConnection();
		int result = new MyPageDao().updateMemberInfo(conn, m);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @return
	 * 설명 : 회원번호로 회원의 모든 정보를 select 서비스 메소드
	 */
	public Member selectMemberInfo(int MemberNo) {
		Connection conn = getConnection();
		Member m = new MyPageDao().selectMemberInfo(conn, MemberNo);
		close(conn);
		return m;
	}
	
	/**
	 * @param memberId
	 * @param memberPwd
	 * @return
	 * 설명 : 회원 탈퇴 서비스 메소드
	 */
	public int memberSecession(int memberNo, String memberId, String memberPwd) {
		Connection conn = getConnection();
		int result = new MyPageDao().memberSecession(conn, memberNo, memberId, memberPwd);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @param memberNo
	 * @return
	 * 친구 리스트(친구가 최근들은 음원) 가져오는
	 */
	public ArrayList<Member> friendList(int memberNo){
		Connection conn = getConnection();
		ArrayList<Member> list = new MyPageDao().friendList(conn, memberNo);
		close(conn);
		return list;
	}
	
	
	/**
	 * @param memberNo
	 * @param insertInfo : 친구 추가할 회원의 아이디 또는 별칭
	 * @return
	 * 설명 : 친구 추가 서비스 메소드
	 */
	public int friendInsert(int memberNo, String insertInfo) {
		Connection conn = getConnection();
		int result = new MyPageDao().friendInsert(conn, memberNo, insertInfo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * @param memberNo
	 * @param friendNo
	 * @return
	 * 설명 : 친구 삭제 서비스 메소드
	 */
	public int deleteFriend(int memberNo, int friendNo) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteFriend(conn, memberNo, friendNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	/**
	 * @param memberNo
	 * @return
	 * 설명 : 정기 구독 내역 서비스 메소드
	 */
	public ArrayList<Subscribe> subscribeList(int memberNo) {
		Connection conn = getConnection();
		ArrayList<Subscribe> list = new MyPageDao().subscribeList(conn, memberNo);
		close(conn);
		return list;
	}
}
