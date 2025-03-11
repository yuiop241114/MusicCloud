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
    <div class="wrapper">
        <img src="c:\Users\user1\Pictures\Screenshots\화면 캡처 2025-03-11 094550.png" id="logo">
        <div id="login-box">
            <h1><button type="button" onclick="location.href='<%= contentPath%>/loginForm'" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
            <a href="">회원가입</a> | <a href="">아이디 찾기</a> | <a href="">비밀번호 찾기</a>
            <div>
                <a href="<%= contentPath%>/logout" class="btn btn-sm btn-secondary">로그아웃</a>
            </div>
        </div>
        <form action="" class="search-bar">
            <input type="text" id="search-box">
            <button type="submit" id="search-btn">검색</button>
        </form>
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
