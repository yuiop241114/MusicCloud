<%@page import="com.musicCloud.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	List<Board> list = (List<Board>)request.getAttribute("boardList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>
<style>
    /* 전체 컨테이너 스타일 */
    .board-container {
        max-width: 1200px;
        width: 90%;
        margin: 20px auto;
        text-align: center;
        border-radius: 10px;
        padding: 20px;
        position: relative;
    }

    /* 게시판 제목 */
    .board-title {
        background-color: #1587d0;	
        color: white;
        padding: 10px;
        border-radius: 10px;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
    }

    /* 등록 버튼 스타일 */
    .register-btn {
        position: absolute;
        top: -50px;
        right: 30px;
        background-color: #1587d0;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }
    .register-btn:hover {
        background-color: #1066a0;
    }

    /* 게시판 테이블 */
    .board-table {
        width: 100%;
        border-collapse: collapse;
    }

    .board-table th, .board-table td {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
        white-space: nowrap;
    }

    .board-table th {
        background-color: #f8f8f8;
        font-weight: bold;
    }

    .board-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .board-table tr:hover {
        background-color: #e0e0e0;
    }

    /* 페이지네이션 */
    .pagination {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .pagination a {
        color: #1587d0;
        text-decoration: none;
        padding: 8px 16px;
        border: 1px solid #1587d0;
        margin: 0 5px;
        border-radius: 5px;
    }

    .pagination a.active {
        background-color: #1587d0;
        color: white;
    }

    .pagination a:hover {
        background-color: #e0e0e0;
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <div class="board-container">
        <!-- 등록 버튼 클릭 시 글 작성 페이지로 이동 -->
        <button class="register-btn" onclick="location.href='<%= contentPath %>/boardEnroll'">등록</button>

        <div class="board-title">
            <span>통합게시판</span>
        </div>
      
        <table class="board-table">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>글 제목</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i<list.size(); i++) { %>
                <tr>
                    <td><%= list.get(i).getBoardNo() %></td>
                    <td>
                        <a href="<%= contentPath %>/boardDetail"><%= list.get(i).getBoardTitle() %></a>
                    </td>
                    <td><%= list.get(i).getBoardCount()%></td>
                    <td><%= list.get(i).getBoardEnrollDate() %></td>
                    <td><%= list.get(i).getMemberAlias() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
        </div>
        
    </div>
</body>
</html>