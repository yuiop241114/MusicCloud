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
	ArrayList<MusicFile> listPopular = (ArrayList<MusicFile>)session.getAttribute("listPopular");
	ArrayList<MusicFile> listPopularLocation = ((ArrayList<MusicFile>)session.getAttribute("listPopularLocation"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

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
    }
    .musicText{
        width: 70%;
        height: 100%;
        color: white;
        font-weight: bold;
        padding: 5px;
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
                            <div class="cartImg"></div>
                        </div>
                    </div>
                <% } %>
                
            </div>

        </div>

        <div class="resultDiv">
            <div><h2>인기순</h2></div>
            <div class="searchContentDiv" id="listPopular"></div>
        </div>

        <div class="resultDiv">
            <div><h2>지역별 순위</h2></div>
            <div class="searchContentDiv" id="listPopularLocation"></div>
        </div>

    </div>
    
    <%@ include file="../play/playBar.jsp" %>

    <script>
        $(document).on("click", "#accuracyDiv", function(){
            $.ajax({
                url: "musicSelect",
                data: {
                    musicNo: $(this).find("input[type='hidden']").val(),
                },
                success: function(mf) {
                    const audio = document.getElementById('music_source');
                    const playBarWrapper = document.querySelector('.playBarWrapper');
                    const playButton = document.querySelector('.playBtn');
                    const pauseButton = document.querySelector('.pauseBtn');
                    
                    audio.src = mf.musicFileStorePath;
                    $(".music_title").html(mf.musicTitle + "<br>" + mf.musicSinger);
                    playBarWrapper.style.display = 'block';
                    audio.play();
                    playButton.style.display = 'none';
                    pauseButton.style.display = 'block';
                },
                error: function() {
                    console.log("선택음원 ajax 실패");
                }
            });

        } )


    </script>
</body>
</html>