<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)request.getSession().getAttribute("alertMsg");
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
    .wrapper>b{
        font-size: xx-large;
        display: block;
        text-align: center;
    }
    img{
        width: 300px;
        height: 200px;
        margin-bottom: 10px;
        display: block;
        margin: auto;
    }

    /*정보입력 영역*/
    #pwdSearch-box{
        width: 300px;
        margin: auto;
    }
    #pwdSearch-box form{
        display: block;
        margin: auto;
    }
    #pwdSearch-box button{
        width: 100%;
        border-radius: 20px;
    }
    input {
    width: 300px;
    height: 38px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
    margin-bottom: 10px;
    }
    
</style>
</head>
<body>
    <div class="wrapper">
        <a href="/music"><img src="resources/image/mainlogo.png" alt=""></a>

        <br>

        <b>비밀번호 찾기</b>

        <br>

        <div id="pwdSearch-box">
            <form action="<%= request.getContextPath()%>/pwdUpdateForm" method="post">
                <b>사용 아이디 입력</b>
                <br>
                <input type="text" name="memberId" placeholder="아이디" required> 
                <br>
                <b>회원 이메일 입력</b>
                <br>
                <input type="email" name="memberEmail" placeholder="이메일" required> 
                <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
            </form>
        </div>

    </div>

        <!-- 알림창 스크립트 -->
		<%if(alertMsg != null){%>
			<script>
				alert("<%= alertMsg%>");
			</script>
			<% session.removeAttribute("alertMsg"); %>
		<%}%>
</body>
</html>