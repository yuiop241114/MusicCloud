<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    .wrapper {
 
    }

.playlist {
    width: 100%;
    height: 700px;
    width: 1300px;
    margin: auto;
    }

    .image-container {
    float: left;
    width: 55%;
    height: 90%;
    
    }
    .image-container-foot {
    position: relative; 
    height: 10%;
}

    .lyrics-comment {
    width: 35%;
    float: left;
    margin-left: 10px; 
    border: 3px solid rgba(26, 83, 255, 0.784); 
    border-radius: 10px;
    padding: 10px; 
    height: 100%;
    }
    
    .button{
        height: 10%;
    }
    .content{
        height: 90%;
        border: 3px solid rgba(26, 83, 255, 0.784);
        border-radius: 30px;
        overflow: auto; /* 넘치는 부분을 스크롤 가능하게한다 */
    }
    


    .image-container img {
    width:100%;
    height:100%;
    border-radius: 30px;
    border-width: 2px;
    border: 3px solid rgba(26, 83, 255, 0.784);

    }


    .button button {
    background-color: #4daaf5; 
    color: white;
    border: none; 
    border-radius: 20px; 
    padding: 10px 20px; 
    font-size: 16px; 
    font-weight: bold; 
    cursor: pointer; 
    transition: background-color 0.3s ease; 
    }

    .button button:hover {
    background-color: #3399dd; 
    }

    .image-info {
    position: absolute;
    left: 0; 
    top: 50%;
    transform: translateY(-50%); 
}

.function {
    position: absolute;
    right: 0; 
    top: 50%;
    transform: translateY(-50%);
}


b{
    font-size: 20px;
}

.function img{
    height: 30px;
    width: 30px;
}
.comment-wrapper{
    height: 400px;
    width: 400px;
    display: none;
}
.comment-list-photo{
    width: 10%;
    float: left;
    margin: auto;
}

.comment-list-detail{
    padding-left: 2rem;
    width: 90%;
    float: left;
}
#comment-btn-report {
    display: none;
    position: relative; /* 부모 요소 흐름을 따르도록 설정하는것 꼭 공부하기  */
    margin-top: 5px; /* 버튼 바로 아래로 배치하는 CSS 공부필수 */
 
    padding: 5px;
    border-radius: 5px;
    float: right;
   
}  



    </style>
</head>

<body>


    <%@ include file="../common/menubar.jsp" %>
    <br><br><br>

    <div class="wrapper-1">
        <div class="playlist">
            <div class="image-container">
             <div class="image">
                <img src="../../resources/image/열불이.png" alt="">
             </div>
             <br>
             <div class="image-container-foot">
                 <div class="image-info">
                 <b>가수가 올부분</b>
                 노래제목이 올부분
              </div>
                 <div class="function">
                    <img src="../../resources/image/좋아요.webp" alt="">좋아요개수
                    <img src="../../resources/image/싫어요.png" alt="">싫어요개수
                    <img src="../../resources/image/공유.png" alt="">공유
                    <img src="../../resources/image/다운로드.png" alt="">다운로드
                </div>

            </div>
            </div>
          
            <div class="lyrics-comment">

                <div class="button">
                    <button id="lyrics-view">가사</button> <button id="comment-view">댓글</button>
                </div>

                <div class="content">

                </div>
            </div>

        </div>     
    </div>

    
    <div class="comment-wrapper">
        <div class="comment-header">
            <b>댓글 20개</b>
        </div> 

        <div class="comment-input">
            <img src="../../resources/image/열불이.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            &nbsp;
            <input type="text" placeholder="댓글달기..." style="border-radius: 5px; border-color: gray;" required>
        </div>

        <div class="comment-list">
            <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
                
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>
        
        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="borderg none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>

        <div class="comment">
            <div class="comment-list-photo">
            <img src="../../resources/image/주몽1.png" style="border-radius: 5px; height: 55px; width: 55px;" alt="">
            </div>
            
            <div class="comment-list-detail">
                <span style="font-size: 13px;">kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
            <hr style="margin: 0">
             
             <p style="font-size: 12px; margin: 0;">좋아요</p>
             
             <img src="../../resources/image/좋아요.webp" style="height: 12px; width: 12px;" alt="">
             좋아요 개수
             <img src="../../resources/image/싫어요.png" style="height: 12px; width: 12px;" alt="">
             싫어요 개수

             <button name="comment-btn" id="" style="float: right; background: none; border: none;">   <!--float 란 부모 컨테이너에서 오른쪽 왼쪽 배치하기 여기선 오른쪾-->
                 <img src="../../resources/image/list.png" style="height: 20px; widows: 20px;" alt="">
             </button>
             <table id="comment-btn-report" style="line-height: 20px;">
                <th>
                    <button id="report" style="border: none; background: none; color: gray;">신고</button>
                </th>
             </table>
            </div>
        </div>
        </div>
        
    </div>


        
  <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>신고 사유를 선택해주세요.</p>
        <div id="report-explain" style="background-color: rgb(225, 225, 225); border-radius: 5px; font-weight: lighter; padding: 10px;">
          신고 접수 시 신고자의 정보(휴대전화번호, 이메일)는 신고이력 관리, 부정이용 탐지 목적으로 이용되며, 신고 시점으로부터 1년간 보관 후 파기합니다.
        </div>
        <br>
        <button class="btn btn-light btn-block">스팸 · 유사투자자문 등</button>
        <button class="btn btn-light btn-block">음란 · 성적행위 등</button>
        <button class="btn btn-light btn-block">아동 · 청소년 대상 성범죄 등</button>
        <button class="btn btn-light btn-block">욕설 · 폭력 · 혐오</button>
        <button class="btn btn-light btn-block">불법 상품 · 서비스</button>
        <button class="btn btn-light btn-block">개인정보 무단 수집 · 유포</button>
        <button class="btn btn-light btn-block">비정상적인 서비스 이용</button>
        <button class="btn btn-light btn-block">자살 · 자해</button>
        <button class="btn btn-light btn-block">사기 · 사칭</button>
        <button class="btn btn-light btn-block">명예훼손 · 저작권 등 권리 침해</button>
        <button class="btn btn-light btn-block">불법촬영물등 유통</button>
      </div>
    </div>
  </div>
