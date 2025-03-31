package com.musicCloud.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.musicCloud.common.JDBCTemplate.*;
import com.musicCloud.common.vo.MusicFile;

public class CommonDao {

	private Properties prop = new Properties();
	
	public CommonDao() {
		String sqlPath = CommonDao.class.getResource("/db/query/commonQuery.xml").getPath();
		try {
			prop.loadFromXML( new FileInputStream(sqlPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param conn
	 * @return
	 * 설명 : 전체 음원 표지 출력데이터 조회 Dao
	 */
	public ArrayList<MusicFile> selectMusicInfo(Connection conn){
		//select 
		ArrayList<MusicFile> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMusicInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(
						  new MusicFile(
								         rset.getInt("mno")
								       , rset.getString("IMAGE_PATH")
								       , rset.getInt("category")
								       , rset.getString("mtitle")
								       , rset.getString("msinger")
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
