<%@page import="com.musicCloud.playlist.model.vo.PlayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//playlistNo : 플레이리스트번호, memberNo : 회원번호, playlistName : 플레이리스트 이름
	//playlistTag : 플레이리스트 태그, payment_status : 결제 여부
	ArrayList<PlayList> playlist2 = (ArrayList<PlayList>)session.getAttribute("pList");
	System.out.println(playlist2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=shopping_cart_checkout" />
<style>
    #mainPage-border{
        width: 1500px;
        margin: auto;
    }
    .mainPage{
        width: 1300px;
        margin: auto;
        float: left;
    }

    .mainList {
        border: 1px solid #1587d0;
        width: 100%;
        height: 350px;
        border-radius: 10px;
        margin-bottom: 20px;
    }	


    /*음원 목록 class="mainList" id="music_list"*/
    /*음원 목록 선택 글자*/
    #musicList_select{
        margin: 10px;
    }
    #musicList_select a{
        text-decoration: none;
        color: black;
    }
    /*음원 리스트 div*/
    #musicList_content{
        width: 100%;
        height: 85%;
        /*가로 무한 스크롤*/
        display: flex;
        overflow-x: scroll;
        width: 100%;
        white-space: nowrap;
    
    }
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
        height: 95%;
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
    
    /* .material-symbols-outlined{
        font-size: 40px;
    } */
    #cart{
        font-size: 40px;
    }
    .musicText{
        width: 70%;
        height: 100%;
        color: white;
        font-weight: bold;
        padding: 5px;
    }
   
    /*추천 플레이 리스트(class="mainList" id="music_payment")*/
    /*제목*/
    #payment_title{
        background-color: #1587d0;
        color: white;
        width: 200px;
        height: 30px;
        text-align: center;
        margin: auto;
        line-height: 25px;
        margin-top: 10px;
        border-radius: 5px;
    }
    /*정보*/
    #payment_info{
        display: flex;
        justify-content: center;
        height: 80%;
    }
    #payment_info>*{ width: 25%; }
    /*이미지*/
    /*내용*/
    #payment_cotent *{
        height: 25%;
        margin-top: 80px;
        font-size: larger;
        text-align: center;
        line-height: 30px;
    }
    /*플레이리스트*/
    #payment_playList_img{
        text-align: center;
        margin-top: 50px;
    }
    #payment_playList_img img{
        width: 50%;
        height: 50%;
        margin-bottom: 10px;
    }
    /*결제버튼*/
    #payment_btn{
        text-align: center;
    }
    #payment_btn button{
        width: 95%;
        height: 30%;
        line-height: 50px;
        border-radius: 30px;
        margin-top: 25%;
    }

    /*게시판 미리보기 리스트 class="mainList" id="board"*/
    #mainPage_boardTitle{
        background-color: #1587d0;
        color: white;
        width: 200px;
        height: 10%;
        text-align: center;
        margin: auto;
        line-height: 30px;
        margin-top: 10px;
        border-radius: 5px;
    }
    /*게시판 미리보기 div*/
    #board_list{
        margin-top: 20px;
        height: 70%;
    }
    #board_list>table{
        /*테이블디자인*/
        border-left: none;
        border-right: none;
        border-color: #1587d0;

        /*사이즈 지정*/
        text-align: center;
        width: 90%;
        height: 100%;
        margin: auto;
    }
    th, td {
        border-left: none;
        border-right: none;
    }

    /*플레이 리스트 미리보기 class="mainList" id="playList"*/
    /*플레이리스트 나열 div*/
    #playList_list{
        display: flex;
        justify-content: center;
        gap: 50px;
    }

    #playList_mainTitle{
        background-color: #1587d0;
        color: white;
        width: 200px;
        height: 30px;
        text-align: center;
        margin: auto;
        line-height: 25px;
        margin-top: 10px;
        border-radius: 5px;
    }

    .personPlaylist:hover{
		cursor: pointer;
	}
	.personPlaylist{
		border: 1px solid skyblue;
		width: 250px;
		height: 250px;
		border-radius: 5px;
		overflow: hidden;
        margin-top: 20px;

	}
	.personPlaylist b{
		font-size: small;
	}
	.playlistImg{
		display: flex;
		flex-wrap: wrap;
		width: 100%;
		height: 80%;
	}
	.playlistImg>img{
		width: 50%;
		height: 50%;
	}
	.playlistContent{
		width: 100%;
		height: 20%;
		text-align: center;
		font-size: large;
		line-height: 45px;
	}
    
    
