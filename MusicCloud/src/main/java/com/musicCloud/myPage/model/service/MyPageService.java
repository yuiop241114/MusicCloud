package com.musicCloud.myPage.model.service;

import java.sql.Connection;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.myPage.model.dao.MyPageDao;

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
	public int memberSecession(String memberId, String memberPwd) {
		Connection conn = getConnection();
		int result = new MyPageDao().memberSecession(conn, memberId, memberPwd);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
