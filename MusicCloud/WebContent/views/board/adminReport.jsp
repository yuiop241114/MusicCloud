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


    #deleteMember{
        background-color: red;
    }

    /* 관리자 페이지 테이블 속성 */
	table{
		border: 1px solid #000000;

	}

	/* 관리자 페이지 테이블 td 스타일 */
	table td{
        border: 1px solid #08edf5;
        background-color: #d2f7f8;
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
    <h2 align="center">관리자페이지-회원신고</h2>
    <br>

    <div class="wrapper">

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
                    <td>게시글선택</td>
                    <td width="70">글제목</td>
                    <td width="80">신고누적사유</td>
                    <td width="100">발생일시(신고카운트 10회 이상부터 알림)</td>
                    <td width="100">글 작성자</td>
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
                        <td><%= b.getBoardNo() %></td>
                        <td><%= b.getReportNo() %></td>
                        <td><%= b.getReportDate() %></td>
                        <td><%= b.getMemberName() %></td>
                        <!-- join 해서 Member/vo/Member에서 작성자 아이디, 닉네임 가져오기 -->
                        <th>
                            <button type="button" class="btn btn-danger" id="deleteMember">
                                <!-- 나중에 게시글삭제 테이블 만들 자리.  -->X
                            </button>
                        </th>
                    </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
	

    </div>
</body>
</html>