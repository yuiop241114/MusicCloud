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
  .container {
    width: 600px;
    margin: 20px auto;
    border: 1px solid #ccc;
    padding: 20px;
  }

  .form-group {
    margin-bottom: 10px;
  }

  .form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
  }

  .form-group input[type="text"],
  .form-group textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    box-sizing: border-box;
  }

  .music-list {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
  }

  .music-list img {
    width: 140px;
    height: 140px;
    object-fit: cover;
  }

  .form-buttons {
    margin-top: 20px;
    text-align: center;
  }

  .form-buttons button {
    padding: 8px 15px;
    margin: 0 5px;
  }

  .title-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  .title-row label {
    font-weight: bold;
  }

  .title-row input[type="text"] {
    width: 60%;
  }

  .title-row .date-author {
    display: flex;
  }

  .title-row .date-author input[type="text"] {
    width: 120px;
    margin-left: 5px; margin-left: 5px;
  }
</style>
</head>
<body>
    <div class="wrapper">
        <img src="c:\Users\user1\Pictures\Screenshots\화면 캡처 2025-03-11 094550.png" id="logo">
        <div id="login-box">
            <h1><button type="button" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
            <a href="">회원가입</a> | <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>
        </div>
        <form action="" class="search-bar">
            <input type="text" id="search-box">
            <button type="submit" id="search-btn">검색</button>
        </form>
    </div>

    <div class="navigator">
      <button type="button" id="side-btn" class="btn btn-primary btn-lg">퀵 메뉴</button>
      <table id="side-btn-list">
          <tr>
              <th width="30%"><img src="resources/image/cartlogo.jpg" alt=""></th>
              <th width="70%">전체음원목록</th>
          </tr>
          <tr>
              <th><img src="resources/image/cartlogo.jpg" alt=""></th>
              <th>마이페이지</th>
          </tr>
          <tr>
              <th><img src="resources/image/cartlogo.jpg" alt=""></th>
              <th>게시판</th>
          </tr>
          <tr>
              <th><img src="resources/image/cartlogo.jpg" alt=""></th>
              <th>장바구니</th>
          </tr>
          <tr>
              <th><img src="resources/image/cartlogo.jpg" alt=""></th>
              <th>플레이 리스트</th>
          </tr>
      </table>
  </div>

    <div class="container">
      <div class="search-bar">
        </div>
  
      <div class="post-form">
        <div class="form-group">
          <label for="title">제목: 30자를 넘겨선 안된다. VARCHAR(90)</label>
          <input type="text" id="title" name="title" maxlength="90">
        </div>
    
        <div class="form-group">
          <label for="content">내용들: Max 500자 이내</label>
          <textarea id="content" name="content" maxlength="500"></textarea>
        </div>
  
        <div class="form-group">
          <label for="music">음원 및 플레이 리스트 선택</label>
          <div class="music-list">
            <img src="음원1.jpg" alt="음원1">
            <img src="음원2.jpg" alt="음원2">
            <img src="음원3.jpg" alt="음원3">
            <img src="음원4.jpg" alt="음원4">
          </div>
        </div>
  
        <div class="form-buttons">
          <button type="submit">등록</button>
          <button type="reset">초기화</button>
          <button type="button">이전 페이지 (혹은 취소)</button>
        </div>
      </div>
    </div>

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
    
    <script>
        $(function() {
            $("#side-btn").click(function() {
                $("#side-btn-list").slideToggle();
            });
        });
    </script>
</body>
</html>
