<!DOCTYPE html>
<html>
<head>
<title>파란색 박스 예제</title>
<style>
  .blue-box {
    width: 500px; /* 박스 너비 조정 */
    padding: 20px;
    background-color: #1587d0; /* 연한 파란색 배경 */
    border-radius: 5px; /* 박스 모서리 둥글게 */
    margin: 20px auto; /* 가운데 정렬 및 여백 추가 */
  }

  .title-container {
    padding: 10px; /* 제목 영역 내부 여백 */
    margin-bottom: 10px; /* 제목 영역 아래 여백 */
    color: white; /* 제목 글씨 흰색 */
  }

  .content-container {
    padding: 10px; /* 내용 영역 내부 여백 */
    margin-bottom: 10px; /* 내용 영역 아래 여백 */
    color: white; /* 내용 글씨 흰색 */
  }

  .input-field {
    width: 100%;
    margin-bottom: 10px;
    border: 1px solid white; /* 입력칸 테두리 흰색 */
    padding: 8px; /* 입력칸 내부 여백 */
  }

  .button-container {
    text-align: center; /* 버튼 가운데 정렬 */
    margin-top: 20px; /* 버튼 위 여백 추가 */
  }

  .button-container button {
    padding: 10px 20px; /* 버튼 패딩 조정 */
    margin: 0 5px; /* 버튼 간 여백 조정 */
    color: #1587d0; /* 버튼 글씨 파란색 */
    background-color: white; /* 버튼 배경 흰색 */
    border: 1px solid #1587d0; /* 버튼 테두리 파란색 */
  }

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="blue-box">
  <div class="title-container">제목: 30자를 넘겨선 안된다. VARCHAR(90)</div>
  <input type="text" class="input-field">
  <div class="content-container">내용들: Max 500자 이내</div>
  <textarea class="input-field" style="height: 100px;"></textarea>

  <div class="button-container">
    <button>등록</button>
    <button>초기화</button>
    <button>이전 페이지 돌아가기(취소)</button>
  </div>
</div>

<div style="text-align: center; margin-top: 20px;">음원 및 플레이 리스트 선택</div>

<div style="display: flex; justify-content: center; margin-top: 20px;">
  <img src="음원1.jpg" alt="음원1" style="width: 100px; height: 100px; margin: 0 10px;">
  <img src="음원2.jpg" alt="음원2" style="width: 100px; height: 100px; margin: 0 10px;">
</div>
<div style="display: flex; justify-content: center; margin-top: 10px;">
  <img src="음원3.jpg" alt="음원3" style="width: 100px; height: 100px; margin: 0 10px;">
  <img src="음원4.jpg" alt="음원4" style="width: 100px; height: 100px; margin: 0 10px;">
</div>

</body>
</html>