package com.musicCloud.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;

import com.musicCloud.member.model.vo.Location;
import com.musicCloud.member.model.vo.Member;

import oracle.net.aso.n;

public class MemberDao {

	private Properties prop = new Properties();
	
	/**
	 * Dao 생성 시 쿼리 xml 파일을 읽기 설정
	 */
	public MemberDao() {
		String queryFilePath = MemberDao.class.getResource("/db/query/memberQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(queryFilePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * @param conn
	 * @param loginId
	 * @param loginPwd
	 * 로그인 Dao 메소드
	 */
	public Member loginMember(Connection conn, String loginId, String loginPwd) {
		//select문
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPwd);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member(
						        rset.getInt("member_no")
						      , rset.getInt("location_no")
						      , rset.getString("member_no")
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
			System.out.println(m);
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
	 * @return
	 * 설명 : 지역 테이블 데이터 전부 조회 Dao
	 */
	public ArrayList<Location> selectAllLocation(Connection conn){
		ArrayList<Location> list = new ArrayList<Location>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllLocation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new Location( rset.getInt("location_no"), rset.getString("location_name"))
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * @param conn
	 * @param m
	 * @return
	 * 설명 : 회원가입을 위해 Member 테이블에 insert 하는 Dao
	 */
	public int insertMember(Connection conn, Member m) {
		//insert
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getLocationNo());
			pstmt.setString(2, m.getMemberId());
			pstmt.setString(3, m.getMemberPwd());
			pstmt.setString(4, m.getMemberName());
			pstmt.setString(5, m.getMemberAlias());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getGender());
			pstmt.setInt(8, m.getAge());
			
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
	 * @param id
	 * @return
	 * 설명 : 아이디 중복 체크를 한 Count 조회 Dao
	 */
	public int memberIdCheck(Connection conn, String id) {
		//select 이지만 count 함수로 조회
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("memberIdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
}
