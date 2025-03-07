<%@page import="com.musicCloud.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contentPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
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
	    height: 170px;
	}
	.wrapper *{
	    box-sizing: border-box;
	}
	
	.wrapper #logo{
	    width: 15%;
	    height: 100%;
	}
	
	.wrapper #login-box{
	    width: 25%;
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

	
	.wrapper .search-bar{ 
	    width: 55%; 
	    float: right;
	    line-height: 50px;
	    margin-top: 50px;
	    margin-right: 30px;
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
	.search-bar #search-btn{
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
	
	.navigator{
	    width: 150px;
	    float: right;
	    border: 1px solid;
	    text-align: center;
	    margin-right: 30px;
	    box-sizing: border-box;
			margin-top: 20px;
			border: none;
	    /*스크롤 움직임에 따라 같이움직이는 코드*/
	    position: sticky;
	    top: 20px;
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
					<a href="">회원가입</a> | <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>
				<%}else { %>
					<div>
					<%= loginMember.getMemberName()%> 회원 로그인 중
					<br>
					<a href="<%= contentPath%>/logout" class="btn btn-sm btn-secondary">로그아웃</a>
					</div>
				<%} %>
       </div>

       <form action="" class="search-bar">
           <input type="text" id="search-box">
           <button type="submit" id="search-btn">검색</button>
       </form>
    </div>

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

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<script>

	    $(function(){
	        $("#side-btn").click(function(){
	            if($("#side-btn-list").css('display') == 'none'){
	                $("#side-btn-list").slideDown();
	            }else{
	                $("#side-btn-list").slideUp();
	            }
	        });
	    });
	</script>
	
</body>
</html>