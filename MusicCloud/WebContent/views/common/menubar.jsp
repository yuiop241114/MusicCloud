<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.musicCloud.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contentPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
	ArrayList<MusicFile> fileList = (ArrayList<MusicFile>)session.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>
<!-- 메테리얼 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 
			
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
	@font-face {
	font-family: 'SUITE-Regular';
	src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
	font-weight: 400;
	font-style: normal;
	}
	body{
		font-family: 'SUITE-Regular';
	}

	.wrapper{
	  box-sizing: border-box;
		width: 1500px;
	  height: 170px;
		margin: auto;
	}
	.wrapper *{ box-sizing: border-box; }
	
	/*로고*/
	.wrapper #logo{
	    width: 15%;
	    height: 100%;
			margin-left: 20px;
	}
	
	/*로그인 div*/
	.wrapper #login-box{
	    width: 20%;
	    height: 100%;
	    float: right;
			text-align: center;
			border: 1px solid #1587d0;
			border-radius: 30px;
	}
	#login-btn{
		background-color: #1587d0;
		width: 80%;
		line-height: 40px;
		margin-top: 40px;
	}
	#login-box a{
		color: black;
	}

	/*로그인 후 로그인 div*/
	#login-info{
		margin-top: 55px;
	}
	#login-info strong{
		margin-bottom: 10px;
	}
	#login-info a{
		margin-right: 20px;
	}
	#login-info img{
		width: 20px;
		height: 20px;
	}
	#login-info a{
		color: #1587d0;
	}
 
	/*검색창*/
	.search-bar{ 
	    width: 58%; 
	    float: right;
	    line-height: 50px;
	    margin-top: 70px;
	    margin-right: 50px;
	}
	.search-bar *{
	    height: 50px;
	}
	.search-bar #search-box{
	    width: 80%;
	    border: none;
	    border: 1px solid #1587d0;
	    border-top-left-radius: 30px;
	    border-bottom-left-radius: 30px;
	}
	.search-bar #search-btn, #search-btn-member-null{
	    float: right;
	    width: 20%;
	    background-color: #1587d0;
	    color: white;
			font-weight: bolder;
			font-size: larger;
			line-height: 10px;
	
	    border-top-right-radius: 30px;
	    border-bottom-right-radius: 30px;
	    border: 1px solid #1587d0;
	}
	#search-btn:hover{
	    cursor: pointer;
	}  
	
	/*퀵메뉴*/
	#navigator-div{
		height: 50px;
		width: 1500px;
		margin: auto;

	  /*스크롤 움직임에 따라 같이움직이는 코드*/
		position: sticky;
		top: 5px;
	}
	.navigator{
	    width: 150px;
	    float: right;
	    border: 1px solid;
	    text-align: center;
	    box-sizing: border-box;
			line-height: 60px;
			margin-right: 10px;
			border: none;
	}
	.navigator #side-btn, .navigator #side-btn-list{
	  width: 100%;
		line-height: 20px;
	}
	#side-btn{
	  height: 40px;
		background-color: #1587d0;
	}
	#side-btn-list{
	    display: none;
	    width: 100%;
	    font-size: small;
			border-radius: 10px;
			background-color: #1587d0;
			margin-top: 5px;
			color: white;
			overflow: hidden;
	}
	#side-btn-list th{
	    height: 50px;
	}
	#side-btn-list img{
			display: block;
			text-align: center;	
			margin-left: 10px;
			width: 100%;
	}
	#side-btn-list a {
    color: white; /* 링크 텍스트를 하얀색으로 변경 */
    text-decoration: none; /* 링크에 밑줄을 없애기 */
    }

	/*퀵메뉴 각 페이지 이동 a 태그*/
	#side-btn-list a{
		text-decoration: none;
		color: white;
	}
	#side-btn-list a:hover{
		color: gray;
	}

	/*토스트바*/
	#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #1587d0; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 30px; /* 30px from the bottom */
    border-radius: 5px;
    }

    /* Show the snackbar when clicking on a button (class added with JavaScript) */
    #snackbar.show {
    visibility: visible; /* Show the snackbar */
    /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
    However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    /* Animations to fade the snackbar in and out */
    @-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
    }

    @-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
    }

    @keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
    }

	</style> 
