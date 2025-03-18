<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* ... (기존 스타일 코드) ... */

    .container {
        width: 80%;
        margin: 20px auto;
        border: 1px solid #ddd;
        padding: 20px;
    }

    .header h1 {
        text-align: center;
        color:#1587d0;
    }

    .post-info {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
        color: #1587d0;
    }

    .content {
        border: 1px solid #eee;
        padding: 10px;
        margin-bottom: 10px;
        color:#1587d0;
    }

    .music-images {
        display: flex;
        justify-content: space-around;
        margin-bottom: 10px;
    }

    .music-images img {
        width: 150px;
        height: 150px;
    }

    .comments h2{
        color: #1587d0;
    }

    .comments .comment {
        display: flex; 
        align-items: flex-start;
        margin-bottom: 10px;
    }

    .comments .avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .comments textarea {
        flex-grow: 1;
        padding: 5px;
        border: 1px solid #1587d0;
        border-radius: 5px;
    }

    .comments button {
        background-color: #1587d0;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        margin-left: 5px;
    }

    .actions button {
        margin-right: 10px;
        border:1px solid #1587d0;
        color: #1587d0;
        background-color: white;
        border-radius: 5px;
        padding: 5px 10px;
    }

    /* 새로운 이미지 테마 적용 */
    .music-images {
        background-color: #f8f8f8; /* 배경색 변경 */
        padding: 10px; /* 패딩 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
    }

    .music-images img {
        border-radius: 5px; /* 이미지 테두리 둥글게 */
    }

    .comments {
        background-color: #f8f8f8; /* 배경색 변경 */
        padding: 10px; /* 패딩 추가 */
        border-radius: 5px; /* 테두리 둥글게 */
    }

    .comments .comment {
        border-bottom: 1px solid #ddd; /* 댓글 구분선 추가 */
        padding-bottom: 10px; /* 댓글 간 간격 추가 */
    }

    .actions {
        display: flex;
        justify-content: space-between; /* 버튼 양쪽 정렬 */
        align-items: center; /* 버튼 세로 정렬 */
        margin-top: 10px; /* 버튼 위 여백 추가 */
    }

    /* ... (나머지 스타일 코드) ... */
</style>

</head>

<body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="container">
        <div class="header">
        </div>
        <div class="post-info">
            <div class="title">
                제목: 30자를 넘겨선 안된다. VARCHAR(90)
            </div>
            <div class="date">
                작성날짜 작성자명
            </div>
        </div>
        <div class="content">
            내용들: Max 500자 이내 
        </div>
        <div class="music-images">
            <a href="#"><img src="image1.jpg" alt="음원 이미지 1"></a>
            <a href="#"><img src="image2.jpg" alt="음원 이미지 2"></a>
            <a href="#"><img src="image3.jpg" alt="음원 이미지 3"></a>
            <a href="#"><img src="image4.jpg" alt="음원 이미지 4"></a>
        </div>
        <div class="comments">
            <h2>댓글 20개</h2>
            <div class="comment">
                <img src="avatar.jpg" alt="프로필 사진" class="avatar">
                <textarea placeholder="댓글을 입력하세요..."></textarea>
                <button>등록</button>
            </div>
            <div class="comment-list">
            </div>
        </div>
        <div class="actions">
            <button> 18</button>
            <button></button>
            <button>공유</button>
        </div>
    </div>    

    <script>
        document.querySelector('.comments button').addEventListener('click', function() {
            const commentText = document.querySelector('.comments textarea').value;
            if (commentText) {
                const newComment = document.createElement('div');
                newComment.textContent = commentText;
                document.querySelector('.comment-list').appendChild(newComment);
                document.querySelector('.comments textarea').value = '';  초기화
            }
        });
    </script>

    <script>
        $(function() {
            $("#side-btn").click(function() {
                $("#side-btn-list").slideToggle();
            });
        });
    </script>
</body>
</html>