<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h1>게시판 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.boardNo}</td>
                    <td><a href="boardDetail?boardNo=${board.boardNo}">${board.title}</a></td>
                    <td>${board.writer}</td>
                    <td>${board.createDate}</td>
                    <td>${board.viewCount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="boardWriteForm.jsp">새 글 작성</a>
</body>
</html>