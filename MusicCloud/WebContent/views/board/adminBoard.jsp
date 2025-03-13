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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
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
		border: 1px solid #000000;
		background-color: #7eb6f3;
	}

	/* 관리자 페이지 테이블 td 스타일 */
	table td{
		background-color: #ffffff;
	}
	
	/* 회원삭제 버튼 속성 */
	#deleteMember {
		background-color: red;
		color: white;
		cursor: pointer;
		
	}


	</style> 
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	
	<img src="resources/image/mainlogo.png" id="logo">
	<br>
	<h2 align="center">관리자페이지-회원삭제</h2>
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
				<td>회원선택</td>
				<td width="70">회원번호</td>
				<td width="80">가입날짜</td>
				<td width="100">회원아이디</td>
				<td width="100">회원이름</td>
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
					<td style="text-align: center;"><input type="checkbox"></td>
					<td><%= b.getMemberNo() %></td>
					<td><%= b.getEnrollDate() %></td>
					<td><%= b.getMemberId() %></td>
					<td><%= b.getMemberName() %></td>
					<!-- join 해서 Member/vo/Member에서 작성자 아이디, 닉네임 가져오기 -->
					<th>
						<button type="button" class="btn btn-danger" id="deleteMember">
							<!-- 나중에 회원삭제 테이블 만들 자리.  -->X
						</button>
					</th>
				</tr>
				<% } %>
			<% } %>
		</tbody>
	</table>
	
	<script>
	$(function(){
		$(".list-area>tbody>tr").click(function(){
			loaction.href = '<%= contentPath%>/detail.bo?bno=' + $(this).children().eq(0).text();
		})
	})
	</script>
	
	<br> <br>
	
		<div class="paging-area" align="center">
			<!-- 이전 버튼 출력 -->
			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contentPath%>/list.bo?cpage=<%= currentPage-1%>'">&lt;</button>
			<% } %>
			
			<!-- 반복문으로 베이징바를 설정한 개수만큼 출력 -->
			<% for(int p=startPage; p<=endPage; p++) {%>
				<% if(p == currentPage) { %>
					<button disabled><%=p%></button>
				<%}else { %>
					<button onclick="location.href='<%= contentPath %>/list.bo?cpage=<%=p%>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<!-- 다음 버튼 -->
			<%if(currentPage != maxPage){ %>
			<button onclick="location.href='<%= contentPath%>/list.bo?cpage<%= currentPage+1%>'">&gt;</button>
			<%} %>
		</div>
	</div>


</body>
</html>