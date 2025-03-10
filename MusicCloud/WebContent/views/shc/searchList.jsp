<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style>
   
    .container {
        width: 80%;
        margin-left: 0; /* 좌측 정렬 */
        margin-right: auto; /* 자동으로 우측 여백 */
    }
    .search-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .results {
        display: flex;
        flex-wrap: wrap;
        gap: 40px; /* 아이템 간격 */
        border: 2px solid #169df1;
        border-radius: 10px;
        padding: 20px; /* 내부 여백 */
        justify-content: center; /* 중앙 정렬 */
    }
    .item {
        width: 220px;
        text-align: center;
        padding: 15px; /* 내부 여백 */
        border-radius: 10px;
        box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        background-color: #c0eafb;
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
    .sort-title {
    width: 100%;
    text-align: left;
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
    }
</style>

</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    <br><br><br>

    <div class="container">
        <div class="search-title">'고영훈' 검색 결과</div>
        <div class="sort-title"><b>정확순</b></div>
        <div class="results">
            
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


        </div>
    </div>

    <br><br>

    <div class="container">
    
        <div class="sort-title"><b>인기순</b></div>
        <div class="results">
            
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


        </div>
    </div>

    <br><br>

    <div class="container">
        
        <div class="sort-title"><b>지역별 인기순</b></div>
        <div class="results">
            
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


        </div>
    </div>


    <br><br><br>
</body>
</html>
