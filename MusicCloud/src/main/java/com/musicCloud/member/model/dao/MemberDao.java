package com.musicCloud.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.member.model.vo.Member;

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
}
