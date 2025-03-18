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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>

	/* 관리자 페이지  박스 크기 설정*/
	.wrapperAdmin *{
	    box-sizing: border-box;
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
	width: 1400px;
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
	
	
	<h2 align="center">관리자페이지-회원삭제</h2>
	<br>
	
	<div class="wrapperAdmin">
		
		<menu>
			<a href="" id="menutext">메인페이지</a>
					<a href="" id="menutext">음원관리</a>
					<a href="" id="menutext">회원관리</a>
					<a href="" id="menutext">게시글관리</a>
					<a href="" id="menutext">유료 컨텐츠 관리</a>
					
		</menu>
			
					
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
					<th>
						<button type="button" id="deleteMember">X</button>
					</th>
				</tr>
				<% } %>
			<% } %>
			
		</tbody>
	</table>
	
	
	
	<!-- <script>
	$(function(){
		$(".list-area>tbody>tr").click(function(){
			loaction.href = '<%= contentPath%>/detail.bo?bno=' + $(this).children().eq(0).text();
		})
	})
	</script> -->
	
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
	
	<script>
    $(document).ready(function () {
        let selectedMembers = [];
        
        
        
        
        $("#deleteMember").click(function () {
 
            // $("input[name='memberCheckbox']:checked").each(function () {
            //     selectedMembers.push($(this).val()); // 선택된 회원번호를 배열에 추가
            //     console.log(selectedMembers);
            // });
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
                    success: function (response) {
                        if (response.trim() === "success") {
                            alert("회원 삭제 완료!");
                            location.reload(); // 삭제 후 새로고침
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