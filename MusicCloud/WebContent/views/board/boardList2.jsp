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

  {
  background-color: #f0f8ff; /* 연한 하늘색 배경 */
}

/* 검색창 스타일 */
.search-container {
  display: flex;
  align-items: center;
  border-radius: 20px; /* 둥근 모서리 */
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
  overflow: hidden; /* 둥근 모서리 적용을 위한 overflow 설정 */
}

.search-input {
  flex-grow: 1;
  padding: 10px 15px;
  border: none;
  font-size: 16px;
  background-color: #e6f7ff; /* 연한 파란색 배경 */
}

.search-button {
  background: linear-gradient(to right, #87ceeb, #1e90ff); /* 구름 로고 그라데이션 색상 적용 */
  color: white;
  padding: 10px 20px;
  border: none;
  font-size: 16px;
  border-radius: 0 20px 20px 0; /* 오른쪽 모서리만 둥글게 */
  cursor: pointer;
}

/* 구름 로고 스타일 */
.cloud-logo {
  width: 80px; /* 로고 크기 조절 */
  height: 80px;
  margin-right: 10px;
}

.music-selection {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.music-images {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  margin-left: 20px; /* 추가: 왼쪽 여백 추가 */
}

.image-row {
  display: flex;
  justify-content: center;
  margin-bottom: 10px;
  width: 100%;
}

.image-row img {
  width: 150px;
  height: 150px;
  margin: 0 10px;
}
</style>
</head>
<body>
  <%@ include file="../common/menubar.jsp" %>
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

        <div class="form-buttons">
          <button type="submit">등록</button>
          <button type="reset">초기화</button>
          <button type="button">이전 페이지 돌아가기(취소)</button>
        </div>
      </div>
    </div>
  
    <div class="music-selection">
      <span>음원 및 플레이 리스트 선택</span>
    </div>
    
    <div class="music-images">
      <div class="image-row">
        <img src="음원1.jpg" alt="음원1">
        <img src="음원2.jpg" alt="음원2">
      </div>
      <div class="image-row">
        <img src="음원3.jpg" alt="음원3">
        <img src="음원4.jpg" alt="음원4">
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
