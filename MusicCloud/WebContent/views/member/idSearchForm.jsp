<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idSearchMsg = (String)request.getAttribute("alertMsg");
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
    input, #idSearchResult>div{
    width: 300px;
    height: 38px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
    margin-bottom: 10px;
    line-height: 38px;
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

    /*검색 결과 div*/
    #idSearchResult{
        width: 300px;
        margin: auto;
        margin-top: 20px;
    }
    #idSearchResult>b{
        text-align: center
    }
    #idSearchSuccess{
        display: none;
        color: #28a745;
    }
    #idSearchFail{
        display: none;
        color: #dc3545;
    }
    
</style>
</head>
<body>
    <div class="wrapper">
        <a href="/music"><img src="resources/image/mainlogo.png" alt=""></a>

        <br>

        <b>아이디 찾기</b>

        <br>

        <div id="pwdSearch-box">
            <b>회원 이메일 입력</b>
            <br>
            <input type="email" id="memberEmail" name="memberEmail" placeholder="이메일" required> <b>회원 실명 입력</b>
            <br>
            <input type="text" id="memberName" name="memberName" placeholder="실명" required> 
            <button type="button" class="btn btn-primary" onclick="idCheck()">아이디 찾기</button>
        </div>

        <div id="idSearchResult">
            <b>아이디 찾기 결과</b>
            <div id="idSearchSuccess">
                회원님의 아이디는 <b></b> 입니다
            </div>
            <div id="idSearchFail">
                존재하지 않는 회원 입니다
            </div>
        </div>

    </div>

        <!-- 알림창 스크립트 -->
		<%if(idSearchMsg != null){%>
			<script>
				alert("<%= idSearchMsg%>");
			</script>
			<% session.removeAttribute("alertMsg"); %>
		<%}%>

        <script>
            function idCheck(){
                $.ajax({
                    url:"idCheck",
                    data:{ 
                        memberEmail:$("#memberEmail").val(),
                        memberName:$("#memberName").val(),
                    },
                    success:function(member){
                    	if(member != null){
                    		$("#idSearchSuccess").css("display", "block");
                            $("#idSearchFail").css("display", "none");
                    		$("#idSearchSuccess b").text(member.memberId);
                    	}else{
                            $("#idSearchSuccess").css("display", "none");
                            $("#idSearchFail").css("display", "block");
                        }
                    },
                    error:function(){},
                })
            }
        </script>
</body>
</html>