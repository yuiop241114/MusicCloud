<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String search = (String)request.getAttribute("search");
	/*
		listAccuracy
		musicNo : 음원번호
		musicFileStorePath : 음원경로
		musicImagePath : 음원이미지경로
		musicTitle : 제목
		musicSinger : 가수
	*/
	ArrayList<MusicFile> listAccuracy = (ArrayList<MusicFile>)session.getAttribute("listAccuracy");
	
	/*
		listPopular
		musicNo : 음원번호
		musicImagePath : 이미지 경로
		musicTitle : 음원명
		musicSinger : 가수명
	  musicCount : 인기 카운트
	*/
	ArrayList<MusicFile> listPopular = (ArrayList<MusicFile>)session.getAttribute("listPopular");
	
	/*
		listPopularLocation
		musicNo : 음원번호
		musicFileOriginName : 지역이름 
		musicImagePath : 이미지 경로
		musicTitle : 음원명
		musicSinger : 가수명
		musicCount : 인기 카운트
	*/
	ArrayList<MusicFile> listPopularLocation = ((ArrayList<MusicFile>)session.getAttribute("listPopularLocation"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=shopping_cart_checkout" />
<style>
    /*전체 Div*/
    #searchListDiv{
        width: 1500px;
        margin: auto;
        height: 1000px;
    }
    .resultDiv{
        width: 1300px;
    }

    /*검색 키워드*/
    #searchTitle{
        width: 1500px;
        margin: auto;
        margin-bottom: 20px;
        font-size: xx-large;
    }
    /*음원 저장 Div*/
    .searchContentDiv{
        width: 1300px;
        height: 280px;
        float: left;
        margin-bottom: 100px;
        border: 1px solid #1587d0;
        border-radius: 5px;

        /*가로 무한 스크롤*/
        display: flex;
        overflow-x: scroll;
        width: 100%;
        white-space: nowrap;
    }
    /*각 음원 div*/
    .musicAccuracyDiv *{
        box-sizing: border-box;
    }
    .musicAccuracyDiv:hover{
        cursor: pointer;
    }
    .musicAccuracyDiv{
        width: 230px;
        height: 90%;
        margin-top: 22px;

        /*가로 무한 스크롤*/
        flex: 0 0 auto;
        margin: 10px;
    }

    /*음원 이미지*/
    .musicImg{
        width: 100%;
        height: 75%;
    }
    .musicImg img{
        display: block;
        width: 90%;
        height: 90%;
        margin: auto;
        border-radius: 5px;
    }
    /*음원 정보*/
    .musicInfo{
        width: 100%;
        height: 25%;
        display: flex;
        background-color: #1587d0;
        border-radius: 5px;
    }
    .cartImg{
        width: 30%;
        height: 100%;
        color: white;
        text-align: center;
        padding: 8px;
    }
    .material-symbols-outlined{
        font-size: 40px;
    }
    .musicText{
        width: 70%;
        height: 100%;
        color: white;
        font-weight: bold;
        padding: 5px;
    }

    /*토스트바*/
    #snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 250px; /* Set a default minimum width */
    margin-left: -125px; /* Divide value of min-width by 2 */
    background-color: #1587d0; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 1; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 30px; /* 30px from the bottom */
    border-radius: 5px;
    }

    /* Show the snackbar when clicking on a button (class added with JavaScript) */
    #snackbar.show {
    visibility: visible; /* Show the snackbar */
    /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
    However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    /* Animations to fade the snackbar in and out */
    @-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
    }

    @-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
    }

    @keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>

    <div id="searchTitle"><span>'<%= search%>' 검색결과</span></div>

    <div id="searchListDiv">
        <div class="resultDiv">
            <div><h2>정확순</h2></div>
            <div class="searchContentDiv" id="listAccuracy">
		
                <% for(int i=0; i<listAccuracy.size(); i++) { %>
                    <div class="musicAccuracyDiv" id="accuracyDiv">
                        <input type="hidden" value="<%= listAccuracy.get(i).getMusicNo()%>">
                        <div class="musicImg"><img src="<%= contentPath + "/" + listAccuracy.get(i).getMusicImagePath()%>" alt=""></div>
                        <div class="musicInfo">
                            <div class="musicText">
                          	    <%= listAccuracy.get(i).getMusicTitle()%> <br>
                          	    <%= listAccuracy.get(i).getMusicSinger()%>
                            </div>
                            <div class="cartImg">
                                <span class="material-symbols-outlined">shopping_cart_checkout</span>
                            </div>
                        </div>
                    </div>
                <% } %>
                
            </div>

        </div>

        <div class="resultDiv">
            <div><h2>인기순</h2></div>
            <div class="searchContentDiv" id="listPopular">
            	<% for(int i=0; i<listPopular.size(); i++) { %>
                    <div class="musicAccuracyDiv" id="accuracyDiv">
                        <input type="hidden" value="<%= listPopular.get(i).getMusicNo()%>">
                        <div class="musicImg"><img src="<%= contentPath + "/" + listPopular.get(i).getMusicImagePath()%>" alt=""></div>
                        <div class="musicInfo">
                            <div class="musicText">
                          	    <%= listPopular.get(i).getMusicTitle()%> <br>
                          	    <%= listPopular.get(i).getMusicSinger()%>
                            </div>
                            <div class="cartImg">
                                <span class="material-symbols-outlined">shopping_cart_checkout</span>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

        <div class="resultDiv">
            <div><h2>지역별 순위</h2></div>
            <div class="searchContentDiv" id="listPopularLocation">
            	<% for(int i=0; i<listPopularLocation.size(); i++) { %>
                    <div class="musicAccuracyDiv" id="accuracyDiv">
                        <input type="hidden" value="<%= listPopularLocation.get(i).getMusicNo()%>">
                        <div class="musicImg"><img src="<%= contentPath + "/" + listPopularLocation.get(i).getMusicImagePath()%>" alt=""></div>
                        <div class="musicInfo">
                            <div class="musicText">
                          	    <%= listPopularLocation.get(i).getMusicTitle()%> <br>
                          	    <%= listPopularLocation.get(i).getMusicSinger()%>
                            </div>
                            <div class="cartImg">
                                <span class="material-symbols-outlined">shopping_cart_checkout</span>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>

    </div>

    <!-- <div id="snackbar"></div> -->
    
    <%@ include file="../play/playBar.jsp" %>

</body>
</html>