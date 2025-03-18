<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="com.musicCloud.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%
	String contentPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
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
		margin-top: 40px
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
	}
	#side-btn-list th{
	    height: 50px;
	}
	#side-btn-list img{
	    width: 80%;
	}

	</style> 
<body>
	<div class="wrapper">
       <img src="resources/image/mainlogo.png" id="logo">

       <div id="login-box">   
					<% if(loginMember == null){ %>
						<h1><button type="button" onclick="location.href='<%= contentPath%>/loginForm'" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
						<a href="<%= request.getContextPath()%>/memberEnrollForm">회원가입</a> | <a href="<%= contentPath%>/idSearchForm">아이디 찾기</a> | <a href="<%= contentPath%>/pwdSearchForm">비밀번호 찾기</a>
					<%}else { %>
						<div id="login-info">
							<strong><%= loginMember.getMemberAlias()%> 회원 로그인 중</strong>
							<br><br>
							<img src="resources/image/logoutIcon.png" alt="">
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

	<div id="navigator-div">
		<div class="navigator">
			<button type="button" id="side-btn" class="btn btn-primary btn-lg">퀵 메뉴</button>
			<table id="side-btn-list">
					<tr>
							<th width="30%"><img src="resources/image/cartlogo.jpg" alt=""></th>
							<th width="70%">전체음원목록</th>
					</tr>
					<tr>
							<th><img src="resources/image/cartlogo.jpg" alt=""></th>
							<th>마이페이지</th>
					</tr>
					<tr>
							<th><img src="resources/image/cartlogo.jpg" alt=""></th>
							<th>게시판</th>
					</tr>
					<tr>
							<th><img src="resources/image/cartlogo.jpg" alt=""></th>
							<th>장바구니</th>
					</tr>
					<tr>
							<th><img src="resources/image/cartlogo.jpg" alt=""></th>
							<th>플레이 리스트</th>
					</tr>
			</table>
		</div>
	</div>
	
	
	<script>
			//퀵 메뉴 스크립트
	    $(function(){
	    	
	        $("#side-btn").click(function(){
	            if($("#side-btn-list").css('display') == 'none'){
	                $("#side-btn-list").slideDown();
	            }else{
	                $("#side-btn-list").slideUp();
	            }
	        });
	    });

		document.getElementById("search-btn-member-null").addEventListener("click", function(){
			alert("검색기능은 로그인 후 이용가능합니다")
		});
	</script>
</body>
</html>