</style>
</head>
<body>
    <%@ include file="menubar.jsp" %>

    <div id="mainPage-border">
        <div class="mainPage">
            <!--음원 리스트-->
        <div class="mainList" id="music_list">
            <div id="musicList_select"> 
                <a href="">인기순</a> / 
                <a href="">지역별</a>
            </div>

            <div id="musicList_content">
                
            </div>
        
        </div>
    

        <div class="mainList" id="music_payment">
            <div id="payment_title"><b>오늘의 추천 플레이 리스트</b></div>

            <div id="payment_info">
                <!-- <div id="payment_img">연예인 이미지 첨부</div>
                <div id="payment_cotent">
                    <div>차은우가 이번달에 가장 많이 들은 플레이 리스트</div>
                </div>
                <div id="payment_playList">
                    <div id="payment_playList_img"><img src="resources/image/mainlogo.png" alt=""></div>
                    <div id="payment_playList_content" align="center"><b>차은우님의 플레이 리스트</b></div>
                </div>
                <div id="payment_btn">
                    <button class="btn btn-light">결제 후 확인 가능</button>
                </div> -->
                <img src="resources/image/연예인플레이리스트.PNG" alt="" style="width: 100%; height: 80%; margin-top: 30px">
            </div>
        </div>
    
        <!-- 게시판 -->
        <div class="mainList" id="board">
            <div id="mainPage_boardTitle"><b>게시판</b></div>

            <div id="board_list">
                <table border="1">
                    <thead>
                        <tr>
                            <th>게시글 번호</th>
                            <th>제목</th>
                            <th>조회수</th>
                            <th>작성 일자</th>
                            <th>작성자</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>

        </div>
    
        <div class="mainList" id="playList">

            <div id="playList_mainTitle"><b>플레이 리스트</b></div>

            <div id="playList_list">

               <%if(playlist2 != null) {%>
				<%
					String[] musicNum = null;
					//소유한 플레이 리스트 만큼 반복
					for(PlayList p : playlist2){
						musicNum = p.getPlayListMusicTotal().split(",");
				%>
					<div class="personPlaylist">

						<!-- 음원 이미지(4개고정) -->
						<div class="playlistImg">
							<%for(int i=0; i<4; i++){%>
								<img src="<%
										for(MusicFile f : fileList){
											if(Integer.parseInt(musicNum[i % musicNum.length]) == f.getMusicNo()){
									%> <%= f.getMusicImagePath()%>
									<%
											}
										}
									%>">
									
							<%} //음원이미지반복문끝부분%>
						</div>

						<!-- 플레이리스트 제목-->
						<div class="playlistContent">
							<b><%= p.getPlaylistTag()%></b>
						</div>

					</div>
				<%}//플레이리스트 개수 만큼 반복문 끝부분%>
			<%}else{%>
				<h2>플레이 리스트가 없습니다</h2>
			<%} %>                    
                
            </div>
            
            </div>
        </div>
    </div>

    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    <script>
        $(function(){
        	//플레이리스트 조회
            if($("#memberNo").val() != "noneLogin"){
                $.ajax({
                    url: "mainPlaylist",
                    data: { memberNo: $("#memberNo").val()},
                    success:function(p){
                            //세션에 저장함
                    },
                    error:function(){
                        console.log("플레이 리스트 가져오는 ajax 실패");
                    }
                })
            }
        	
            //음원 인기순
            $.ajax({
                url: "mainPopularMusic",
                success:function(pList){
                    let content = "";
                    if(pList != null){
                        for(let i=0; i<pList.length; i++){
                        	content += `<div class="musicAccuracyDiv">
                            <div class="musicImg"><img src="\${pList[i].musicImagePath}" alt=""><input type="hidden" value="\${pList[i].musicNo}"></div>
                            <div class="musicInfo">
                                <div class="musicText">
                                \${pList[i].musicTitle} <br> 
                                \${pList[i].musicSinger} 
                                </div>
                                <div class="cartImg">
                                    <span class="material-symbols-outlined" id="cart">shopping_cart_checkout</span>
                                    <input type="hidden" value="\${pList[i].musicNo}">
                                </div>
                            </div>
                        </div>`
                        }
                        $("#musicList_content").html(content)
                    }
                    
                },
                error:function(){ console.log("인기순 음원 ajax 실패")}
            })
            
            //최신 게시글 5개만 조회
            $.ajax({
            	url:"mainBoardList",
            	success:function(list){
            		let content = ""
            		if(list != null){
            			for(let i=0; i<list.length; i++){
            				content += `
            					<tr>
            					<th>\${list[i].boardNo}</th>
            					<th>\${list[i].boardTitle}</th>
            					<th>\${list[i].boardCount}</th>
            					<th>\${list[i].enrollDate}</th>
            					<th>\${list[i].memberAlias}</th>
            				</tr>`;
            			}
            			
            		}
            		$("#board_list tbody").html(content);
            		
            	},
            	error:function(){
            		console.log("최신 게시글 가져오는 ajax 실패");
            	}
            })
        })
    </script>

    <%@ include file="../play/playBar.jsp" %>
</body>
</html>