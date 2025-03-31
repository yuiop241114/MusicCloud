<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>음원 사이트 입력 폼</title>
<style>
  .blue-box {
    width: 900px;
    padding: 20px;
    background-color: #e5efff;
    border-radius: 10px;
    margin: 20px auto;
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
    margin-left: -30px;
  }

  .input-field {
    width: 100%;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
    font-size: 16px;
    margin-left: -30px;
  }

  .large-textarea {
    width: 100%;
    height: 300px;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
  }

  .comment-section {
    margin-top: 20px;
    text-align: center; /* 가운데 정렬을 위한 설정 */
  }

  .comment-box {
    width: 80%; /* 기존 100%에서 줄임 */
    height: 120px;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
  }

  .button-container {
    text-align: center;
    margin-top: 20px;
  }

  .button-container button {
    padding: 12px 18px;
    margin: 0 5px;
    color: white;
    background-color: #1e73be;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
  }

  .button-container button:hover {
    background-color: #135a96;
  }

  /* 이미지 스타일 */
  .img-logo {
    width: 200px;
    height: 150px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
  }

  /* 음원 및 플레이리스트 제목 중앙 정렬 */
  .section-title {
    text-align: center;
    background-color: #1e73be;
    color: white;
    padding: 12px;
    border-radius: 5px;
    font-weight: bold;
    margin: 30px auto;
    width: fit-content;
  }

  /* 이미지 컨테이너 중앙 정렬 */
  .image-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
  }

</style>

<script>
  function showCommentAlert() {
      alert("댓글이 등록되었습니다!");
  }
</script>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>

<div class="blue-box">
  <div class="title-container">제목: 30자를 넘겨선 안됩니다. VARCHAR(90)</div>
  <input type="text" class="input-field" placeholder="제목을 입력하세요">

  <div class="title-container">작성일: SYSDATE 작성자: user_ID 들어가게끔</div>

  <div class="content-container">파일첨부 및 음원 이미지</div>
  <textarea class="large-textarea" placeholder="내용을 입력하세요. (Max 500자)"></textarea>
</div>

<!-- 수정된 중앙 정렬 제목 -->
<div class="section-title">음원 및 플레이 리스트 선택</div>

<!-- 이미지 컨테이너 -->
<div class="image-container">
  <img src="https://previews.123rf.com/images/alexandrus1/alexandrus11411/alexandrus1141100007/33319639-%EC%9D%8C%EC%95%85-%EC%95%A8%EB%B2%94.jpg" alt="음원 이미지 1" class="img-logo">
  <img src="https://img.freepik.com/free-vector/electro-music-album_53876-67221.jpg?t=st=1732308761~exp=1732312361~hmac=ec31e4e514c17b9a4d8bb3f12683727e945bf760f67a86c1f4a8c4fb48bfdcdb" alt="음원 이미지 2" class="img-logo">
  <img src="https://img.lovepik.com/free-template/20210818/bg/f13981902f3aff7619e67f6ff96d3caa_85585.png_detail.jpg!wh650" alt="음원 이미지 3" class="img-logo">
  <img src="https://cdn-icons-png.flaticon.com/512/26/26805.png" alt="음원 이미지 4" class="img-logo">
</div>

<!-- 댓글 입력 부분 -->
<div class="comment-section">
  <h2>댓글 20개</h2>
  <textarea class="comment-box" placeholder="댓글을 입력하세요..."></textarea>
  <div class="button-container">
    <button onclick="showCommentAlert()">등록</button>
  </div>
</div>

</body>
</html>
