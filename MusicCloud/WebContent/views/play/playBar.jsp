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

      
    </style>
</head>
<body>
 



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