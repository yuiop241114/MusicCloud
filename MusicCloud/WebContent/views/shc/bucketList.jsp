<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .wrapper{
        border: none;
    }
.main{
    width: 1200px;
    
    
    }
.bucketList-header-1{
    padding: 10px 0;
    float: left;
}

.bucketList-header-2{
    float: right;
}

button#product {
    border-radius: 10px; 
    background: transparent; 
    border: 2px solid #8a2be2;
    color: #8a2be2; 
    padding: 8px 12px;
    cursor: pointer;
    transition: all 0.3s ease;
}

button#product:hover {
    background: #8a2be220; 
}

select {
    color: #8a2be2; 
    background: #d8bfd880; 
    border: 1px solid #8a2be2;
    padding: 5px;
    border-radius: 5px; 
    cursor: pointer;
    
}
.bucketList-footer{
    height: 100px;
}

.bucketList-footer-1{
    float: left;
    width: 50%;
}
.bucketList-footer-2{
    float: left;
    width: 50%;
    padding: 2rem;
    text-align: right;
}
.bucketList-title {
    width: 100%;
    overflow: hidden; 
    border-bottom: 2px solid #8a2be2; 
    font-weight: bold;
    padding: 10px 0;
    margin-top: 30px;
}

.bucketList-product-name,
.bucketList-price,
.bucketList-quantity,
.bucketList-addRemove {
    float: left; 
    text-align: center; 
    
}
.bucketList-product-name { width: 40%; } 
.bucketList-price { width: 20%; }
.bucketList-quantity { width: 20%; }
.bucketList-addRemove { width: 20%; }


</style>
</head>
<body>
 <%@ include file="../common/menubar.jsp" %>
    <br><br><br>
    
    <div class="wrapper">
        <div class="main">
        <div class="bucketList-header">

            
            <div class="bucketList-header-1">
                <span style="font-size: 20px; font-weight:  bold;">뮤직클라우드 장바구니</span>
            </div>

            <div class="bucketList-header-2">

                <button id="product">선택상품보관</button>
                <button id="product">선택상품삭제</button>
                <select name="" id="select">
                    <option value="">최근담은순</option>
                    <option value="">최근담은순</option>
                    <option value="">최근담은순</option>
                </select>
            </div>

        </div>

        <div class="bucketList" style="background-color:  #c5ddff;;">
            <div class="bucketList-title">

               <div class="bucketList-product-name">
                상품명
               </div>

               <div class="bucketList-price">

                가격
               </div>

               <div class="bucketList-quantity">

                수량
               </div>

               <div class="bucketList-addRemove">
               보관/삭제
               
               <input type="checkbox" id="selectAll" style="width: 20px; height: 20px;" onclick="toggleCheckboxes(this)">
            </div>
                </div>
                
            <div class="bucketList-content">

            </div>
        </div>
