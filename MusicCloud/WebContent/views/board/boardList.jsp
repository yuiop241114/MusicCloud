<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>
<style>
    .board-container {
        width: 1200px;
        margin: 20px auto 20px 25%; /* 기존보다 조금 더 오른쪽으로 이동 */
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
    .pagination {
        margin-top: 20px;
        text-align: center;
        margin-left: 40%; /* 페이지바를 오른쪽으로 이동 */
    }
    .pagination a {
        color: #1587d0;
        text-decoration: none;
        padding: 8px 16px;
        border: 1px solid #1587d0;
        margin: 0 5px;
        border-radius: 5px;
    }
    .pagination a.active {
        background-color: #1587d0;
        color: white;
    }
    .pagination a:hover {
        background-color: #e0e0e0;
    }
</style>
</head>
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
    <% for (int i = 10; i >= 1; i--) { %>
    <tr>
        <td><%= i %></td>
        <td>
            <a href="<%= contentPath %>/views/board/boardList2.jsp">Ã¬ÂÂÃ­ÂÂ ÃªÂ¸Â Ã¬ ÂÃ«ÂªÂ©</a>
        </td>
        <td><%= (int)(Math.random() * 100) %></td>
        <td>25/03/<%= 30 - i %></td>
        <td>user<%= i %></td>
    </tr>
    <% } %>
</tbody>
      </table>
      
      <div class="pagination">
          <a href="#" class="active">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">5</a>
      </div>
    </div>
</body>
</html>