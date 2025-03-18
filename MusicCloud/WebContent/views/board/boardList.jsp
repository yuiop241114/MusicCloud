<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>

<style>

	.board-container {
        width: 50%;
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

    .board-container {
    width: 50%;
    margin: 20px auto 20px 25%; 
    text-align: center;
    }

    .board-container {
        width: 50%;
        margin: 20px auto 20px 25%;
        text-align: center;
        border-radius: 10px; 
        padding: 20px; 
    }

    .board-title {
        background-color: #1587d0;
        color: white;
        padding: 10px;
        border-radius: 10px 10px 0 0; 
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 0; 
    }

    .board-table {
        width: 100%;
        margin-top: 0; 
        border-collapse: collapse;
    }

    .board-table th, .board-table td {
        border: 1px solid #1587d0; 
        padding: 10px;
        text-align: center;
    }

    .board-table th {
        background-color: #f2f2f2;
    }

    .board-table td {
        background-color: white;
    }

    .board-container {
        width: 1200px;
        margin: 20px auto;
        text-align: center;
        border-radius: 10px;
        padding: 20px;
    }

    .board-title {
        background-color: #1587d0;
        color: white;
        padding: 10px;
        border-radius: 10px;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px; 
    }

    .board-table {
        width: 100%;
        border-collapse: collapse;
    }

    .board-table th, .board-table td {
        border: 1px solid #ddd;
        padding: 15px; 
        text-align: center;
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

    .board-table td a {
    color: #007bff; 
    text-decoration: none; 
}

    .board-table td a:hover {
        text-decoration: underline; 
    }
   	
	</style> 
<body>
    <%@ include file="../common/menubar.jsp" %>
	

	<div class="board-container">
      <h2 class="board-title">통합게시판</h2>
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
              <tr>
                  <td>7</td>
                  <td>곡이 재생이 안돼요.</td>
                  <td>4</td>
                  <td>25/03/27</td>
                  <td>user02</td>
              </tr>
              <tr>
                  <td>6</td>
                  <td>신곡 업데이트 공지</td>
                  <td>9</td>
                  <td>25/03/17</td>
                  <td>hidden</td>
              </tr>
              <tr>
                  <td>5</td>
                  <td>손희찬은 숙취가 괜찮은가?</td>
                  <td>0</td>
                  <td>25/03/11</td>
                  <td>heochan</td>
              </tr>
              <tr>
                  <td>4</td>
                  <td>사잔님 나 오스틴이에요 오스틴</td>
                  <td>115</td>
                  <td>25/03/05</td>
                  <td>ostin</td>
              </tr>
              <tr>
                  <td>3</td>
                  <td>세 번째 글</td>
                  <td>30</td>
                  <td>25/03/03</td>
                  <td>user99</td>
              </tr>
              <tr>
                  <td>2</td>
                  <td>두 번째 글</td>
                  <td>2</td>
                  <td>25/02/22</td>
                  <td>user01</td>
              </tr>
              <tr>
                  <td>1</td>
                  <td>첫 번째 글</td>
                  <td>11</td>
                  <td>25/01/01</td>
                  <td>관리자</td>
              </tr>
              <tr>
                <td>7</td>
                <td>우리조 망했나요</td>
                <td>4</td>
                <td>25/03/27</td>
                <td>user02</td>
            </tr>
            <tr>
                <td>6</td>
                <td>고생하는 준서 회원</td>
                <td>9</td>
                <td>25/03/17</td>
                <td>hidden</td>
            </tr>
            <tr>
                <td>5</td>
                <td>손희찬은 숙취가 괜찮은가?</td>
                <td>0</td>
                <td>25/03/11</td>
                <td>heochan</td>
            </tr>
            <tr>
                <td>4</td>
                <td>사잔님 나 오스틴이에요 오스틴</td>
                <td>115</td>
                <td>25/03/05</td>
                <td>ostin</td>
            </tr>
            <tr>
                <td>3</td>
                <td>세 번째 글</td>
                <td>30</td>
                <td>25/03/03</td>
                <td>user99</td>
            </tr>
            <tr>
                <td>2</td>
                <td>두 번째 글</td>
                <td>2</td>
                <td>25/02/22</td>
                <td>user01</td>
            </tr>
            <tr>
                <td>1</td>
                <td>첫 번째 글</td>
                <td>11</td>
                <td>25/01/01</td>
                <td>관리자</td>
            </tr>
          </tbody>
      </table>
    </div>
	
</body>
</html>