<body>
	
	<div class="wrapper">
			<a href="<%= contentPath%>"><img src="resources/image/mainlogo.png" id="logo"></a>

       <div id="login-box">   
					<% if(loginMember == null){ %>
					<input type="hidden" id="memberNo" value="noneLogin">
						<h1><button type="button" onclick="location.href='<%= contentPath%>/loginForm'" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
						<a href="<%= request.getContextPath()%>/memberEnrollForm">회원가입</a> | <a href="<%= contentPath%>/idSearchForm">아이디 찾기</a> | <a href="<%= contentPath%>/pwdSearchForm">비밀번호 찾기</a>
					<%}else { %>
						<div id="login-info">
							<input type="hidden" id="memberNo" value="<%= loginMember.getMemberNo()%>">
							<strong><%= loginMember.getMemberAlias()%> 회원 로그인 중</strong>
							<br><br>
							<img src="resources/image/logoutIcon.png" alt="">
							<% if(loginMember.getMemberId().equals("admin")){%>
								<a href="<%= contentPath%>/Admin.bo">관리자 페이지로 이동</a>
							<%}%>
							<a href="<%= contentPath%>/logout">로그아웃</a>
						</div>
					<%} %>
       </div>
       
			<% if(loginMember == null){%>
	      <form action="" class="search-bar">
           <input type="text" id="search-box" name="search" required>
           <button type="submit" id="search-btn-member-null">검색</button>     
		
         <% }else{ %>
       <form action="<%=contentPath%>/searchList.li" class="search-bar">
           <input type="text" id="search-box" name="search" required>
           <input type="hidden" name="locationNo" value="<%= loginMember.getLocationNo() %>">
           <button type="submit" id="search-btn">검색</button>     
         <% } %>
       </form>
  </div>

	<hr>

	<div id="navigator-div">
		<div class="navigator">
			<button type="button" id="side-btn" class="btn btn-primary btn-lg">퀵 메뉴</button>
			<table id="side-btn-list">
					<tr>
							<th width="30%">
								<img src="resources/image/list.png" alt="">
							</th>
							<th width="70%">전체음원목록</th>
					</tr>
					<tr>
							<th>
								<img src="resources/image/mypage.png" alt="">
							</th>
							<th><a href="<%= contentPath%>/myPageForm">마이페이지</a></th>
					</tr>
					<tr>
							<th>
								<img src="resources/image/board.png" alt="">
							</th>
							<th><a href="<%= contentPath %>/boardList">게시판</a></th>
					</tr>
					<tr>
							<th>
								<img src="resources/image/cart.png" alt="">
							</th>
							<th><a href="<%= contentPath%>/cartForm">장바구니</a></th>
					</tr>
					<tr>
							<th>
								<img src="resources/image/playList.png" alt="">
							</th>
							<th><a href="<%= contentPath%>/playlistForm">플레이리스트</a></th>
					</tr>
			</table>
		</div>
	</div>
	
		<!-- 알림창 스크립트 -->
		<%if(alertMsg != null){%>
			<script>
				alert("<%= alertMsg%>");
			</script>
			<% session.removeAttribute("alertMsg"); %>
		<%}%>
	

	<div id="snackbar"></div>

	<script>
	    $(function(){
	    		$.ajax({
	    			url : "selectMusicInfo",
	    			data : {},
	    			success:function(fileList){
							/*
								fileList
								musicNo : 음원명
		 						musicImagePath : 이미지경로
								musicCategoryNo : 음원 장르
		 						musicTitle : 음원명
		 						musicSinge : 가수명
							*/
						},
	    			error:function(){},
	    		})
	    	
					//퀵 메뉴 스크립트
	        $("#side-btn").click(function(){
	            if($("#side-btn-list").css('display') == 'none'){
	                $("#side-btn-list").slideDown();
	            }else{
	                $("#side-btn-list").slideUp();
	            }
	        });

	    $(document).on("click", ".cartImg", function(){ //장바구니 아이콘 클릭 시
	    	if($("#memberNo").val() === "noneLogin"){ //비로그인일 경우
        		$("#snackbar").text("로그인 후 이용 가능합니다");
						//토스트바 div show로 변경
						document.getElementById("snackbar").className = "show";
		
						//3초 후 사라지게 설정
						setTimeout(function(){ document.getElementById("snackbar").className = document.getElementById("snackbar").className.replace("show", ""); }, 3000);
        }else{ //회원일 경우
				    	$.ajax({
							url:"addCart",
							data:{
								musicNo:$(this).find("input[type='hidden']").val(),
							},
							success:function(a){ 
								var x = document.getElementById("snackbar");                  
								if(a.result === 0){
									$("#snackbar").text("이미 등록된 음원 입니다");
									//토스트바 div show로 변경
									x.className = "show";
			
									//3초 후 사라지게 설정
									setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
								}else{
									$("#snackbar").text("장바구니 등록 성공");
			
									//토스트바 div show로 변경
									x.className = "show";
			
									//3초 후 사라지게 설정
									setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
								}
							},
							error:function(){
								console.log("장바구니 추가 ajax 실패")
							}
						})
        	}
	    	
	    	})//장바구니 아이콘 클릭 시
				
	    });

		document.getElementById("search-btn-member-null").addEventListener("click", function(){
			alert("로그인 후 이용가능합니다")
		});
	</script>

</body>
</html>