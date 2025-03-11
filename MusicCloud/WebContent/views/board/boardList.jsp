<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicCloud</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.wrapper{
	    box-sizing: border-box;
	    height: 170px;
	}
	.wrapper *{
	    box-sizing: border-box;
	}
	
	.wrapper #logo{
	    width: 15%;
	    height: 100%;
	}
	
	.wrapper #login-box{
	    width: 25%;
	    height: 100%;
	    float: right;
			text-align: center;
			border: 1px solid #1587d0;
			border-radius: 30px;
	}
	#login-btn{
		background-color: #1587d0;
		width: 80%;
		line-height: 40px;
		margin-top: 40px
	}

	#login-box a{
		color: black;
	}
	
	.wrapper .search-bar{ 
	    width: 55%; 
	    float: right;
	    line-height: 50px;
	    margin-top: 50px;
	    margin-right: 30px;
	}
	.search-bar *{
	    height: 50px;
	}
	.search-bar #search-box{
	    width: 80%;
	    border: none;
	    border: 1px solid #1587d0;
	    border-top-left-radius: 30px;
	    border-bottom-left-radius: 30px;
	}
	.search-bar #search-btn{
	    float: right;
	    width: 20%;
	    background-color: #1587d0;
	    color: white;
			font-weight: bolder;
			font-size: larger;
			line-height: 10px;
	
	    border-top-right-radius: 30px;
	    border-bottom-right-radius: 30px;
	    border: 1px solid #1587d0;
	}
	#search-btn:hover{
	    cursor: pointer;
	}
	
	.navigator{
	    width: 150px;
	    float: right;
	    border: 1px solid;
	    text-align: center;
	    margin-right: 30px;
	    box-sizing: border-box;
			margin-top: 20px;
			border: none;
	    position: sticky;
	    top: 20px;
	}
	.navigator #side-btn, .navigator #side-btn-list{
	  	width: 100%;
			line-height: 20px;
	}
	#side-btn{
	    height: 40px;
			background-color: #1587d0;
	}
	#side-btn-list{
	    display: none;
	    width: 100%;
	    font-size: small;
			border-radius: 10px;
			background-color: #1587d0;
			margin-top: 5px;
			color: white;
	}
	#side-btn-list th{
	    height: 50px;
	}
	#side-btn-list img{
	    width: 80%;
	}

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
	
	</style> 
    <body>
	<div class="wrapper">
       <img src="c:\Users\user1\Pictures\Screenshots\화면 캡처 2025-03-11 094550.png" id="logo">
       <div id="login-box">   
					<h1><button type="button" onclick="location.href='<%= contentPath%>/loginForm'" class="btn btn-primary btn-lg" id="login-btn">뮤직 클라우드 로그인</button></h1>
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

    <div >
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
</div>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<script>

	    $(function(){
	        $("#side-btn").click(function(){
	            if($("#side-btn-list").css('display') == 'none'){
	                $("#side-btn-list").slideDown();
	            }else{
	                $("#side-btn-list").slideUp();
	            }
	        });
	    });
	</script>
	
</body>
</html>