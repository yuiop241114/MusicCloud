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
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.wrapper{
		text-align: center;
	}
	img{
		width: 300px;
		height: 200px;
	}
	#login-title{
		font-size: xx-large;
	}
	/*로그인 폼*/
	#login-div{
		border: 1px solid #1587d0;
		width: 550px;
		margin: auto;
		margin-bottom: 20px;
		border-radius: 10px;
	}
	form{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.login{
		margin: auto;
		border: 3px solid #1587d0;
		margin-bottom: 20px;
		width: 500px;
		height: 60px;
		border-radius: 10px;
	}
	.login *{
		box-sizing: border-box;
		height: 100%;
		border-style: none;
	}
	.login b{
		width: 20%;
	}
	.login input{
		width: 80%;
		font-size: large;
	}
	input:focus { outline:none; }

	button{
		width: 300px;
	}

	/*회원가입 아이디찾기 비밀번호찾기*/
	a{ color: black; }

	/*api 로그인*/
	.api-login{ margin-bottom: 20px; }
	.api-login>div{
		width: 200px;
		height: 40px;
		margin: auto;
	}
	.api-login>div:hover{
		cursor: pointer;
		opacity: 0.9;
	}
	#naver-login{
		background-color: #03bc62;
		border-radius: 5px;
		line-height: 40px;
	}
	#naver-login b{
		width: 80%;
		color: white;
	}
	#naver-login img{
		width: 40px;
		height: 100%;
		float: left;
		margin-left: 10px;
	}
</style>
</head>
<body>
<<<<<<< HEAD

	<form action="<%= contentPath%>/login" method="post">
	아이디 : <input type="text" name="loginId" required> <br>
	비밀번호 : <input type="password" name="loginPwd" required> <br>
	<button type="submit">로그인</button>
	</form>
=======
	<div class="wrapper">
		
		<img src="resources/image/mainlogo.png" alt="">
		
		<br>

		<b id="login-title">로그인</b>

		<br><br>

		<div id="login-div">
			<form action="<%= contentPath%>" method="post">
				<div class="login">
					<b>아이디</b>
					<input type="text" name="loginId" required> <br>
				</div>
				<div class="login">
					<b>비밀번호</b>
					<input type="password" name="loginPwd" required> <br>
				</div>
				<button type="submit" class="btn btn-primary">로그인</button>
			</form>

			<div style="margin-bottom: 10px;">
				<a href="<%= request.getContextPath()%>/memberEnrollForm">회원가입</a> |
				<a href="">아이디 찾기</a> |
				<a href="">비밀번호 찾기</a>
			</div>

			<div class="api-login">
				<div id="naver-login">
					<img src="resources/image/naverLogo.png" alt="">
					<b>네이버로 로그인</b>
				</div>
			</div>
		</div>



	</div>
>>>>>>> main

</body>
</html>