<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .mainList {
        border: 1px solid #1587d0;
        width: 1220px;
        height: 300px;
        margin-left: 60px;
        margin-top: 30px;
        margin-bottom: 30px;
        border-radius: 10px;
    }		

    /*음원 목록*/
    /*음원 목록 선택 글자자*/
    #musicList_select{
        margin: 10px;
    }
    #musicList_select a{
        text-decoration: none;
        color: black;
    }
    /*음원 div*/
    #music_detail{
        border: 1px solid black;
        width: 200px;
        height: 250px;
    }
    #music_detail img{
        width: 100%;
        height: 200px;
    }
    #music_img{
        border: 1px solid #1587d0;
        border-radius: 10px;
    }
</style>
</head>
<body>
    <%@ include file="menubar.jsp" %>
    <div class="mainPage">

        <div class="mainList" id="music_list">
            <div id="musicList_select"> 
                <a href="">인기순</a> / 
                <a href="">지역별</a>
            </div>

            <div id="music_detail">
                <div id="music_img"><img src="resources/image/mainlogo.png" alt=""></div>
                
            </div>
        </div>
    
        <div class="mainList" id="music_payment"></div>
    
        <div class="mainList" id="board"></div>
    
        <div class="mainList" id="playList"></div>

    </div>
</body>
</html>