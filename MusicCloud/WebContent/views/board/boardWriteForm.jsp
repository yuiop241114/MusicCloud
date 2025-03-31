<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <style>
        form {
            width: 50%;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>새 게시글 작성</h1>
    <form action="boardInsert" method="post">
        <label for="title">제목</label>
        <input type="text" id="title" name="title" required>
        
        <label for="writer">작성자</label>
        <input type="text" id="writer" name="writer" required>
        
        <label for="content">내용</label>
        <textarea id="content" name="content" rows="10" required></textarea>
        
        <input type="submit" value="등록">
    </form>
</body>
</html>