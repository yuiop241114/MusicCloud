<%@page import="com.musicCloud.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    List<Board> list = (List<Board>)request.getAttribute("boardList");
%>
<meta charset="UTF-8">
<title>음원 사이트 입력 폼</title>
<style>
  .blue-box {
    width: 900px;
    padding: 20px;
    background-color: #e5efff;
    border-radius: 10px;
    margin: 0px auto;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
  }

  .title-container {
    background-color: #1e73be;
    padding: 10px;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    text-align: center;
    margin-bottom: 15px;
  }

  .content-container {
    margin-bottom: 10px;
    font-size: 14px;
    font-weight: bold;
  }

  .input-field {
    width: 100%;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
    font-size: 16px;
    margin-left: -2px;
  }

  .large-textarea {
    width: 100%;
    height: 350px;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    margin-left: -2px;
  }
  
  .button-container {
    text-align: center;
    margin-top: 20px;
  }

  .button-container button {
    padding: 10px 15px;
    margin: 0 5px;
    color: white;
    background-color: #1e73be;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .button-container button:hover {
    background-color: #135a96;
  }

  /* 이미지 스타일 및 정렬 */
  .image-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    justify-content: center;
    max-width: 400px;
    margin: 15px auto;
  }

  .img-logo {
    width: 180px;
    height: 120px;
    border-radius: 5px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    cursor: pointer;
    transition: transform 0.2s ease-in-out;
  }

  .img-logo:hover {
    transform: scale(1.1);
  }

  .section-title {
    text-align: center;
    background-color: #1e73be;
    color: white;
    padding: 8px;
    border-radius: 5px;
    font-weight: bold;
    margin-top: 5px;
  }
</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

<div class="blue-box">
  <div class="title-container">제목: 30자를 넘겨선 안됩니다.</div>
  <input type="text" id="title" class="input-field" placeholder="제목을 입력하세요">
  
  <div class="title-container">작성일:</div>

  <div class="content-container">파일첨부 및 음원 이미지</div>
  <textarea id="content" class="large-textarea" placeholder="내용을 입력하세요. (Max 500자)"></textarea>

  <div class="button-container">
    <button>글작성</button>
    <button onclick="resetFields()">초기화하기</button>
    <button onclick="goBack()">이전 페이지 돌아가기(취소)</button>
  </div>
</div>

<div class="section-title">음원 및 플레이 리스트 선택</div>

<div class="image-container">
  <img src="https://previews.123rf.com/images/alexandrus1/alexandrus11411/alexandrus1141100007/33319639-%EC%9D%8C%EC%95%85-%EC%95%A8%EB%B2%94.jpg" alt="이미지1" class="img-logo" onclick="imageClick(this)">
  <img src="https://img.freepik.com/free-vector/electro-music-album_53876-67221.jpg?t=st=1732308761~exp=1732312361~hmac=ec31e4e514c17b9a4d8bb3f12683727e945bf760f67a86c1f4a8c4fb48bfdcdb" alt="이미지2" class="img-logo" onclick="imageClick(this)">
  <img src="https://img.lovepik.com/free-template/20210818/bg/f13981902f3aff7619e67f6ff96d3caa_85585.png_detail.jpg!wh650" alt="이미지3" class="img-logo" onclick="imageClick(this)">
  <img src="https://cdn-icons-png.flaticon.com/512/26/26805.png" alt="이미지4" class="img-logo" onclick="imageClick(this)">
</div>

<script>
  // 뒤로가기 함수
  function goBack() {
    history.back();
  }

  // 이미지 클릭 시 알림 함수
  function imageClick(img) {
    alert("선택한 이미지: " + img.alt);
  }

  // 제목과 내용 필드 초기화 함수
  function resetFields() {
    document.getElementById('title').value = ''; // 제목 필드 초기화
    document.getElementById('content').value = ''; // 내용 필드 초기화
  }
</script>

</body>
</html>
