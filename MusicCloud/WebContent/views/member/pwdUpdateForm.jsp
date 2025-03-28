<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)request.getAttribute("memberId");
	String updatePwdMsg = (String)request.getAttribute("alertMsg");
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
        width: 400px;
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
    /*조건 결과 문주*/
    #pwdMsg *{
        display: none;
    }
    #pwdMsg>div{ 
        color: #28a745; 
        margin-bottom: 10px;
    }
    #pwdMsg>div+div{ 
        color: #dc3545; 
        margin-bottom: 10px;
    }

    input {
    width: 100%;
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

        <b>비밀번호 변경</b>

        <br>

        <div id="pwdSearch-box">
            <form action="<%= request.getContextPath()%>/pwdUpdate" method="post">
            		<input type="text" name="memberId" value="<%= memberId%>" style="display: none;">
                <b>변경할 비밀번호 입력</b>
                <br>
                <input type="password" id="updatePwd" name="updatePwd" oninput="memberPwdCheck()" placeholder="변경할 비밀번호" required> 
                <div id="pwdMsg">
                    <div>사용가능한 비밀번호 입니다</div>
                    <div>영문(대문자 한개 이상), 숫자, 특수문자 포함한 8자 이상</div>
                </div>
                <b>변경할 비밀번호 확인</b>
                <br>
                <input type="password" id="updateCheckPwd" oninput="updatePwdCheck()" placeholder="변경할 비밀번호 확인" required> 
                <button type="submit" class="btn btn-primary" disabled>비밀번호 변경</button>
            </form>
        </div>

    </div>

    <script>
        $(function(){

        })
        //비밀번호 정규표현식
        //영문(대소문자하나이상), 특수문자, 8글자 이상
        let pwdCheck = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
        function memberPwdCheck(){
            if(!pwdCheck.test($("#updatePwd").val())){
                //조건 만족 X
                $("#pwdMsg>div").css("display", "none");
                $("#pwdMsg>div+div").css("display", "block");
                $("button").attr("disabled","disabled");
            }else{
                $("#pwdMsg>div").css("display", "block");
                $("#pwdMsg>div+div").css("display", "none");
            }
        }

        function updatePwdCheck(){
            //비밀번호 확인 후 일치 하면 버튼 활성화
            if($("#updatePwd").val() == $("#updateCheckPwd").val()){
                if($("#pwdMsg>div").css("display") == "block"){
                    $("button").removeAttr("disabled");
                }
            }
        }
    
    </script>

    <!-- 알림창 스크립트 -->
    <% if(updatePwdMsg != null){%>
        <script>
            alert("<%= updatePwdMsg%>")
        </script>
        <% session.removeAttribute("alertMsgEnroll"); %>
    <%}%>
</body>
</html>