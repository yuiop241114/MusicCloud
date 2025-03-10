<%@page import="com.musicCloud.member.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Location> lList = (ArrayList<Location>)request.getAttribute("lList");
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
    /*전체 div*/
    #enroll-form{

    }
    #enroll-form>img{
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


</style>
</head>
<body>
    <div id="enroll-form">

        <img src="resources/image/mainlogo.png" alt="">
        
        <div id="enroll-div">

            <form action="<%= request.getContextPath()%>/memberEnroll" class="was-validated">
                <div class="form-group">
                  <input type="text" class="form-control" name="memberId" placeholder="아이디" required>
                  <div class="valid-feedback">사용가능한 아이디 입니다.</div>
                  <div class="invalid-feedback">아이디는 필수입력사항 입니다.</div>
                </div>

                <div class="form-group">
                  <input type="password" class="form-control" placeholder="비밀번호" name="memberPwd" required>
                  <div class="valid-feedback">사용가능한 비밀번호 입니다.</div>
                  <div class="invalid-feedback">비밀번호는 필수입력사항 입니다.</div>
                </div>

                <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일" name="memberEmail" required>
                  <div class="valid-feedback">사용가능한 이메일 입니다.</div>
                  <div class="invalid-feedback">이메일는 필수입력사항 입니다</div>
                </div>

                <div class="form-group">
                    <input type="text" class="form-inline" placeholder="별칭" name="memberName">
                </div>

                <div class="dateBox">
                      생년월일
                      <input type="date" name="ageDate"> 
                </div>

                <div class="form-group">
                    성별
                    <select class="form-control" name="gender">
                      <option value="M">남자</option>
                      <option value="W">여자</option>
                    </select>
                </div>

                <div class="form-group">
                    거주 지역
                    <select class="form-control" name="locationNo">
                      <%for(Location l : lList) {%>
                      	<option value="<%= l.getLocationNo()%>"><%= l.getLocationName()%></option>
                      <%} %>
                    </select>
                </div>
              	<button class="btn btn-primary">회원가입</button>
              </form>
        </div>

    </div>

    <br><br><br><br><br><br><br><br><br><br>
</body>
</html>