<%@page import="com.musicCloud.member.model.vo.NaverMember"%>
<%@page import="com.musicCloud.member.model.vo.Member"%>
<%@page import="javax.swing.text.html.HTMLEditorKit.Parser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%
		//{"access_token":"AAAAOe8XbjrNMGE4zREYpSbCexkRkANLEBjFWqNqw0GQXyImQ8SQ_GjvOqRIE-EU3vpqR4vZ_mz_fS5Fr7OZ8YH9jh0","refresh_token":"5J6IZTNsHA4QaSAiibbO4XLzk2jGJaisAqwD5kalEipfubQy3BeooN7dNNcisWLb5KPWh1r0ZsXOsx4TdakbGrl7UfboE02JeNNK8AiihgvBhd4OePHrfTE0F0Ylism0OhDcxs","token_type":"bearer","expires_in":"3600"}
    String clientId = "DTkHU3VbjmkxYRkognp3";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "myhWXY_W23";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    //http://192.168.20.55:8118/music/views/common/naverCallback.jsp
    //http://192.168.20.55:8118/music/naverLogin
    String redirectURI = URLEncoder.encode("http://192.168.20.55:8118/music/views/common/naverCallback.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    //토큰은 계속 바뀌기 때문에 토큰 대신 고유 아이디를 저장
    String id = "";
    //System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;;
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      
      if(responseCode==200) {
    	  JSONParser parsar = new JSONParser();
    	  JSONObject jResponse = (JSONObject)parsar.parse(res.toString());
    	  accessToken = (String)jResponse.get("access_token");
    	  //출력
    	  System.out.println("엑세스 토큰 : " + accessToken);
    	  id = (String)jResponse.get("id"); //토큰 대신 DB로 가져갈 데이터
    	  
    	  //사용자 정보 api 사용
    	  String infoUrl = "https://openapi.naver.com/v1/nid/me";
    	  URL userApiUrl = new URL(infoUrl);
    	  HttpURLConnection infoCon = (HttpURLConnection)userApiUrl.openConnection();
    	  //System.out.println("infoCon : "+ infoCon);
        infoCon.setRequestMethod("GET");
        //요청 헤더(Authorization) : 정보를 가져오기 위해 접근 토큰 값을 받는 것
        infoCon.setRequestProperty("Authorization", "Bearer " + accessToken);
          
        int infoConCode = infoCon.getResponseCode();
      	BufferedReader infoBr;  
      	
      	if(infoConCode == 200) { // 정상 호출
            infoBr = new BufferedReader(new InputStreamReader(infoCon.getInputStream()));
          } else {  // 에러 발생
        	  infoBr = new BufferedReader(new InputStreamReader(infoCon.getErrorStream()));
          }
      	
      	String infoInputLine;
      	StringBuffer infoRes = new StringBuffer();
        while ((infoInputLine = infoBr.readLine()) != null) {
          infoRes.append(infoInputLine);
        }
        infoBr.close();
        
        if(infoConCode == 200){
        	//정보 추출
        	//System.out.println("infoRes : "+ infoRes.toString());
        	JSONObject infoResult = (JSONObject)parsar.parse(infoRes.toString());
        	//System.out.println("infoResult : "+ infoRes);
        	JSONObject infoResponse = (JSONObject)infoResult.get("response");
        	
        	String userId = (String)infoResponse.get("id");
        	String nickName = (String)infoResponse.get("nickname");
        	String name = (String)infoResponse.get("name");
        	String email = (String)infoResponse.get("email");
        	String age = (String)infoResponse.get("age"); //연령대
        	String gender = (String)infoResponse.get("gender"); //성별
        	String birthday = (String)infoResponse.get("birthday"); //사용자 생일(MM-DD 형식)
        	String birthyear = (String)infoResponse.get("birthyear");
        	String mobile = (String)infoResponse.get("mobile");
        	
        	//System.out.println(userId);
        	id = userId; //토큰은 주기적으로 바뀌어 갱신해줘야 하니때문에 고유 아이디를 이용해서 정보에 접근
        	
        	/*
        	System.out.println(userId);
        	System.out.println(nickName);
        	System.out.println(name);
        	System.out.println(email);
        	System.out.println(age);
        	System.out.println(gender);
        	System.out.println(birthday);
        	System.out.println(birthyear);
        	System.out.println(mobile);
        	*/
        	
        	request.setAttribute("uniqueId", userId);
        	request.setAttribute("nickName", nickName);
        	request.setAttribute("name", name);
        	request.setAttribute("email", email);
        	request.setAttribute("age", age);
        	request.setAttribute("gender", gender);
        	request.setAttribute("birthday", birthday);
        	request.setAttribute("birthyear", birthyear);
        	request.setAttribute("mobile", mobile);
        	//네이버 로그인 서블릿으로 이동
        	request.getRequestDispatcher("/naverLogin").forward(request, response);
        	
        }
      }
      
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>