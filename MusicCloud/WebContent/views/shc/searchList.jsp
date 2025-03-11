<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style>
   
   .wrapper-searchList{
    
   }
   .container-1 .container-2 .container-3 {
        width: 100%;
        margin-left: 0; /* 좌측 정렬 */
        margin-right: auto; /* 자동으로 우측 여백 */
        
    }
    .search-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        
    }
    .results {
        display: block;  /* flex 제거 */
        width: 1200px;
        white-space: nowrap;  /* 한 줄로 유지 */
        gap: 40px; /* 아이템 간격 */
        border: 2px solid #1587d0;
        margin: auto;
        border-radius: 10px;
        padding: 20px; /* 내부 여백 */
        justify-content: center; /* 중앙 정렬 */
        overflow-x: auto;
        scrollbar-width: thin; /* Firefox용 */
        scrollbar-color: #1587d0 #f0f0f0; /* Firefox용 (스크롤 색상, 트랙 색상) */
    }

.results-container {
        position: relative;
        transform: translateZ(0); /* 또는 will-change: transform; */   
    }

    .arrow-left, .arrow-right {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        
        background-color:#1587d0;
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
    left: 20px; /* 적절한 위치로 조정 */
    }

    .arrow-right {
    right: 20px;
    }
.arrow-left, .arrow-right {
    z-index: 100;
}

    .arrow-left:hover, .arrow-right:hover {
        background-color: #1587d0;
    }
    .item {
        display: inline-block;
        width: 220px;
        text-align: center;
        padding: 15px; /* 내부 여백 */
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        background-color:#5caddf;
        margin-right: 20px; /* 아이템 간격 */
    }
    .item img {
        width: 100%;
        border-radius: 10px;
        margin-bottom: 10px; /* 이미지와 텍스트 사이 간격 */
       
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
        color: gray;
        font-size: 14px;
    }
    .cart img {
        width: 40px;
        height: 40px;
        cursor: pointer;
    }
    .sort-title-align{
        width: 1200px;
        margin: auto;

    }
    .sort-title {
    display: block;
    text-align: left; /* 왼쪽 정렬 */
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    margin-left: 0; /* 왼쪽 여백 제거 */
  
}
    .sort-title b{
        font-size: 30px;
    }
  
</style>

</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    <br><br><br>
<div class="wrapper-searhList">
    <div class="container-1">
        <div class="sort-title-align">
        <div class="sort-title"><b>인기순</b></div>
        <div class="results">
            <div class="results-container">
                <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
            
            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>
                <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
        </div>
        </div>
    </div>
    </div>
    

    <br><br>





    

    <br><br>


    <div class="container-2">
        <div class="sort-title-align">
        <div class="sort-title"><b>인기순</b></div>
        <div class="results">
            <div class="results-container">
                <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
            
            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>
                <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
        </div>
        </div>
    </div>
    </div>
    <br><br>























    <div class="container-1">
        <div class="sort-title-align">
        <div class="sort-title"><b>인기순</b></div>
        <div class="results">
            <div class="results-container">
                <button class="arrow-left">&#9664;</button> <!-- 좌측 화살표 -->
            
            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>
                <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <div class="item">
                <img src="../../resources/image/열불이.png" alt="고영훈 이미지">
                <div class="title-container">
                    <div>
                        <div class="title">고영훈</div>
                        <div class="category">술주정</div>
                    </div>
                    <div class="cart">
                        <img src="../../resources/image/cartlogo.jpg" alt="장바구니">
                    </div>
                </div>
            </div>

            <button class="arrow-right">&#9654;</button> <!-- 우측 화살표 -->
        </div>
        </div>
    </div>
    </div>



    
        </div>
    </div>
</div>

    <br><br><br>
</body>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const resultsContainers = document.querySelectorAll(".results");

        resultsContainers.forEach((results) => {
            const leftArrow = results.querySelector(".arrow-left");
            const rightArrow = results.querySelector(".arrow-right");

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
</script>
</html>