<!-- html jsp for문으로 -->
        <div class="bucketList">
            <div class="bucketList-title">

                <div class="bucketList-product-name">
                    <img src="../../resources/image/열불이.png" style="padding: 2rem; height: 200px; width: 200px; float: left;">
                    <span style="color: rgb(92, 92, 248); display: inline-block; vertical-align: left ;">[차은우의 플레이리스트]</span>
                    <b style="display: block;">즉시 이용 가능</b>
                </div>
                

               <div class="bucketList-product-name">

              </div>

               <div class="bucketList-price">

                <b>정가 : 1,000원</b>
                <br>
                <b style="color: crimson;">판매가 : 1,000원원</b>
               </div>

               <div class="bucketList-quantity">
                    <button onclick="decrease()" style="border:none; background: rgb(191, 191, 255); cursor: pointer; border-radius: 8px;">-</button>    
                    <span id="count">1</span>
                    <button onclick="increase()" style="border:none; background: rgb(191, 191, 255); cursor: pointer;  border-radius: 8px;">+</button>
                </div>
            
                
                <div class="bucketList-addRemove">
                    
                    <input type="checkbox" class="productCheckbox" style="width: 20px; height: 20px;">
                </div>
                
                <div class="bucketList-content">
                    
                </div>
            </div>
            </div>
            <!-- html jsp for문으로 -->

            


            <!-- html jsp for문으로 -->
        <div class="bucketList">
            <div class="bucketList-title">

                <div class="bucketList-product-name">
                    <img src="../../resources/image/열불이.png" style="padding: 2rem; height: 200px; width: 200px; float: left;">
                    <span style="color: rgb(92, 92, 248); display: inline-block; vertical-align: left ;">[차은우의 플레이리스트]</span>
                    <b style="display: block;">즉시 이용 가능</b>
                </div>
                

               <div class="bucketList-product-name">

              </div>

               <div class="bucketList-price">

                <b>정가 : 1,000원</b>
                <br>
                <b style="color: crimson;">판매가 : 1,000원원</b>
               </div>

               <div class="bucketList-quantity">
                    <button onclick="decrease()" style="border:none; background: rgb(191, 191, 255); cursor: pointer; border-radius: 8px;">-</button>    
                    <span id="count">1</span>
                    <button onclick="increase()" style="border:none; background: rgb(191, 191, 255); cursor: pointer;  border-radius: 8px;">+</button>
                </div>
            
                
                <div class="bucketList-addRemove">
                    
                    <input type="checkbox" class="productCheckbox" style="width: 20px; height: 20px;">
                </div>
                
                <div class="bucketList-content">
                    
                </div>
            </div>
            </div>
            <!-- html jsp for문으로 -->

            <!-- html jsp for문으로 -->
        <div class="bucketList">
            <div class="bucketList-title">

                <div class="bucketList-product-name">
                    <img src="../../resources/image/열불이.png" style="padding: 2rem; height: 200px; width: 200px; float: left;">
                    <span style="color: rgb(92, 92, 248); display: inline-block; vertical-align: left ;">[차은우의 플레이리스트]</span>
                    <b style="display: block;">즉시 이용 가능</b>
                </div>
                

               <div class="bucketList-product-name">

              </div>

               <div class="bucketList-price">

                <b>정가 : 1,000원</b>
                <br>
                <b style="color: crimson;">판매가 : 1,000원원</b>
               </div>

               <div class="bucketList-quantity">
                    <button onclick="decrease()" style="border:none; background: rgb(191, 191, 255); cursor: pointer; border-radius: 8px;">-</button>    
                    <span id="count">1</span>
                    <button onclick="increase()" style="border:none; background: rgb(191, 191, 255); cursor: pointer;  border-radius: 8px;">+</button>
                </div>
            
                
                <div class="bucketList-addRemove">
                    
                    <input type="checkbox" class="productCheckbox" style="width: 20px; height: 20px;">
                </div>
                
                <div class="bucketList-content">
                    
                </div>
            </div>
            </div>
            <!-- html jsp for문으로 -->

            <!-- html jsp for문으로 -->
        <div class="bucketList">
            <div class="bucketList-title">

                <div class="bucketList-product-name">
                    <img src="../../resources/image/열불이.png" style="padding: 2rem; height: 200px; width: 200px; float: left;">
                    <span style="color: rgb(92, 92, 248); display: inline-block; vertical-align: left ;">[차은우의 플레이리스트]</span>
                    <b style="display: block;">즉시 이용 가능</b>
                </div>
                

               <div class="bucketList-product-name">

              </div>

               <div class="bucketList-price">

                <b>정가 : 1,000원</b>
                <br>
                <b style="color: crimson;">판매가 : 1,000원원</b>
               </div>

               <div class="bucketList-quantity">
                    <button onclick="decrease()" style="border:none; background: rgb(191, 191, 255); cursor: pointer; border-radius: 8px;">-</button>    
                    <span id="count">1</span>
                    <button onclick="increase()" style="border:none; background: rgb(191, 191, 255); cursor: pointer;  border-radius: 8px;">+</button>
                </div>
            
                
                <div class="bucketList-addRemove">
                    
                    <input type="checkbox" class="productCheckbox" style="width: 20px; height: 20px;">
                </div>
                
                <div class="bucketList-content">
                    
                </div>
            </div>
            </div>
            <!-- html jsp for문으로 -->










        <div class="bucketList-footer" style="background-color: #c5ddff;">
            <div class="bucketList-footer-1">
                <br>
            
                <b style="font-size: 20px; padding: 2rem;">총 상품가격: 5000원 (총 7개중 5개)</b>

                <br>

                <b style="font-size: 12px; color: brown; padding: 2rem;">즉시 사용 가능</b>

            </div>
            <div class="bucketList-footer-2">


                <button style="color: white; background-color: rgb(255, 0, 140); border-radius: 10px; padding: 10px 20px; border: none; font-size: 16px; cursor: pointer;">
                    이 장바구니의 선택상품 주문
                  </button>
            </div>

        </div>

    </div>





    </div>

    <script>

        let count = 1;

        function increase(){

            count++;
            document.getElementById('count').innerText = count;
        }
        function decrease(){    
            if(count > 1){
            count--;
            document.getElementById('count').innerText = count;
            }
        }

        function toggleCheckboxes(source) {
        let checkboxes = document.querySelectorAll('.productCheckbox'); 
        checkboxes.forEach(checkbox => {
            checkbox.checked = source.checked;
        });
    }

    </script>
</body>
</html>