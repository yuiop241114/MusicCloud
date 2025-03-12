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
    .wrapper {
        box-sizing: border-box;
        height: 170px;
    }
    .wrapper * {
        box-sizing: border-box;
    }
    .wrapper #logo {
        width: 15%;
        height: 100%;
    }
    .wrapper #login-box {
        width: 25%;
        height: 100%;
        float: right;
        text-align: center;
        border: 1px solid #1587d0;
        border-radius: 30px;
    }
    #login-btn {
        background-color: #1587d0;
        width: 80%;
        line-height: 40px;
        margin-top: 40px;
    }
    #login-box a {
        color: black;
    }
    .wrapper .search-bar {
        width: 55%;
        float: right;
        line-height: 50px;
        margin-top: 50px;
        margin-right: 30px;
    }
    .search-bar * {
        height: 50px;
    }
    .search-bar #search-box {
        width: 80%;
        border: 1px solid #1587d0;
        border-top-left-radius: 30px;
        border-bottom-left-radius: 30px;
    }
    .search-bar #search-btn {
        float: right;
        width: 20%;
        background-color: #1587d0;
        color: white;
        font-weight: bolder;
        font-size: larger;
        border-top-right-radius: 30px;
        border-bottom-right-radius: 30px;
        border: 1px solid #1587d0;
    }
    .navigator {
        width: 150px;
        float: right;
        text-align: center;
        margin-right: 30px;
        margin-top: 20px;
        position: sticky;
        top: 20px;
    }
    #side-btn {
        height: 40px;
        background-color: #1587d0;
    }
    #side-btn-list {
        display: none;
        font-size: small;
        border-radius: 10px;
        background-color: #1587d0;
        margin-top: 5px;
        color: white;
    }
    #board-section {
        width: 80%;
        margin: auto;
        margin-top: 20px;
        padding: 20px;
        border: 1px solid #1587d0;
        border-radius: 10px;
        background-color: #f8f9fa;
    }
    #board-title {
        font-size: 20px;
        font-weight: bold;
        color: #1587d0;
        margin-bottom: 10px;
    }
    .board-list {
        width: 100%;
        border-collapse: collapse;
    }
    .board-list th, .board-list td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    .board-list th {
        background-color: #1587d0;
        color: white;
    }

</style>

</head>

<body>
 <%@ include file="../common/menubar.jsp" %>

 <div class="container">
    <div class="header">
        <h1>게시글 View 부분</h1>
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
<script src="script.js"></script>

<style>
.container {
    width: 80%;
    margin: 20px auto;
    border: 1px solid #ddd;
    padding: 20px;
}

.header h1 {
    text-align: center;
}

.post-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.content {
    border: 1px solid #eee;
    padding: 10px;
    margin-bottom: 10px;
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
}

.actions button {
    margin-right: 10px;
}
</style>

    <style>
      .board-container {
          width: 80%;
          margin: 20px auto;
          text-align: center;
      }
      .board-title {
          background-color: #1587d0;
          color: white;
          padding: 10px;
          border-radius: 10px;
          font-size: 24px;
          font-weight: bold;
      }
      .board-table {
          width: 100%;
          margin-top: 10px;
          border-collapse: collapse;
      }
      .board-table th, .board-table td {
          border: 1px solid #ccc;
          padding: 10px;
          text-align: center;
      }
      .board-table th {
          background-color: #f2f2f2;
      }
      .board-table td {
          background-color: white;
      }
  </style>

    <style>
    document.querySelector('.comments button').addEventListener('click', function() {
        const commentText = document.querySelector('.comments textarea').value;
        if  (commentText) {
            const newComment = document.createElement('div');
            newComment.textContent = commentText;
            document.querySelector('.comment-list').appendChild(newComment);
            document.querySelector('.comments textarea').value = ''; // 입력창 초기화
        }
    });

    </style>


    <script>
        $(function() {
            $("#side-btn").click(function() {
                $("#side-btn-list").slideToggle();
            });
        });
    </script>
</body>
</html>
