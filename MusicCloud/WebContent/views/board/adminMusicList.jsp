<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@page import="com.musicCloud.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.musicCloud.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지-신고테이블</title>
<style>
	/* 관리자 페이지 속성 */
	.wrapper{
	    box-sizing: border-box;
	    height: 170px;
	}

	/* 관리자 페이지  박스 크기 설정*/
	.wrapper *{
	    box-sizing: border-box;
	}
	
	/* 관리자 페이지 로고 크기설정 */
	.wrapper #logo{
	    width: 15%;
	    height: 100%;
	}
	
	/* 관리자페이지 로그인 박스 */
	.wrapper #login-box{
	    width: 25%;
	    height: 100%;
	    float: right;
			text-align: center;
			border: 1px solid #1587d0;
			border-radius: 30px;
	}

	/* 관리자페이지 로그인 버튼 */
	#login-btn{
		background-color: #1587d0;
		width: 80%;
		line-height: 40px;
		margin-top: 40px;
        color: white;
	}

	/* 관리자 페이지 로그인 박스 텍스트 색상 */
	#login-box a{
		color: black;
	}

	/* 관리자페이지 메뉴바 스타일속성 */
	menu {
    top: 0;
    background-color: #007bff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    border-radius: 10px;
	}

	/* 관리자페이지 메뉴바 텍스트 스타일속성 */
	#menutext {

	background-color: #007bff;
	border: none;
	color: white;
	font-size: 16px;
	margin: 0 10px;
	cursor: pointer;
	}

    /* 관리자 페이지 테이블 속성 */
	table{
		border: 1px solid #08edf5;

	}

	/* 관리자 페이지 테이블 td 스타일 */
	table td{
        border: 1px solid #08edf5;
        background-color: #ffffff;
	}

	/* 공개여부 버튼 스타일 */
	#YNbtn{
		display: flex;
		margin: auto;
	}


	</style> 
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <img src="resources/image/mainlogo.png" id="logo">
    <br>
    <h2 align="center">관리자페이지-음원관리</h2>
    <br>

    <div class="wrapper">

        <menu>
            <a href="" id="menutext">메인페이지</a>
            <a href="" id="menutext">음원관리</a>
            <a href="" id="menutext">회원관리</a>
            <a href="" id="menutext">게시글관리</a>
            <a href="" id="menutext">유료 컨텐츠 관리</a>

        </menu>
    
        <div id="login-box">   
            <% if(loginMember == null){ %>
                <h1><button type="button" onclick="location.href='<%= contentPath%>/loginForm'" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
                <a href="">회원가입</a> | <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>
            <%}else { %>
                <div>
                <%= loginMember.getMemberName()%> 회원 로그인 중
                <br>
                <a href="<%= contentPath%>/logout" class="btn btn-sm btn-secondary">로그아웃</a>
                </div>
            <%} %>
        </div>
        
        <table align="center" class="list-area">
            <thead>
                <tr>
                    <td width="70">제목</td>
                    <td width="80">아티스트</td>
                    <td width="100">등록일</td>
                    <td width="100">장르</td>
                    <td>공개여부 Y/N</td>
                </tr>
                
            </thead>
            <tbody>
                <!-- case1. 내역이 없을경우 -->
                <% if(list.isEmpty()) { %>
                <tr>
                    <td colspan="5" align="center">조회된 내역이 없습니다</td>
                </tr>
                <% } else { %>
    
                <!-- case2. 내역이 있는경우 -->
                <% for(Board b:list) { %>
                    <tr>
                        <td><%= b.getBoardNo() %></td>
                        <td><%= b.getReportNo() %></td>
                        <td><%= b.getReportDate() %></td>
                        <td><%= b.getMemberName() %></td>
                        <!-- join 해서 Member/vo/Member에서 작성자 아이디, 닉네임 가져오기 -->
                        <td>
                            <button type="button" id="YNbtn">
                                <!-- 나중에 게시글삭제 테이블 만들 자리.  -->Y
                            </button>
                        </td>
                    </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>

    </div>

</body>
</html>