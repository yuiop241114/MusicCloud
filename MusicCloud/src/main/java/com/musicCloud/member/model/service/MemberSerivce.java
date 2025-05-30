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
		int result = new MemberDao().insertMember(conn, m); //회원가입
		int result2 = new MemberDao().insertRecentMusic(conn, m.getLocationNo()); //최근들은음원 테이블에 회원번호, 지역번호 추가
		Member m2 = new MemberDao().idCheck(conn, m.getEmail(), m.getMemberName());
		int result3 = new MemberDao().insertCart(conn, m2.getMemberNo()); //장바구니 기본 정보 추가
		if(result * result2 * result3 > 0) {
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
	
	
	/**
	 * @param memberId
	 * @param email
	 * @return
	 * 설명 : 아이디, 이메일을 받아서 회원이 있는지 확인하는 서비스 메소드
	 */
	public int pwdUpdateForm(String memberId, String email) {
		Connection conn = getConnection();
		int result = new MemberDao().pwdUpdateForm(conn, memberId, email);
		
		close(conn);
		return result;
	}
	
	
	/**
	 * @param memberId
	 * @param updatePwd
	 * @return
	 * 설명 : 변경된 비밀번호를 이용해서 기존 비밀번호가 같은지 확인하는 서비스 메소드
	 */
	public int updatePwd(String memberId, String updatePwd) {
		Connection conn = getConnection();
		
		//변경한 비밀번호가 기존 비밀번호와 동일한지 확인
		int result1 = new MemberDao().updatePwdCheck(conn, memberId, updatePwd);
		//비밀번호 update
		int result2 = new MemberDao().updatePwd(conn, memberId, updatePwd);
		if(result1 == 0) {
			if(result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return result2;
	}
	
	
	/**
	 * @return
	 * 설명 : 이메일을 이용해서 회원 전체 조회
	 */
	public Member idCheck(String email, String memberName) {
		Connection conn = getConnection();
		Member m = new MemberDao().idCheck(conn, email, memberName);
		
		close(conn);
		return m;
	}
	
	/**
	 * @param alias
	 * @return
	 * 설명 : 회원가입시 별칭 중복확인 서비스 메소드
	 */
	public int memberAliasCheck(String alias) {
		Connection conn = getConnection();
		int result = new MemberDao().memberAliasCheck(conn, alias);
		close(conn);
		return result;
	}
	
	
	/**
	 * @return
	 * 설명 : 관리자에서 회원 전체정보 조회
	 */	
	public ArrayList<Member> selectAllMember() {
		Connection conn = getConnection();
		ArrayList<Member> m = new MemberDao().selectAllMember(conn);
		
		close(conn);
		return m;
	}
	
	/**
	 * @return
	 * 설명 : 관리자에서 회원 전체 정보 카운트
	 */
	public int selectMemberCount() {
		Connection conn = getConnection();
		int result = new MemberDao().selectMemberCount(conn);
		
		close(conn);
		return result;
	}

	 /**
	 * @param memberId
	 * @return
	 * 설명 : 관리자에서 특정 회원 DB삭제
	 */
	public int deleteMembers(String[] memberId) {
	        Connection conn = getConnection();
	        int result = new MemberDao().deleteMember(conn, memberId);

	        if (result > 0) {
	        	commit(conn);
	        }else{
	        	rollback(conn);
	        }

	        close(conn);
	        return result;
	    }
	
	public int adminInsertMembers(String[] memberId) {
		Connection conn = getConnection();
		int result = new MemberDao().adminInsertMember(conn, memberId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
