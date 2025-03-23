package com.musicCloud.playlist.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.musicCloud.common.JDBCTemplate.*;

import com.musicCloud.playlist.model.dao.PlayListDao;
import com.musicCloud.playlist.model.vo.PlayList;

public class PlaylistService {

	public ArrayList<PlayList> selectAllPlaylist(int memberNo) {
		Connection conn = getConnection();
		ArrayList<PlayList> list = new PlayListDao().selectAllPlaylist(memberNo);
	}
}
