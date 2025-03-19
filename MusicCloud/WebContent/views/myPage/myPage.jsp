<%@page import="com.musicCloud.member.model.vo.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  ArrayList<Location> locationList = (ArrayList<Location>)request.getAttribute("locationList");  
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
    .wrapperMypage{
        width: 1450px;
        margin: auto;

    }
    .content{
        height: 1800px;
        width: 1200px;
    }
    .header {
    background-color: rgb(246, 246, 246);
    height: 5%;
   
}

.header-1 {
    width: 15%;
    float: left;
    height: 100%; /* 부모 요소(header)의 높이 100% */
    text-align: center; /* 가로 중앙 정렬 */
    line-height: 100px; /* header 높이에 맞게 조정 (ex. 50px) */
}



.point {
    margin: 10px 10px 10px 10px;
    
    height: 100%;
    background-color: white;
    border-radius: 10px;
    width: 90%; /* 전체 너비보다 약간 작게 설정 */
}

.point-1 {
    padding: 2rem;
    float: left; /* 왼쪽 정렬 */
}

.point-2 {
    padding: 2rem;
    float: right; /* 오른쪽 정렬 */
    margin-top: 5px;
    margin-right: 20px;
}


    .main{
        height: 70%;
        padding: 2rem;

    }

    .main-1 {
    float: left;
    height: 100%;
    width: 20%;
    text-align: center; /* 가로 중앙 정렬 */
    position: relative; /* 부모 요소 기준 배치 */
    }

    /*로그아웃 a태그*/
    .main-1 a{
        text-decoration-line: none;
        color: black;
    }
    .main-2{
        float: left;
        width: 70%;
    }
    

    .footer{
        height: 20%;
    }
    .footer-1{
        width: 20%;
        float: left;
        padding: 2rem;
    }
    .footer-2{
        width: 80%;
        float: left;
    }

    .main-1 img{
        height: 200px;
        width: 200px;
        border-radius: 10px;
    }
    .main-1 b{
        
    }
    .myPageTable table{
        width: 100%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid #eee;
    }
    .myPageTable th, td {
        padding: 12px;
        text-align: left;
    }
    .myPageTable th {
        background-color: #f8f8f8;
        font-weight: bold;
        color: gray;
    }
    .myPageTable td {
        font-weight: bold;
        color: #444;
    }
    .myPageTable tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .myPageTable tr td b {
        color: rgb(221, 0, 221);
        text-decoration: none;
        font-weight: bold;
    }

    /*회원탈퇴 내정보 친구리스트 로그아웃*/
    .myPageList:hover{
        color: gray;
        text-decoration: none;
    }

    /*input select 스타일*/
    .myInfo input {
    width: 200px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
    margin-bottom: 10px;
    }
    .myInfo select{
    width: 200px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233, 233, 233);
    margin-bottom: 10px;
    }

    /*회원 정보*/
   .myInfo{
   }
   .myInfo>div{
    width: 90%;
    margin: auto;
   }
   .myInfo>div table{ width: 100%; }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>


    <div class="wrapperMypage">
        <div class="content">

        <div class="header">

            <div class="header-1">
                <b style="margin: auto; text-align: center; color: #444; font-size: larger;">마이페이지</b>
            </div>

            
            </div>
        
        <div class="main">

            <div class="main-1">
                <img src="resources/image/열불이.png" alt="">
                <br>
                <b>유저 이름</b>
                <br>
                <b style="color: gray;"><%= loginMember.getMemberAlias()%></b>

                <br>
                
                <br>
                <b class="myPageList">회원탈퇴</b>
                <br>
                <button id="infoBtn" class="myPageList" style="font-weight: bold; background: none; border: none; cursor: pointer;">내정보</button>
                <br>
                <button id="friendListBtn" class="myPageList" style="font-weight: bold; background: none; border: none; cursor: pointer;">친구리스트</button>
                <br>
                <a href="<%= contentPath%>/logout" class="myPageList"><b>로그아웃</b></a>

            </div>
            <div class="main-2">
                
                <br>
                <div class="myInfo" style="display: none;">
                    <div id="myPageInfo"> <!-- 정보 수정 폼 -->
                        <b style="font-size: xx-large;">내정보</b>
                        <form action="">
                            <table>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <%if(loginMember.getMemberPwd() == "1"){%>
                                        <!-- 소셜 로그인인 경우 -->
                                        	<input type="text" name="memberId" placeholder="소셜 로그인 이용자 입니다">
                                        <%}else{ %>
                                        	<input type="text" name="memberId" value="<%= loginMember.getMemberId()%>">
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <th>실명</th>
                                    <td><input type="text" name="memberName" value="<%= loginMember.getMemberName() %>"></td>
                                </tr>
                                <tr>
                                    <th>별칭</th>
                                    <td><input type="text" name="memberAlias" value="<%= loginMember.getMemberAlias() %>"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="email" name="memberEmail" value="<%= loginMember.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <th>나이</th>
                                    <td><input type="text" name="age" value="<%= loginMember.getAge()%>"></td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td><select name="gender">
                                        <option value="M">남자</option>
                                        <option value="F">여자</option>
                                    </select></td>
                                </tr>
                                <tr>
                                    <th>거주 지역</th>
                                    <td>
                                        <select name="locationNo" id="">
                                            <%for(Location l : locationList){%>
                                                <option value="<%= l.getLocationNo()%>"><%= l.getLocationName() %></option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                            </table>   
                            <button type="submit" class="btn btn-danger">정보 수정</button>
                        </form>
                    </div>

                    <br>

                    <div id="payment-detail">
                        <b style="font-size: xx-large;">프리뷰 사용내역</b>
                        <table class="myPageTable">
                            <thead>
                                <tr>
                                    <th>날짜</th>
                                    <th>사용서비스</th>
                                    <th>사용내역</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <!-- JSP 반복부문 -->
                                <tr>
                                    <td>2022-12-01 16:37:06</td>
                                    <td>서동진 플레이리스트<br>구매</td>
                                    <td><b>1,000</b></td>
                                    
                                </tr>
                                <!-- JSP 반복부문 -->
                            </tbody>
                        </table>
                    </div>
            </div>




            <div id="friendList">
                <b>친구리스트</b>
                &nbsp; &nbsp; &nbsp; &nbsp;
                <button id="addFriendBtn" data-toggle="modal" data-target="#addFriendModal" 
                style="color: white; background-color: rgb(165, 0, 165); border-radius: 5px; border: none; 
                font-weight: bold; font-size: 12px; height: 30px; ">
            친구 추가
             </button>
                <table id="friendList" class="myPageTable" style="border-collapse: collapse; ">
                    <thead>
                        <tr>
                            <th>추가한날짜</th>
                            <th>친구이름</th>
                            <th style="color: rgb(0, 195, 140);">최근 재생음악</th>
                        </tr>
                    </thead>
                    <tbody>
                        <td>2022-12-01 16:37:06</td>
                        <td>일호석</td>
                        <td>볼빨간사춘기-여행</td>
                    </tbody>

                </table>
            </div>

        </div>
    </div>


        <div class="footer">
            <div class="footer-1">
                <b style="color: gray; margin: auto; font-size: 20px;">뮤직클라우드</b>
            </div>

            <div class="footer-2">
                <b style="color: rgb(57, 57, 57); ">이용약관</b> 
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <b style="color: rgb(57, 57, 57);">개인정보처리방침</b>
                <br>
                <b style="color: gray; font-size: 12px;">회사명|대표자명|사업자등록번호|회사주소</b>
                <br>
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <b style="color: gray; font-size: 12px;">전화문의</b>
                <br>
                <p style="font-size: 10px; color: gray;">Copyright Co. Allrights reserved</p>
            </div>
        </div>

        </div>
    </div>
</div>


<div class="modal fade" id="addFriendModal" tabindex="-1" role="dialog" aria-labelledby="addFriendModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addFriendModalLabel">친구 추가</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>추가할 친구의 정보를 입력하세요.</p>
                
                <div class="text-center">
                    <button class="btn btn-outline-primary" id="searchById">아이디로 찾기</button>
                    <button class="btn btn-outline-primary" id="searchByName">이름으로 찾기</button>
                </div>

                <br>
                <label for="friendId" id="friendId">친구 아이디</label>
                <input type="text" id="friendIdInput" class="form-control" placeholder="친구 아이디 입력">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">추가</button>
            </div>
        </div>
    </div>
</div>
<script>
    /*
    document.getElementById("infoBtn").addEventListener("click", function() {
        var infoDiv = document.querySelector(".myInfo"); // 클래스 선택자로 변경
        if (infoDiv.style.display === "none" || infoDiv.style.display === "") {
            infoDiv.style.display = "block";
        } else {
            infoDiv.style.display = "none";
        }
    });

    document.getElementById("friendListBtn").addEventListener("click", function(){
        var friendListDiv = document.getElementById("friendList");  // id 선택으로 연습해 보기
        if(friendListDiv.style.display === "none" || friendListDiv.style.display === ""){
        friendListDiv.style.display = "block";
    }else{
        friendListDiv.style.display ="none";
    }
    });*/
    /* 아무거나 */
    document.addEventListener("DOMContentLoaded", function() {
    var infoDiv = document.querySelector(".myInfo");
    var friendListDiv = document.getElementById("friendList");
    
    infoDiv.style.display = "block";
    friendListDiv.style.display = "none";

    document.getElementById("infoBtn").addEventListener("click", function() {
        infoDiv.style.display = "block";
        friendListDiv.style.display = "none";
    });

    document.getElementById("friendListBtn").addEventListener("click", function(){
        infoDiv.style.display = "none";
        friendListDiv.style.display = "block";
    });
});

    document.getElementById("searchById").addEventListener("click", function() {
        document.getElementById("friendId").innerText = "친구 아이디";
        document.getElementById("friendIdInput").placeholder = "친구 아이디 입력";
    });

    document.getElementById("searchByName").addEventListener("click", function() {
        document.getElementById("friendId").innerText = "친구 이름";
        document.getElementById("friendIdInput").placeholder = "친구 이름 입력";
    });


</script>
</body>
</html>