<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        .container {
            width: 60%;
            margin: 0 auto;
        }
        .field {
            margin-top: 10px;
        }
        .label {
            font-weight: bold;
        }
        .content {
            margin-top: 5px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }
        .actions {
            margin-top: 20px;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
            padding: 8px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .actions a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시글 상세보기</h1>
        <div class="field">
            <span class="label">제목:</span>
            <span class="content">${board.title}</span>
        </div>
        <div class="field">
            <span class="label">작성자:</span>
            <span class="content">${board.writer}</span>
        </div>
        <div class="field">
            <span class="label">작성일:</span>
            <span class="content">${board.createDate}</span>
        </div>
        <div class="field">
            <span class="label">내용:</span>
            <div class="content">${board.content}</div>
        </div>
        <div class="actions">
            <a href="boardList">목록으로</a>
            <a href="boardUpdateForm?boardNo=${board.boardNo}">수정</a>
            <a href="boardDelete?boardNo=${board.boardNo}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
        </div>
    </div>
</body>
</html>