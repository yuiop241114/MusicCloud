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
</head>
<body>
	<form action="<%= contentPath%>/login" method="post">
	아이디 : <input type="text" name="loginId" required> <br>
	비밀번호 : <input type="password" name="loginPwd" required> <br>
	<button type="submit" onclick="mainPage()">로그인</button>
	</form>
	
	<script>
		function mainPage(){
			location.href = "<%= contentPath%>"
		}
	</script>

</body>
</html>