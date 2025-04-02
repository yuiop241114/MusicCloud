package com.musicCloud.myPage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.member.model.dao.MemberDao;
import com.musicCloud.member.model.vo.Member;
import com.musicCloud.myPage.model.vo.Subscribe;

public class MyPageDao {
	
	//쿼리가 있는 xml 파일을 읽이 위한 구문
	private Properties prop = new Properties();
	
	public MyPageDao() {
		String queryFilePath = MyPageDao.class.getResource("/db/query/mypageQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(queryFilePath));
		} catch (IOException e) {
			e.printStackTrace();
			
		}
	}
	
	
	/**
	 * @param conn
	 * @param m
	 * @return
	 * 설명 : 회원정보 수정 Dao
	 */
	public int updateMemberInfo(Connection conn, Member m) {
		//update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getLocationNo());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3,  m.getMemberName());
			pstmt.setString(4, m.getMemberAlias());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getGender());
			pstmt.setInt(7, m.getAge());
			pstmt.setInt(8, m.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * @param conn
	 * @param MemberNo
	 * @return
	 * 설명 : 회원번호를 이용해서 회원정보 select Dao
	 */
	public Member selectMemberInfo(Connection conn, int MemberNo) {
		//select 
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMemberInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, MemberNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(
				        rset.getInt("member_no")
				      , rset.getInt("location_no")
				      , rset.getString("member_id")
				      , rset.getString("member_pwd")
				      , rset.getString("member_name")
				      , rset.getString("member_alias")
				      , rset.getString("email")
				      , rset.getString("gender")
				      , rset.getInt("age")
				      , rset.getDate("enroll_date")
				      , rset.getInt("report_count")
				      , rset.getString("status")
				      , rset.getString("pf_status")
				      );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}
	
	/**
	 * @param conn
	 * @param memberId
	 * @param memberPwd
	 * @return
	 * 설명 : 회원 탈퇴 Dao
	 */
	public int memberSecession(Connection conn, int memberNo, String memberId, String memberPwd) {
		//update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberSecession");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			pstmt.setInt(3, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @param conn
	 * @param memberNo
	 * @return
	 * 설명 : 친구 리스트(친구가 최근들은 음원) 가져오는 Dao
	 */
	public ArrayList<Member> friendList(Connection conn, int memberNo){
		//select
		ArrayList<Member> list = new ArrayList<Member>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("friendList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new Member(
								  	  rset.getInt("member_no")
								  	, rset.getInt("friend_no")
								  	, rset.getString("friend_alias")
								  	, rset.getString("recent_music")
								  	)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	/**
	 * @param conn
	 * @param memberNo
	 * @param insertInfo
	 * @return
	 * 설명 : 친구 추가 Dao
	 */
	public int friendInsert(Connection conn, int memberNo, String insertInfo) {
		//insert 
		//1. 아이디를 받은 경우 2. 별칭을 받은 경우
		int friendNo = 0;
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String insertSql = prop.getProperty("friendInsert"); //친구 추가 쿼리
		String idSql = prop.getProperty("friendInsertInfoId"); // 아이디로 친구 회원번호 조회 쿼리
		String aliasSql = prop.getProperty("friendInsertInfoAlias"); // 별칭으로 친구 회원번호 조회 쿼리
		
		try {
			//먼저 아이디로 select문 실행
			pstmt = conn.prepareStatement(idSql);
			pstmt.setString(1, insertInfo);
			rset = pstmt.executeQuery();
			if(rset.next()) { //select 결과 => 친구 추가할 회원 번호
				friendNo = rset.getInt("member_no");
			}
			
			if(friendNo == 0) { //아이디 select 결과가 없다면 별칭으로 실행
				pstmt = conn.prepareStatement(aliasSql);
				pstmt.setString(1, insertInfo);
				rset = pstmt.executeQuery();
			}
			if(rset.next()) { //select 결과 => 친구 추가할 회원 번호
				friendNo = rset.getInt("member_no");
			}
			
			//추가할 친구 회원번호, 로그인한 회원 번호를 이용해서 친구 추가 진행
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, friendNo);
			pstmt.setInt(2, memberNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	/**
	 * @param conn
	 * @param memberNo
	 * @param friendNo
	 * @return
	 * 설명 : 친구 삭제 Dao
	 */
	public int deleteFriend(Connection conn, int memberNo, int friendNo) {
		//delete 
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteFriend");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, friendNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @param conn
	 * @param memberNo
	 * @param insertInfo
	 * @return
	 * 설명 : 친구 추가전 중복체크 Dao
	 */
	public int friendFilter(Connection conn, int memberNo, String insertInfo) {
		//select
		int countId = 1;
		int countAlias = 1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//아이디로 중복체크
		String friendFilterId = prop.getProperty("friendFilterId");
		//별칭으로 중복체크
		String friendFilterAlias = prop.getProperty("friendFilterAlias");
		
		try {
			//아이디로 먼저 중복체크
			pstmt = conn.prepareStatement(friendFilterId);
			pstmt.setString(1, insertInfo);
			pstmt.setInt(2, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				countId = rset.getInt("IC");
			}
			
			if(countId == 0) { //추가된 친구가 아니라면 별칭으로 중복체크 진행
				pstmt = conn.prepareStatement(friendFilterAlias);
				pstmt.setString(1, insertInfo);
				pstmt.setInt(2, memberNo);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					countAlias = rset.getInt("AC");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return countId + countAlias;
	}
	
	
	/**
	 * @param conn
	 * @param memberNo
	 * @return
	 * 설명 : 정기 구독 내역 Dao
	 */
	public ArrayList<Subscribe> subscribeList(Connection conn, int memberNo) {
		//select
		ArrayList<Subscribe> list = new ArrayList<Subscribe>();
 		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("subscribeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new Subscribe(
								  		 rset.getInt("member_no")
								  	   , rset.getString("start_date")
								  	   , rset.getString("end_date")
								  	   )
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

}
