<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.musicCloud.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contentPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
%>

<%
    String clientId = "DTkHU3VbjmkxYRkognp3";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8118/music/views/common/naverCallback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
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
	.api-login>a{
		margin: auto;
	}
	.api-login img{
		width: 150px;
		height: 50px;
	}
	.api-login>a:hover{
		cursor: pointer;
		opacity: 0.9;
	}
</style>
</head>
<body>
	<div class="wrapper">
		
		<a href="/music"><img src="resources/image/mainlogo.png" alt=""></a>
		
		<br>

		<b id="login-title">로그인</b>

		<br><br>

		<div id="login-div">
			<form action="<%= contentPath%>/login" method="post">
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
				<a href="<%= contentPath%>/idSearchForm">아이디 찾기</a> |
				<a href="<%= contentPath%>/pwdSearchForm">비밀번호 찾기</a>
			</div>

			<div class="api-login">
				<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
			</div>
		</div>

	</div>

</body>
</html>