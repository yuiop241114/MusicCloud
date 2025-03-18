<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String search = (String)request.getAttribute("search");
	ArrayList<MusicFile> listAccuracy = (ArrayList<MusicFile>)request.getAttribute("listAccuracy");
	ArrayList<MusicFile> listPopular = (ArrayList<MusicFile>)request.getAttribute("listPopular");
	ArrayList<MusicFile> listPopularLocation = ((ArrayList<MusicFile>)request.getAttribute("listPopularLocation"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style>
    /* 기본 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* 전체 컨테이너 */
    .wrapper-searhList {
        width: 1550px;
        margin: auto;
    }

    .wrapper-searchList-standard { /* 전체 컨테이너 wrapper-searchList 가 menubar에 의해서 대신 밀리고 난후, 이게 안밀림*/
        margin-right: 20px;
    }

    .container-1, .container-2, .container-3 {
        width: 100%;
    }

    .search-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* 결과 영역 */
    .results-wrapper {
        position: relative; /* 화살표 버튼의 기준이 되는 컨테이너 */
        width: 1200px; /* .results와 동일한 너비 */
        margin: auto; /* 중앙 정렬 */
    }

    .results {
        display: block;
        width: 100%; /* 부모 컨테이너에 맞춤 */
        white-space: nowrap;
        overflow-x: auto;
        border: 2px solid #1587d0;
        border-radius: 10px;
        padding: 20px;
        scrollbar-width: thin; /* Firefox용 */
        scrollbar-color: #1587d0 #f0f0f0; /* Firefox용 (스크롤 색상, 트랙 색상) */
    }

    .results-container {
        display: inline-block;
    }

    /* 화살표 버튼 */
    .arrow-left, .arrow-right {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: #1587d0;
        color: white;
        border: none;
        padding: 10px;
        cursor: pointer;
        border-radius: 50%;
        font-size: 24px;
        z-index: 10;
        display: none; /* 기본적으로 숨김 */
        opacity: 80%;
    }

    .arrow-left {
        left: -50px; /* .results-wrapper 기준으로 왼쪽에 위치 */
    }

    .arrow-right {
        right: -50px; /* .results-wrapper 기준으로 오른쪽에 위치 */
    }

    .arrow-left:hover, .arrow-right:hover {
        background-color: #0f6da8;
    }

    /* 아이템 스타일 */
    .item {
        display: inline-block;
        width: 220px;
        text-align: center;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        background-color: #5caddf;
        margin-right: 20px;
        cursor : pointer;
    }

    .item img {
        width: 100%;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    .title-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .title {
        font-weight: bold;
        color: white;
    }

    .category {
        color: rgb(74, 0, 149);
        font-size: 14px;
    }

    .cart img {
        width: 40px;
        height: 40px;
        cursor: pointer;
    }

    /* 정렬 제목 */
    .sort-title-align {
        width: 1200px;
        margin: auto;
    }

    .sort-title-align>b{
        font-size: 30px;
        margin-bottom: 2rem;
    }

    .sort-title {
        display: block;
        text-align: left;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 10px;
        margin-left: 0;
    }

    .sort-title b {
        font-size: 30px;
    }
    
    
    
    
    /*여기부터 playBar css*/
    
    
        .button {
            height: 10%;
        }

        b {
            font-size: 20px;
        }

        .play-info {
            position: absolute;
        }

        #play-bar {
            height: 170px;
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
    
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    <br><br><br>

    <div class="wrapper-searhList">
        <div class="wrapper-searchList-standard">
            <!-- 첫 번째 컨테이너 -->
            <div class="container-1">
                <div class="sort-title-align">
                    <b><%=search %>검색결과</b>
                    <br><br>
                    <div class="sort-title"><b>정확순</b></div>
                </div>
                <div class="results-wrapper">
                    <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
                    <div class="results">
                        <div class="results-container">
                            <!-- 아이템들 -->
                            
                            
                            
                            <% for(MusicFile m : listAccuracy) {%>
                            <div class="item">
                                <img src="<%=contentPath%>/resources/image/열불이.png" alt="<%= m.getMusicImagePath() %>">
                                <div class="title-container">
                                    <div>
                                        <div class="title"><%= m.getMusicFileEditName() %></div>
                                        <div class="category"><%= m.getMusicFileOriginName() %></div>
                                    </div>
                                    <div class="cart">
                                        <img src="<%=contentPath %>/resources/image/cartlogo.jpg" alt="장바구니">
                                    </div>
                                </div>
                            </div>
                            <% } %>




                            <!-- 추가 아이템들 -->
                            <!-- ... (동일한 구조로 아이템 추가) ... -->
                        </div>
                    </div>
                    <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
                </div>
            </div>
        </div>

        <br><br>

        <!-- 두 번째 컨테이너 -->
        <div class="container-2">
            <div class="sort-title-align">
                <div class="sort-title"><b>인기순</b></div>
            </div>
            <div class="results-wrapper">
                <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
                <div class="results">
                    <div class="results-container">
                        <!-- 아이템들 -->





                        <% for(MusicFile m : listPopular) {%>
                            <div class="item">
                                <img src="<%=contentPath%>/resources/image/열불이.png" alt="<%= m.getMusicImagePath() %>">
                                <div class="title-container">
                                    <div>
                                        <div class="title"><%= m.getMusicFileEditName() %></div>
                                        <div class="category"><%= m.getMusicFileOriginName() %></div>
                                    </div>
                                    <div class="cart">
                                        <img src="<%=contentPath %>/resources/image/cartlogo.jpg" alt="장바구니">
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        

                  





                 







               


                    
                    </div>
                </div>
                <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
            </div>
        </div>

        <br><br>

        <!-- 세 번째 컨테이너 -->
        <div class="container-1">
            <div class="sort-title-align">
                <div class="sort-title"><b>지역별 인기순</b></div>
            </div>
            <div class="results-wrapper">
                <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
                <div class="results">
                    <div class="results-container">
                    
                    
                    
                        <!-- 아이템들 -->
                        
                        
                        <% for(MusicFile m : listPopularLocation) {%>
                            <div class="item">
                                <img src="<%=contentPath%>/resources/image/열불이.png" alt="<%= m.getMusicImagePath() %>">
                                <div class="title-container">
                                    <div>
                                        <div class="title"><%= m.getMusicFileEditName() %></div>
                                        <div class="category"><%= m.getMusicFileOriginName() %></div>
                                    </div>
                                    <div class="cart">
                                        <img src="<%=contentPath %>/resources/image/cartlogo.jpg" alt="장바구니">
                                    </div>
                                </div>
                            </div>
                            <% } %>




                   
                        
                    </div>
                </div>
                <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
            </div>
        </div>
    </div>

    <br><br><br>
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
            <img src="<%=contentPath%>/resources/image/전곡.png" alt="">
        </button>
        <button id="play-play">
            <img src="<%=contentPath%>/resources/image/재생이미지 검정.png" alt="">
        </button>
        <button id="play-next">
            <img src="<%=contentPath%>/resources/image/다음곡.png" alt="">
        </button>
        <button id="play-hidden">
            <img src="<%=contentPath%>/resources/image/화살표.png" alt="">
        </button>
    </div>
</div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const resultsContainers = document.querySelectorAll(".results");

            resultsContainers.forEach((results) => {
                const leftArrow = results.parentElement.querySelector(".arrow-left");
                const rightArrow = results.parentElement.querySelector(".arrow-right");

                // 한 번에 이동할 거리 (아이템 하나의 너비 + 마진)
                const scrollAmount = 240;

                // 스크롤 이벤트 처리 (버튼 숨김 여부)
                function updateArrowVisibility() {
                    leftArrow.style.display = results.scrollLeft > 0 ? "block" : "none";
                    rightArrow.style.display = (results.scrollLeft + results.clientWidth) < results.scrollWidth ? "block" : "none";
                }

                // 좌측 화살표 클릭 시 스크롤 이동
                leftArrow.addEventListener("click", function() {
                    results.scrollBy({ left: -scrollAmount, behavior: "smooth" });
                });
		
                // 우측 화살표 클릭 시 스크롤 이동
                rightArrow.addEventListener("click", function() {
                    results.scrollBy({ left: scrollAmount, behavior: "smooth" });
                });

                // 스크롤 이벤트 리스너 추가
                results.addEventListener("scroll", updateArrowVisibility);

                // 초기 상태 설정
                updateArrowVisibility();
            });
        });
        

        

        document.getElementById("play-hidden").addEventListener("click", function () {
            let playBar = document.getElementById("play-bar");

            if (playBar.style.bottom === "0px") {
                playBar.style.bottom = "-80px";
            } else {
                playBar.style.bottom = "0px";
            }
        });
						
										
        document.getElementById("seekBar").addEventListener("input", function () {
            let playBar = document.getElementById("play-bar");
            playBar.style.bottom = "0px";
        });

        document.querySelectorAll(".item").forEach(function(item) {
            item.addEventListener("click", function() {
                let playBar = document.getElementById("play-bar");
                
                if (playBar.style.display === "none" || playBar.style.display === "") {
                    playBar.style.display = "block";
                } else {
                    playBar.style.display = "none";
                }
            });
        });

    </script>
</body>
</html>