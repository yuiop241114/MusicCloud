<%@page import="com.musicCloud.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.musicCloud.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

	/*제목*/
	#titleDiv{
		width: 60%;
		margin: auto;
	}
	#title{
		margin: auto;
		text-align: center;
		font-size: xx-large;
	}

	/* 관리자 페이지  박스 크기 설정*/
	.wrapperAdmin{
		width: 1400px;
		margin: auto;
	}
	.wrapperAdmin *{
	    box-sizing: border-box;
	}

	/* 관리자페이지 메뉴바 스타일속성 */
	#menuBox{
		float: left;
		width: 90%;
		margin-bottom: 20px;
	}
	menu {
    top: 0;
    background-color: #007bff;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    border-radius: 10px;
	width: 100%;
	margin: 0 15px;
	}

	/* 관리자페이지 메뉴바 텍스트 스타일속성 */
	#menutext {
	background-color: #007bff;
	border: none;
	color: white;
	font-size: 16px;
	margin: 0 15px;
	cursor: pointer;
	}

	/* 관리자 페이지 테이블 속성 */
	#memberListBox{
		width: 90%;
	}

	#mTable{
		width: 80%;
		border-color: #1587d0;
		border-left: none;
        border-right: none;
	}

	/* 관리자 페이지 테이블 td 스타일 */
	#mTable td{
		border-left: none;
        border-right: none;
		text-align: center;
		height: 40px;
	}
	
	/* 회원삭제 버튼 속성 */
	#deleteMember {
		width: 40%;
		color: white;
		cursor: pointer;
		border-radius: 10px;
		border: 1px solid red;
		height: 45px;
		
	}
	#adminInsertMember{
		width: 40%;
		color: white;
		cursor: pointer;
		border-radius: 10px;
		border: 1px solid green;
		height: 45px;
	}
	#btnTd{
		width: 100px;
	}

	


	</style> 
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div id="titleDiv">
		<div id="title">관리자페이지-회원삭제</div>
	</div>

	<br>
	
	<div class="wrapperAdmin">
		
			<div id="menuBox">
				<menu>
					<a href="" id="menutext">메인페이지</a>
					<a href="" id="menutext">음원관리</a>
					<a href="" id="menutext">회원관리</a>
					<a href="" id="menutext">게시글관리</a>
					<a href="" id="menutext">유료 컨텐츠 관리</a>	
				</menu>
			</div>
			
					
			<div id="memberListBox">
				<table id="mTable" align="center" border="1">
						<tr>
							<td>회원선택</td>
							<td>회원번호</td>
							<td>가입날짜</td>
							<td>회원아이디</td>
							<td>회원이름</td>
							<td>활동상태</td>
							<td rowspan="<%= list.size() + 1%>" id="btnTd"><button type="button" id="adminInsertMember" class="btn-success">Y</button></td>
							<td rowspan="<%= list.size() + 1%>" id="btnTd"><button type="button" id="deleteMember" class="btn-danger">X</button></td>
							
						</tr>

						<!-- case1. 내역이 없을경우 -->
						<% if(list.isEmpty()) { %>
						<tr>
							<td colspan="5" align="center"></td>
						</tr>
						<% } else { %>
	
						<!-- case2. 내역이 있는경우 -->
						<% for(Member m:list) { %>
							<tr>
								<td style="text-align: center;"><input type="checkbox" class="check" value="<%= m.getMemberNo() %>"></td>
								<td><%= m.getMemberNo() %></td>
								<td><%= m.getMemberName() %></td>
								<td><%= m.getMemberId() %></td>
								<td><%= m.getEnrollDate() %></td>
								<!-- join 해서 Member/vo/Member에서 작성자 아이디, 닉네임 가져오기 -->
								<td><%= m.getStatus()%></td>
							</tr>
							<% } %>
						<% } %>

				</table>
			
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

	</div>



	
	<script>
	    $(document).ready(function () {
	        let selectedMembers = [];
	        
	        $("#deleteMember").click(function () {
	 
	            selectedMembers = [];
	            $("input[type=checkbox]:checked").each(function(){
	       			selectedMembers.push($(this).val());
	        	})
	        	
	            if (selectedMembers.length === 0) {
	                alert("삭제할 회원을 선택하세요.");
	                return;
	            }
	
	            if (confirm("정말 삭제하시겠습니까?")) {
	                $.ajax({
	                    type: "POST",
	                    url: "MemberDelete.bo",
	                    data: { members: selectedMembers.join(",") }, // 배열을 문자열로 변환
	                    success: function (response1) {
	                        if (response1.trim() === "success") {
	                            alert("회원 삭제 완료!");
								location.reload();
	                        } else {
	                            alert("삭제 실패! 다시 시도하세요.");
	                        }
	                    },
	                    error: function () {
	                        alert("서버 오류 발생!");
	                    }
	                });
	            }
	        });
	        
	        // ----------------------- 복구 기능 구현 1 -----------------------
	        $("#adminInsertMember").click(function () {
	       	 
	            selectedMembers = [];
	            $("input[type=checkbox]:checked").each(function(){
	       			selectedMembers.push($(this).val());
	        	})
	        	
	            if (selectedMembers.length === 0) {
	                alert("복구할 회원을 선택하세요.");
	                return;
	            }
	
	            if (confirm("복구하시겠습니까?")) {
	                $.ajax({
	                    type: "post",
	                    url: "adminInsertMember.bo",
	                    data: { members: selectedMembers.join(",") }, // 배열을 문자열로 변환
	                    success: function (response2) {
	                        if (response2.trim() === "success") {
	                            alert("회원 복구 완료!");
	                            location.reload();
	                        } else {
	                            alert("복구 실패! 다시 시도하세요.");
	                        }
	                    },
	                    error: function () {
	                        alert("서버 오류 발생!");
	                    }
	                });
	            }
	        });
	    });
	</script>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
																
</body>
</html>