</div>

<br>
<br><br>
<br><br>
<br>

<div id="play-bar" style="height: 200px; width: 100%; position: relative; text-align: center; position: fixed; bottom: 0px;">
    
    
    <audio id="audio" src="audio.mp3"></audio>
    <br><br><br><br>
    <span style="float: left; padding: 1rem;">00:00</span>
    <span style="float: left; padding: 1rem;">/</span>
    <span style="float: left; padding: 1rem;">03:40</span>
    <input id="seekBar" type="range" min="0" max="100" value="0" style="width: 100%; position: absolute; left: 0; right: 0; color: black;">
    <br>

    <button id="play-previous" style="background: none; border: none; height: 80px; width: 80px;">
        <img src="../../resources/image/전곡.png" style="height: 40px; width: 40px;" alt="">
    </button>

    <button id="play-pause" style="background: none; border: none; height: 80px; width: 80px;">
        <img src="../../resources/image/재생이미지 검정.png" style="height: 40px; width: 40px;" alt="">
    </button>

    <button id="play-next" style="background: none; border: none; height: 80px; width: 80px;">
        <img src="../../resources/image/다음곡.png" style="height: 40px; width: 40px;" alt="">
    </button>


    <button id="play-hidden" style="background: none; border: none; height: 80px; width: 80px; position: absolute; right: 0;">
        <img src="../../resources/image/화살표.png" style="height: 40px; width: 40px;" alt="">
    </button>

    
</div>



    


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 버튼 요소 찾기
            const commentBtn = document.querySelector('button[name="comment-btn"]');
            const reportTable = document.getElementById("comment-btn-report");
    
            // 버튼 클릭 이벤트 추가
            commentBtn.addEventListener("click", function (event) {
                // 현재 display 상태 확인 후 토글임
                if (reportTable.style.display === "none" || reportTable.style.display === "") {
                    reportTable.style.display = "block";
                } else {
                    reportTable.style.display = "none";
                }
    
                // 이벤트 전파 방지 (버튼 클릭 시 다른 이벤트 영향을 막음)
                event.stopPropagation();
            });
    
            // 문서 전체 클릭 시 테이블 숨기기
            document.addEventListener("click", function (event) {
                if (!commentBtn.contains(event.target) && !reportTable.contains(event.target)) {
                    reportTable.style.display = "none";
                }
            });
        });

        $(document).ready(function () {
    $("#report").click(function () {
      $("#reportModal").modal("show"); // 모달 열기
    });
  });

  /*    
  document.addEventListener("DOMContentLoaded", function () {
    // 신고 버튼 요소 가져오기
    const reportButton = document.getElementById("report");

    // Bootstrap 모달 객체 생성
    const reportModal = new bootstrap.Modal(document.getElementById("reportModal"));

    // 버튼 클릭 시 모달 표시
    reportButton.addEventListener("click", function () {
        reportModal.show();
    });
});



  */


  document.addEventListener("DOMContentLoaded", function () {
    const commentButton = document.getElementById("comment-view");
    const contentDiv = document.querySelector(".content");
    let commentWrapper = document.querySelector(".comment-wrapper");

    commentButton.addEventListener("click", function () {
        // comment-wrapper가 .content 안에 없으면 추가
        if (!contentDiv.contains(commentWrapper)) {
            contentDiv.appendChild(commentWrapper);
        }

        // 현재 display 상태 확인 후 토글
        if (commentWrapper.style.display === "none" || commentWrapper.style.display === "") {
            commentWrapper.style.display = "block"; // 보이게 하기
        } else {
            commentWrapper.style.display = "none"; // 숨기기
        }
    });
});





    </script>
</body>
</html>