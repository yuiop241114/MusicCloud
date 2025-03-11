package com.musicCloud.member.model.service;

import static com.musicCloud.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.musicCloud.member.model.dao.MemberDao;
import com.musicCloud.member.model.vo.Location;
import com.musicCloud.member.model.vo.Member;

public class MemberSerivce {
	
	/**
	 * @param loginId
	 * @param loginPwd
	 * 로그인 Service 메소드
	 */
	public Member loginMember(String loginId, String loginPwd) {
		Connection conn = getConnection();
		Member m =  new MemberDao().loginMember(conn, loginId, loginPwd);
		
		close(conn);
		return m;
	}
	
	/**
	 * @return
	 * 설명 : 지역 테이블 데이터 전부 조회하는 서비스 메소드
	 */
	public ArrayList<Location> selectAllLocation(){
		Connection conn = getConnection();
		ArrayList<Location> lList = new MemberDao().selectAllLocation(conn);
		
		close(conn);
		return lList;
	}

	/**
	 * @param m
	 * @return
	 * 설명 : 회원가입 서비스 메소드
	 */
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * @param id
	 * @return
	 * 설명 : 아이디 중복 체크 서비스 메소드
	 */
	public int memberIdCheck(String id) {
		Connection conn = getConnection();
		int result = new MemberDao().memberIdCheck(conn, id);
		
		close(conn);
		return result;
	}
}
