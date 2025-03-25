<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
    <title>게시글 보기</title>
</head>
<body>
    <h1>${board.title}</h1>
    <p>${board.content}</p>
    <img src="${board.imageUrl}" alt="음원 이미지">

    <h2>댓글</h2>
    <c:forEach var="comment" items="${comments}">
        <div>
            <p>${comment.userId}: ${comment.content}</p>
        </div>
    </c:forEach>

    <form action="/comment/add" method="post">
        <input type="hidden" name="boardId" value="${board.id}">
        <input type="text" name="userId" placeholder="사용자 ID">
        <textarea name="content" placeholder="댓글 내용"></textarea>
        <button type="submit">댓글 작성</button>
    </form>
</body>
</html>
