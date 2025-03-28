<%@page import="com.musicCloud.common.vo.MusicFile"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메테리얼 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
    .playBarWrapper{
        margin: auto;
        width: 100%;
        height: 100px;
        background-color: #1587d0;
        z-index: 999;
        position: sticky;
        bottom: 0;
        float: inline-end;
        /*초기에는 안보이는 상태*/
        display: none;
    }   
    /*아이콘 디자인*/
    .material-icons{
        font-size: 60px;
        background-color: #1587d0;
        border: none;
        color: white;
        height: 100%;
        width: 13%;
    }
    .material-icons:hover{
        cursor: pointer;
    }

    /*컨트롤러*/
    .controller{
        position: absolute;
        bottom: 0;
        height: 60%;
        width: 100%;
        display: flex;
        
    }

    /*음원 정보*/
    .music_title{
        width: 30%;
        padding-left: 10px;
        padding-top: 5px;
        color: white;
    }

    /*플레이바 아이콘*/
    .music_controller{
        width: 40%;
        display: flex;
        justify-content: center;
    }
    .playBtn{
        display: none;
    }
    .pauseBtn{

    }

    /*추가 창 띄우는 아이콘*/
    .music_detail_btn{
        width: 30%;
    }
    .detailBtn{
        float: right;
        padding-right: 10px;
    }
</style>
</head>
<body>
    <!-- musicAccuracyDiv : 음원 전체 div 클래스명 -->
    <div class="playBarWrapper">

        <audio preload controls id="music_source" src="" type="audio/mp3"></audio>
        <div class="progress-bar">
            <div class="progress"></div>
        </div>
        
        <div class="controller">

            <div class="music_title">
               
            </div>

            <div class="music_controller">
                <div class="material-icons previousBtn">skip_previous</div>
                <div class="material-icons playBtn">play_arrow</div>
                <div class="material-icons pauseBtn">pause</div>
                <div class="material-icons nextBtn">skip_next</div>    
            </div>

            <div class="music_detail_btn">
                <div class="material-icons detailBtn">view_headline</div>
            </div>
        </div>

    </div>

    <script>
    //음원 정보 가져오는 ajax
        // $(function(){
        //     //음원 클릭시 음원 정보를 비동기로 가져오고 플레이바 활성화
        //     /*
        //         musicNo : 음원번호
        //         musicFileStorePath : 음원 경로
        //         musicImagePath : 이미지 경로
        //         musicTitle : 음원명
        //         musicSinger : 가수명
        //         musicCount : 조회수
        //         like : 좋아요
        //         dislike : 싫어요
        //         lyrics : 가사
        //     */
        //     $("#accuracyDiv").click(function() {
        //         //해당 음원이 들어가 있는 인덱스
        //         $.ajax({
        //             url: "musicSelect",
        //             data:{
        //                 musicNo : $("#accuracyDiv>input").val(),
        //             },
        //             success:function(mf){
        //                 $("audio").attr("src", mf.musicFileStorePath);
        //                 $(".music_title").html(
        //                 	mf.musicTitle + "<br>" + mf.musicSinger		
        //                 );
        //                 audio.play();
        //             },
        //             error:function(){
        //                 console.log("선택음원 ajax 실패")
        //             }
        //         })
        //         $(".playBarWrapper").css("display", "block");
        //     })
        // })
        //음원 재생바 커스텀 
        const audio = document.getElementById('music_source');
        const playButton = document.querySelector('.playBtn');
        const pauseButton = document.querySelector('.pauseBtn');
        const progressBar = document.querySelector('.progress-bar');
        const progress = document.querySelector('.progress');

        playButton.addEventListener('click', () => {
            audio.play();
            playButton.style.display = 'none';
            pauseButton.style.display = 'block';
        });

        pauseButton.addEventListener('click', () => {
            audio.pause();
            playButton.style.display = 'block';
            pauseButton.style.display = 'none';
        });

        audio.addEventListener('timeupdate', () => {
            const percentage = (audio.currentTime / audio.duration) * 100;
            progress.style.width = `${percentage}%`;
        });

        progressBar.addEventListener('click', (e) => {
            const clickPosition = (e.offsetX / progressBar.offsetWidth) * audio.duration;
            audio.currentTime = clickPosition;
        });
    </script>
</body>
</html>