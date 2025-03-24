<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* 플레이리스트 컨테이너 */
        .wrapper-musicPlay {
            margin: auto;
        }

        .playlist {
            width: 1300px;
            height: 700px;
            margin: auto;
        }

        .image-container {
            float: left;
            width: 55%;
            height: 90%;
        }

        .image-container img{
            cursor: pointer;
        }

        .image-container-foot {
            position: relative;
            height: 10%;
        }
        

        .lyrics-comment {
            width: 35%;
            float: left;
            margin-left: 10px;
            border: 3px solid #1587d0;
            border-radius: 10px;
            padding: 10px;
            height: 100%;
        }

        .button {
            height: 10%;
        }

        .content {
            height: 90%;
            border: 3px solid #1587d0;
            border-radius: 30px;
            overflow: auto;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            border-radius: 30px;
            border: 3px solid #1587d0;
        }

        .button button {
            background-color: #1587d0;
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
            background-color: #1587d0;
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

        b {
            font-size: 20px;
        }

        .function img {
            height: 30px;
            width: 30px;
        }

        .comment-wrapper {
            height: 400px;
            width: 400px;
            display: none;
            margin: 20px;
        }

        .comment-list-photo {
            width: 10%;
            float: left;
            margin: auto;
        }

        .comment-list-detail {
            padding-left: 2rem;
            width: 90%;
            float: left;
        }

        #comment-btn-report {
            display: none;
            position: relative;
            margin-top: 5px;
            padding: 5px;
            border-radius: 5px;
            float: right;
        }

        .play-info {
            position: absolute;
        }

        #play-bar {
            height: 130px;
            width: 100%;
            position: fixed;
            bottom: 0;
            background-color: #d6efff;
            opacity: 80%;
            text-align: center;
            transition: bottom 0.3s ease-in-out;
            display: none;
        }

        #play-bar.show {
         height: 117px; /* 원하는 높이 설정 (playBar의 실제 높이에 맞게 설정) */
         opacity: 1;
        }

        #seekBar {
            width: 100%;
            position: absolute;
            left: 0;
            right: 0;
            color: black;
        }

        .play-info span {
            float: left;
            padding: 1rem;
            font-size: 20px;
        }

        #play-previous,
        #play-pause,
        #play-next,
        #play-hidden {
            background: none;
            border: none;
            height: 80px;
            width: 80px;
        }

        #play-hidden {
            position: absolute;
            right: 0;
        }

        #play-previous img,
        #play-pause img,
        #play-next img,
        #play-hidden img {
            height: 40px;
            width: 40px;
        }

        .comment-input input {
            border-radius: 5px;
            border-color: gray;
        }

        .comment-list img {
            border-radius: 5px;
            height: 55px;
            width: 55px;
        }

        .comment-list-detail span {
            font-size: 13px;
        }

        .comment-list-detail p {
            font-size: 12px;
            margin: 0;
        }

        .comment-list-detail img {
            height: 12px;
            width: 12px;
        }

        .comment-list-detail button {
            float: right;
            background: none;
            border: none;
        }

        .comment-list-detail button img {
            height: 20px;
            width: 20px;
        }

        #reportModal .modal-body button {
            width: 100%;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <br><br><br>
    <div class="wrapper-musicPlay">
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
                        <button id="lyrics-view">가사</button>
                        <button id="comment-view">댓글</button>
                    </div>
                    <div class="content"></div>
                </div>
            </div>
        </div>

        <div class="comment-wrapper">
            <div class="comment-header">
                <b style="font-size: 18px;">댓글 20개</b>
            </div>
            <div class="comment-input">
                <img src="../../resources/image/열불이.png" alt="">
                &nbsp;
                <input type="text" placeholder="댓글달기..." required>
            </div>
            <hr>
            <div class="comment-list">
                <div class="comment">
                    <div class="comment-list-photo">
                        <img src="../../resources/image/주몽1.png" alt="">
                    </div>
                    <div class="comment-list-detail">
                        <span>kh 1조 마지막 수정된 날짜 : 2025년 02월 21일</span>
                        <hr style="margin: 0">
                        <p>좋아요</p>
                        <img src="../../resources/image/좋아요.webp" alt="">좋아요 개수
                        <img src="../../resources/image/싫어요.png" alt="">싫어요 개수
                        <button name="comment-btn">
                            <img src="../../resources/image/list.png" alt="">
                        </button>
                        <table id="comment-btn-report">
                            <th>
                                <button id="report">신고</button>
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
                        <div id="report-explain">
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
        <br><br><br><br><br><br><br><br>

        <div id="play-bar">
            <audio id="audio" src="audio.mp3"></audio>
            <div class="play-info">
                <span>00:00</span>
                <span>/</span>
                <span>03:40</span>
            </div>
            <input id="seekBar" type="range" min="0" max="100" value="0">
            <br>
            <b>가수</b>
            <b style="font-size: 18px; color: gray;">노래제목</b>
            <button style="float: right;"></button>
            <br>
            <button id="play-previous">
                <img src="../../resources/image/전곡.png" alt="">
            </button>
            <button id="play-pause">
                <img src="../../resources/image/재생이미지 검정.png" alt="">
            </button>
            <button id="play-next">
                <img src="../../resources/image/다음곡.png" alt="">
            </button>
            <button id="play-hidden">
                <img src="../../resources/image/화살표.png" alt="">
            </button>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const commentBtn = document.querySelector('button[name="comment-btn"]');
            const reportTable = document.getElementById("comment-btn-report");

            commentBtn.addEventListener("click", function (event) {
                if (reportTable.style.display === "none" || reportTable.style.display === "") {
                    reportTable.style.display = "block";
                } else {
                    reportTable.style.display = "none";
                }
                event.stopPropagation();
            });

            document.addEventListener("click", function (event) {
                if (!commentBtn.contains(event.target) && !reportTable.contains(event.target)) {
                    reportTable.style.display = "none";
                }
            });
        });

        $(document).ready(function () {
            $("#report").click(function () {
                $("#reportModal").modal("show");
            });
        });

        document.addEventListener("DOMContentLoaded", function () {
            const commentButton = document.getElementById("comment-view");
            const contentDiv = document.querySelector(".content");
            const lyricsButton = document.getElementById("lyrics-view"); 
            let commentWrapper = document.querySelector(".comment-wrapper");

            commentButton.addEventListener("click", function () {
                if (!contentDiv.contains(commentWrapper)) {
                    contentDiv.appendChild(commentWrapper); // 특정 부모 노드의 자식 노드 목록의 맨 마지막에 새로운 노드를 추가하는 메서드
                }

                if (commentWrapper.style.display === "none" || commentWrapper.style.display === "" ) {
                    commentWrapper.style.display = "block";
                } else {
                    commentWrapper.style.display = "none";
                }
            });
        });

        document.getElementById("play-hidden").addEventListener("click", function () {
            let playBar = document.getElementById("play-bar");

            if (playBar.style.bottom === "0px") {
                playBar.style.bottom = "-108px";
            } else {
                playBar.style.bottom = "0px";
            }
        });


        document.getElementById("seekBar").addEventListener("input", function () {
            let playBar = document.getElementById("play-bar");
            playBar.style.bottom = "0px";
        });

        document.querySelector(".image-container").addEventListener("click", function(){
            
            let playBar = document.getElementById("play-bar");
            
            if (playBar.style.display === "none" || playBar.style.display === ""){

                playBar.style.display = "block";
            }else{
                playBar.style.display = "none";
            }
        });


        
    </script>
</body>
</html>