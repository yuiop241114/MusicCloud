<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.musicCloud.cart.model.vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cart c = (Cart)session.getAttribute("cart");
	/*
		fileList
		musicNo : 음원명
		musicImagePath : 이미지경로
		musicCategoryNo : 음원 장르
		musicTitle : 음원명
		musicSinge : 가수명
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    /*전체 div*/
    .cart-wrapper{
        width: 1500px;
        height: 1000px;
        margin: auto;
    }
    /*장바구니 제목*/
    .cart-title{
        width: 1180px;
		height: 100px;
		border-radius: 5px;
		margin-left: 30px;
		margin-bottom: 10px;
		background-color: rgb(233, 233, 233);
    }
    .cart-title h4{
        font-weight: bold;
		line-height: 100px;
		margin-left: 20px;
		color: #1587d0;
		margin-top: 5px;
    }

    /*장바구니 출력 div*/
    .cart-content{
        width: 1200px;
        float: left;
        margin-left: 30px;
        margin-top: 10px;
    }
    .cart-content-div{
        width: 98.5%;
    }  

    /*음원 정보 테이블*/
    .content-table{
        width: 100%;
        border-left: none;
        border-right: none;
    } 
    .content-table th, .content-table td{
        border-left: none;
        border-right: none;
        border-radius: 5px;
        padding: 5px;
    }
    .content-table>thead{
        background-color: rgb(233, 233, 233);
        text-align: center;
    }
    .content-table>tbody>tr{
        border: 1px solid #1587d0;
        border-top: none;
        border-left: none;
        border-right: none;
    }
    .content-table>tbody>tr>td{ width: 90%;}

    /*음원 정보 div*/
    .musicAccuracyDiv{
        height: 200px;
    }
    .content-table button{
        width: 80%;
        height: 50px;
        border: none;
        border-radius: 5px;
        display: block;
        margin: auto;
        background-color: #1587d0;
        color: white;   
    }
    /*음원 이미지*/
    .musicAccuracyDiv{
        width: 100%;
        display: flex;
    }
    .musicAccuracyDiv #music-img{
        width: 25%;
        text-align: center;
    }
    #music-img img{
        height: 100%;
        padding: 10px;
    }
    .musicAccuracyDiv #music-text{
        width: 50%;
        padding-top: 50px;
    }
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="cart-wrapper">
        <div class="cart-title">
            <h4>장바구니</h4>
        </div>

        <div class="cart-content">
            <div class="cart-content-div">
                <table class="content-table">
                    <thead>
                        <tr>
                            <th colspan="2">음원</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if(c != null){
                                String[] mList = c.getMusicNoTotal().split(",");
                                for(int i=0; i<mList.length; i++){
                                
                                    for(MusicFile mf : fileList){
                                        if(mf.getMusicNo() == Integer.parseInt(mList[i])){
                        %>
                                    <tr>
                                        <td>
                                            <div class="musicAccuracyDiv">
                                                <div id="music-img">
                                                    <img src="<%= mf.getMusicImagePath()%>">
                                                </div>
                                                <div id="music-text">
                                                    <b><%=  mf.getMusicTitle()%></b> 
                                                    <br> 
                                                    <b><%= mf.getMusicSinger() %></b>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button">삭제</button>
                                        </td>
                                    </tr>
                        <%			  			 }
                                    }
                                    
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
   
</body>
</html>