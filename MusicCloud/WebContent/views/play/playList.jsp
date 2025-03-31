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
	/*
		fileList
		musicNo : 음원명
		musicImagePath : 이미지경로
		musicCategoryNo : 음원 장르
		musicTitle : 음원명
		musicSinge : 가수명
*/
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*전체를 감싸는 div*/
	.playlistForm{
		width: 1500px;
		margin: auto;
	}
	/**/
	#playlistTitle{
		width: 1180px;
		height: 100px;
		border-radius: 5px;
		margin-left: 30px;
		margin-bottom: 10px;
		background-color: rgb(233, 233, 233)
	}
	#playlistTitle h4{
		font-weight: bold;
		line-height: 100px;
		margin-left: 20px;
		color: #1587d0;
		margin-top: 5px;
	}
	/*플레이 리스트 출력 영역*/
	.playlistviewer{
		box-sizing: border-box;
		width: 1200px;
		float: left;
		display: flex;
		flex-wrap: wrap;
		gap: 60px;
		margin-left: 30px;
	}
	/*플레이 리스트 각 div*/
	.personPlaylist:hover{
		cursor: pointer;
	}
	.personPlaylist{
		border: 1px solid skyblue;
		width: 250px;
		height: 250px;
		border-radius: 5px;
		overflow: hidden;

	}
	.personPlaylist b{
		font-size: small;
	}
	.playlistImg{
		display: flex;
		flex-wrap: wrap;
		width: 100%;
		height: 80%;
	}
	.playlistImg>img{
		width: 50%;
		height: 50%;
	}
	.playlistContent{
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
		<div id="playlistTitle">
			<div><h4>플레이 리스트</h4></div>
		</div>
		<div class="playlistviewer">
			<%if(playlist != null) {%>
				<%
					String[] musicNum = null;
					//소유한 플레이 리스트 만큼 반복
					for(PlayList p : playlist){
						musicNum = p.getPlayListMusicTotal().split(",");
				%>
					<div class="personPlaylist">

						<!-- 음원 이미지(4개고정) -->
						<div class="playlistImg">
							<%for(int i=0; i<4; i++){%>
								<img src="<%
										for(MusicFile f : fileList){
											if(Integer.parseInt(musicNum[i % musicNum.length]) == f.getMusicNo()){
									%> <%= f.getMusicImagePath()%>
									<%
											}
										}
									%>">
									
							<%} //음원이미지반복문끝부분%>
						</div>

						<!-- 플레이리스트 제목-->
						<div class="playlistContent">
							<b><%= p.getPlaylistTag()%></b>
						</div>

					</div>
				<%}//플레이리스트 개수 만큼 반복문 끝부분%>
			<%}else{%>
				<h2>플레이 리스트가 없습니다</h2>
			<%} %>
		</div>
	</div>

</body>
</html>