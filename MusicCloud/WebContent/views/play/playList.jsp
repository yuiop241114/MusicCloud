<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		border: 1px solid;
		width: 1300px;
		float: left;
	}
	/*플레이 리스트 각 div*/
	.personPlaylist{

	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="playlistForm">
		<div class="playlistviewer">
			<h2 align="center">플레이 리스트</h2>
			<div class="personPlaylist">
				
			</div>
		</div>
	</div>

</body>
</html>