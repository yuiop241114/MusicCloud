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
    .main-2 b{ font-size: xx-large;}

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
    .myInfo input, #myModal input{
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
   .myInfo>div table{ 
        width: 100%; 
        border: 1px solid #1587d0;
        border-left: none;
        border-right: none;
    }

    #submitBtn{
        margin-top: 10px;
    }

   /*아이디 중복 메세지*/
    #idMsg *{
        display: none;
    }
    #idMsg>div{
    	color: #dc3545;
    }

    /*회원탈퇴 모달*/
    .modal-body th{
        line-height: 40px;
    }


    /*친구리스트*/
    .friendListDiv>div{
        width: 90%;
        margin: auto;
    }
    .friendListDiv table{
        width: 100%; 
        border: 1px solid #1587d0;
        border-left: none;
        border-right: none;
    }

    #addFriendBtn{
        background-color: #1587d0;
        margin-bottom: 10px;
    }
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
                <button id="infoBtn" class="myPageList" style="font-weight: bold; background: none; border: none; cursor: pointer;">내정보</button>
                <br>
                <button id="friendListBtn" class="myPageList" style="font-weight: bold; background: none; border: none; cursor: pointer;">친구리스트</button>
                <br>
                <a href="<%= contentPath%>/logout" class="myPageList"><b>로그아웃</b></a>
                <br>
                <btn type="button" class="myPageList" data-toggle="modal" data-target="#myModal"><b>회원탈퇴</b></btn>

            </div>
            <div class="main-2">
                
                <br>
                <div class="myInfo" style="display: none;">
                    <div id="myPageInfo"> <!-- 정보 수정 폼 -->
                        <b>내정보</b>
                        <form action="<%= contentPath%>/updateMemberInfo" method="post">
                        		<!-- update시 사용할 회원번호 -->
                        		<input type="hidden" name="memberNo" id="memberNo" value="<%= loginMember.getMemberNo()%>">
                            <table>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <%if(loginMember.getMemberPwd().equals("sociallogin")){%>
                                        <!-- 소셜 로그인인 경우 -->
                                        	<input type="text" placeholder="소셜 로그인 이용자 입니다" readonly>
                                        	<input type="hidden" name="memberId" value="<%= loginMember.getMemberId()%>">
                                        <%}else{ %>
                                        	<input type="text" name="memberId" id="memberId" oninput="memberIdCheck()" value="<%= loginMember.getMemberId()%>">
                                        <%} %>
                                        <br>
                                        <div id="idMsg">
                                            <div>다시 입력해주세요</div>
                                        </div>
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
                                    <td>
                                    <%if(loginMember.getMemberPwd().equals("sociallogin")){%>
                                    	<input type="email" name="memberEmail" value="<%= loginMember.getEmail() %>" readonly>
                                    <%}else{%>
                                    	<input type="email" name="memberEmail" value="<%= loginMember.getEmail() %>">
                                    <%} %>
                                   	</td>
                                </tr>
                                <tr>
                                    <th>나이</th>
                                    <td><input type="number" name="age" value="<%= loginMember.getAge()%>"></td>
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
                                            	<%if(l.getLocationNo() == loginMember.getLocationNo()) {%>
                                            		<option value="<%= l.getLocationNo()%>" selected><%= l.getLocationName()%></option>
                                            	<%}else{ %>
                                                <option value="<%= l.getLocationNo()%>"><%= l.getLocationName() %></option>
                                            	<%} %>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                            </table>   
                            <button type="submit" id="submitBtn" class="btn btn-danger">정보 수정</button>
                        </form>
                    </div>

                    <br>

                    <div id="payment-detail">
                        <b>결재 내역</b>
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




            <div id="friendList" class="friendListDiv">
                <div>
                    <b>친구리스트</b>
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <button id="addFriendBtn" data-toggle="modal" data-target="#addFriendModal" class="btn btn-primary">친구 추가</button>
                    <table id="friendList" class="myPageTable">
                        <thead>
                            <tr>
                                <th>친구이름</th>
                                <th>최근 재생음악</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
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

    <!-- 모달 -->

    <!-- 친구 추가 모달-->
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

    <!-- 회원탈퇴 모달-->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">회원 탈퇴</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
                <b>회원 탈퇴를 위한 정보 입력</b> <br> (소셜 로그인인 경우 정보입력 없이 회원탈퇴 버튼을 눌러주세요)
                <form action="<%= contentPath%>/memberSecession">
                		<input type="hidden" name="memberNo" value="<%= loginMember.getMemberNo()%>">
                    <table>
                   			<%if(loginMember.getMemberPwd().equals("sociallogin")){%>
                   				<tr>
	                            <th>회원 아이디</th>
	                            <td><input type="text" name="memberId" value="<%= loginMember.getMemberId()%>"></td>
	                        </tr>
	                        <tr>
	                            <th>회원 비밀번호</th>
	                            <td><input type="password" name="memberPwd" value="<%= loginMember.getMemberPwd()%>"></td>
	                        </tr>
                   			<%}else{ %>
	                        <tr>
	                            <th>회원 아이디</th>
	                            <td><input type="text" name="memberId"></td>
	                        </tr>
	                        <tr>
	                            <th>회원 비밀번호</th>
	                            <td><input type="password" name="memberPwd"></td>
	                        </tr>
                   			<%} %>
                    </table>
                    <button type="submit" class="btn btn-danger">회원탈퇴</button>
              			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </form>
            </div>
          </div>
        </div>
      </div>


    <script>
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

        //아이디 중복체크
        function memberIdCheck(){
            $.ajax({
                url:"memberIdCheck",
                data:{ memberId:$("#memberId").val() },
                success:function(result){
                    if(result == "success"){
                        $("#idMsg>div").css("display", "none"); 
                        $("#submitBtn").removeAttr("disabled");
                    }else{
                        $("#idMsg>div").css("display", "block");
                        $("#submitBtn").attr("disabled","disabled");
                    }
                },
                error:function(){},
            })
        }
        $(function(){

            //친구 리스트 가져오는 ajax
            $.ajax({
                url:"friendList",
                data:{ memberNo:$("#memberNo").val()},
                success:function(friendList){
                	//memberNo : 로그인 회원 번호
                	//memberId : 친구 이름
                	//memberName : 최근 감상한 음원명,가수명
                	let content = "";
                	if(friendList != null){
                        for(let i=0; i<friendList.length; i++){
                        	content += "<tr>"
                        					 + "<td>" + friendList[i].memberId + "</td>"
                            			 + "<td>" + friendList[i].memberName + "</td>"
                            			 + "</tr>"
                        }
                        $("#friendList>tbody").html(content);
                    }
                },
                error:function(){
                	console.log("친구리스트 ajax 안됨")
                },
            })

        })

    </script>
</body>
</html>