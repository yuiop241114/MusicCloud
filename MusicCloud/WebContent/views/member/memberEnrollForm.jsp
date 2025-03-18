<%@page import="com.musicCloud.member.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
	String alertMsgEnroll = (String)session.getAttribute("alertMsgEnroll");
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
    input{
        border-radius: 5px;
    }
    /*전체 div*/
    #enroll-form{

    }
    #enroll-form>a>img{
        display: block;
        margin: auto;
        width: 200px;
        height: 150px;
        margin-bottom: 20px;
    }

    /*회원가입정보 div*/
    #enroll-div{
        box-sizing: border-box;
        width: 450px;
        margin: auto;
    }
    #enroll-div input{
        width: 100%;
        height: 50px;
        font-size: large;
    }
    #enroll-div button{ 
        width: 100%; 
    }

    /*정보입력 div*/
    .form-group input{
        margin: auto;
    }
    #memberName{ padding: 10px; }

    div{ margin-bottom: 10px;}

    #idMsg *, #pwdMsg *{
        display: none;
    }
    #idMsg>div, #pwdMsg>div{
    	color: #28a745;
    }
    #idMsg>div+div, #pwdMsg>div+div{
    	color: #dc3545;
    }
    
    input {
    width: 500px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
    margin-bottom: 10px;
    }
    select{
    width: 450px;
    height: 32px;
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
    <div id="enroll-form">

        <a href="/music"><img src="resources/image/mainlogo.png" alt=""></a>
        
        <div id="enroll-div">

            <form action="<%= request.getContextPath()%>/memberEnroll">
                <b>아이디</b>
                <input type="text" id="memberId" name="memberId" oninput="memberIdCheck()" placeholder="아이디" required>
                <div id="idMsg">
                    <div>사용가능한 아이디 입니다</div>
                    <div>중복되는 아이디 입니다</div>
                </div>

                <b>비밀번호</b>
                <input type="password" id="memberPwd" name="memberPwd" oninput="memberPwdCheck()" placeholder="영문(대문자 한개 이상), 숫자, 특수문자 포함한 8자 이상" required>
                <div id="pwdMsg">
                    <div>사용가능한 비밀번호 입니다</div>
                    <div>영문(대문자 한개 이상), 숫자, 특수문자 포함한 8자 이상</div>
                </div>

                <b>실명</b>
                <input type="text" placeholder="실명" name="memberAlias">

                <b>별칭</b>
                <input type="text" placeholder="별칭" name="memberName">

                <b>이메일</b>
                <input type="email" placeholder="이메일" name="memberEmail">

                <b>생년월일</b>
                <input type="date" name="ageDate"> 

                <b>성별</b>
                <select name="gender">
                  <option value="M">남자</option>
                  <option value="F">여자</option>
                </select>

                <b>거주 지역</b>
                <select name="locationNo">
                  <%for(Location l : lList) {%>
                  	<option value="<%= l.getLocationNo()%>"><%= l.getLocationName()%></option>
                  <%} %>
                </select>
              	<button class="btn btn-primary" disabled="disabled">회원가입</button>
              </form>
        </div>

    </div>

    <br><br><br><br><br><br><br><br><br><br>
    
   	<!-- 알림창 스크립트 -->
   	<% if(alertMsgEnroll != null){%>
   		<script>
   			alert("<%= alertMsgEnroll%>")
   		</script>
   		<% session.removeAttribute("alertMsgEnroll"); %>
   	<%}%>
   	
   	<script>
   		//비밀번호 정규표현식
        //영문(대소문자하나이상), 특수문자, 8글자 이상
        let pwdCheck = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
        function memberPwdCheck(){
            if(!pwdCheck.test($("#memberPwd").val())){
                //조건 만족 X
                $("#pwdMsg>div").css("display", "none");
                $("#pwdMsg>div+div").css("display", "block");
                $("button").attr("type","submit").attr("disabled","disabled");
            }else{
                $("#pwdMsg>div").css("display", "block");
                $("#pwdMsg>div+div").css("display", "none");
                $("button").attr("type","submit").removeAttr("disabled");
            }
        }

   		//아이디 중복체크
   		function memberIdCheck(){
   				$.ajax({
   	   				url:"memberIdCheck",
   	   				data:{ memberId:$("#memberId").val() },
   	   				success:function(result){
                        console.log(result);
   	   					let massage = "";
   	   					if(result == "success"){
                            //성공
   	   						$("#idMsg>div").css("display", "block");
   	   						$("#idMsg>div+div").css("display", "none");
                            $("button").attr("type","submit").removeAttr("disabled");
   	   					}else{
                            //실패
                            $("#idMsg>div").css("display", "none");
   	   						$("#idMsg>div+div").css("display", "block");
                            $("button").attr("type","submit").attr("disabled","disabled");
                        }
   	   				},
   	   				error:function(){},
   	   			})
   			}
   		
   	</script>
</body>
</html>