<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="com.musicCloud.playlist.model.vo.PlayList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//playlistNo : 플레이리스트번호, memberNo : 회원번호, playlistName : 플레이리스트 이름
	//playlistTag : 플레이리스트 태그, payment_status : 결제 여부
	ArrayList<PlayList> playlist = (ArrayList<PlayList>)session.getAttribute("playlist");
	/*
		musicNo : 음원 번호
	  musicFileOriginName : 음원 원본명
	  musicFileEditName : 음원 수정명
	  musicFileStorePath : 음원 저장 경로
	  musicImageOriginName : 음원 이미지 원본명
	  musicImageEditName : 음원 이미지 수정명
	  musicImagePath : 음원 이미지 저장 경로
	  musicCategoryNo : 음원 장르 번호
	  musicTitle : 음원 제목
	  musicSinger : 음원 가수
	  musicCount : 음원 조회수
	  like : 음원 좋아요
	  dislike : 음원 싫어요
	  lyrics : 음원 가사
	  status : 음원 상태
	*/
	ArrayList<MusicFile> fileList = (ArrayList<MusicFile>)session.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*전체를 감싸는 div*/
	.playlistForm{
		border: 1px solid;
		width: 1500px;
		margin: auto;
	}
	/*플레이 리스트 출력 영역*/
	.playlistviewer{
		box-sizing: border-box;
		border: 1px solid;
		width: 1300px;
		float: left;
		display: flex;
		flex-wrap: wrap;
		gap: 60px;
	}
	/*플레이 리스트 각 div*/
	.personPlaylist{
		border: 1px solid #1587d0;
		width: 250px;
		height: 250px;
	}
	.playlistImg{
		display: flex;
		flex-wrap: wrap;
		border: 1px solid;
		width: 100%;
		height: 80%;
	}
	.playlistImg>div{
		border: 1px solid;
		width: 50%;
		height: 50%;
	}
	.playlistContent{
		border: 1px solid;
		width: 100%;
		height: 20%;
		text-align: center;
		font-size: large;
		line-height: 45px;
	}

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="playlistForm">
		<h2 align="center">플레이 리스트</h2>
		<div class="playlistviewer">
			<%if(playlist != null) {%>
				<%for(PlayList p : playlist){%>
					<div class="personPlaylist">

						<div class="playlistImg">
							<%for(int i=0; i<4; i++){%>
								<div></div>
							<%} %>
						</div>

						<div class="playlistContent">
							<b><%= p.getPlaylistName()%></b>
						</div>

					</div>
				<%}%>
			<%}else{%>
				<h2>플레이 리스트가 없습니다</h2>
			<%} %>
		</div>
	</div>

</body>
</html>