<!DOCTYPE html>
<html>
<head>
<title>음원 사이트 입력 폼</title>
<style>
  /* 파란 박스 스타일 변경 */
  .blue-box {
    width: 900px; /* 박스 크기 증가 */
    padding: 20px;
    background-color: #e5efff; /* 연한 파란색 */
    border-radius: 10px; /* 둥근 모서리 */
    margin: 20px auto;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
  }

  .title-container {
    background-color: #1e73be; /* 진한 파란색 */
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
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 15px;
  }

  .large-textarea {
    width: 100%;
    height: 200px; /* 높이 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
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

  /* 이미지 스타일 */
  .img-logo {
    width: 180px;
    height: 120px;
    margin: 5px;
    border-radius: 5px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
  }

  .section-title {
    text-align: center;
    background-color: #1e73be;
    color: white;
    padding: 8px;
    border-radius: 5px;
    font-weight: bold;
    margin-top: 20px;
  }
</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

<div class="blue-box">
  <div class="title-container">제목: 30자를 넘겨선 안됩니다. VARCHAR(90)</div>
  <input type="text" class="input-field" placeholder="제목을 입력하세요">
  
  <div class="title-container">작성일: SYSDATE 작성자: user_ID 들어가게끔</div>

  <div class="content-container">파일첨부 및 음원 이미지</div>
  <textarea class="large-textarea" placeholder="내용을 입력하세요. (Max 500자)"></textarea>

  <div class="button-container">
    <button>올리기</button>
    <button>지우기</button>
    <button>마케팅비 입력(가격제시)</button>
  </div>
</div>

<div class="section-title">음원 및 플레이 리스트 선택</div>

<div style="display: flex; justify-content: center; flex-wrap: wrap;">
  <img src="https://previews.123rf.com/images/alexandrus1/alexandrus11411/alexandrus1141100007/33319639-%EC%9D%8C%EC%95%85-%EC%95%A8%EB%B2%94.jpg" alt="이미지1" class="img-logo">
  <img src="https://img.freepik.com/free-vector/electro-music-album_53876-67221.jpg?t=st=1732308761~exp=1732312361~hmac=ec31e4e514c17b9a4d8bb3f12683727e945bf760f67a86c1f4a8c4fb48bfdcdb" alt="이미지2" class="img-logo">
  <img src="https://img.lovepik.com/free-template/20210818/bg/f13981902f3aff7619e67f6ff96d3caa_85585.png_detail.jpg!wh650" alt="이미지3" class="img-logo">
  <img src="https://cdn-icons-png.flaticon.com/512/26/26805.png" alt="이미지4" class="img-logo">
</div>

</body>
</html>
