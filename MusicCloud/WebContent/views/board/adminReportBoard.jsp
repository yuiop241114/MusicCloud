<%@page import="com.musicCloud.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.musicCloud.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지-신고테이블</title>
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
	
	/* 글삭제 버튼 속성 */
	#adminDeleteBoard {
		width: 40%;
		color: white;
		cursor: pointer;
		border-radius: 10px;
		border: 1px solid red;
		height: 45px;
		
	}
	/* 글복구 버튼 속성*/
	#adminInsertBoard{
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
		<div id="title">관리자페이지-게시글삭제</div>
	</div>
	<br>
    <div class="wrapper">

        <menu>
            <a href="<%=contentPath %>/views/common/mainPage.jsp" id="menutext">메인페이지</a>
			<a href="<%=contentPath %>/views/board/adminMusicList.jsp" id="menutext">음원관리</a>
			<a href="<%=contentPath %>/Admin.bo?cpage=1" id="menutext">회원관리</a>
			<a href="<%=contentPath %>/AdminReport.bo?cpage=1" id="menutext">게시글관리</a>
            <a href="" id="menutext">유료 컨텐츠 관리</a>

        </menu>
    

       
        <div id="ReportBoardListBox">
				<table id="mTable" align="center" border="1">
						<tr>
							<td>게시글선택</td>
							<td>회원번호</td>
							<td>게시글제목</td>
							<td>글작성자</td>
							<td>활성상태</td>
							<td rowspan="<%= list.size() + 1%>" id="btnTd"><button type="button" id="adminInsertBoard" class="btn-success">Y</button></td>
							<td rowspan="<%= list.size() + 1%>" id="btnTd"><button type="button" id="adminDeleteBoard" class="btn-danger">X</button></td>
							
						</tr>

						<!-- case1. 내역이 없을경우 -->
						<% if(list.isEmpty()) { %>
						<tr>
							<td colspan="5" align="center"></td>
						</tr>
						<% } else { %>
	
						<!-- case2. 내역이 있는경우 -->
						<% for(Board b:list) { %>
							<tr>
								<!-- 게시글 카테고리 가져오기 -->
								<td style="text-align: center;"><input type="checkbox" class="check" value="<%= b.getMemberNo() %>"></td>
								<td><%= b.getMemberNo() %></td>
								<td><%= b.getBoardTitle() %></td>
								<td><%= b.getMemberName() %></td>
								<td><%= b.getBoardStatus()%></td>
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
	        let selectedBoards = [];
	        
	        $("#adminDeleteBoard").click(function () {
	 
	            selectedBoards = [];
	            $("input[type=checkbox]:checked").each(function(){
	       			selectedBoards.push($(this).val());
	        	})
	        	
	            if (selectedBoards.length === 0) {
	                alert("삭제할 게시글을 선택하세요.");
	                return;
	            }
	
	            if (confirm("정말 삭제하시겠습니까?")) {
	                $.ajax({
	                    type: "POST",
	                    url: "adminDeleteBoard.bo",
	                    data: { boards: selectedBoards.join(",") }, // 배열을 문자열로 변환
	                    success: function (response1) {
	                        if (response1.trim() === "success") {
	                            alert("게시글 삭제 완료!");
	                            location.reload();
	                        } else {
	                            alert("삭제 실패! 다시 시도하세요.");
								location.reload();
	                        }
	                    },
	                    error: function () {
	                        alert("서버 오류 발생!");
	                    }
	                });
	            }
	        });
	        
	        // ----------------------- 복구 기능 구현 1 -----------------------
	        $("#adminInsertBoard").click(function () {
	       	 
	        	selectedBoards = [];
	            $("input[type=checkbox]:checked").each(function(){
	            	selectedBoards.push($(this).val());
	        	})
	        	
	            if (selectedBoards.length === 0) {
	                alert("복구할 게시글을 선택하세요.");
	                return;
	            }
	
	            if (confirm("복구하시겠습니까?")) {
	                $.ajax({
	                    type: "post",
	                    url: "adminInsertBoard.bo",
	                    data: { boards: selectedBoards.join(",") }, // 배열을 문자열로 변환
	                    success: function (response2) {
	                        if (response2.trim() === "success") {
	                            alert("게시글 복구 완료!");
								location.reload();
	                        } else {
	                            alert("복구 실패! 다시 시도하세요.");
								location.reload();
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
	

    </div>
</body>
</html>