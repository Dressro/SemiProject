<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

div {
  border-radius: 5px;
  padding: 20px;
}
input[type=submit] {
  width: 200px;
  background-color: #f0f0f0;
  color: black;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>Login</h1>
	<div>
	<form action="semi.do" method="post">
	
			<input type="hidden" name="command" value="loginres" />
			<input type="text" name="member_id" placeholder="아이디 입력"
					required="required"><br>
					
			<input type="password" name="member_password"
					placeholder="비밀번호 입력" required="required"><br>
			
				<a href="findidpw.jsp">아이디 비밀번호찾기</a><br>
				<input type="submit" value="login"><br>
			
			<!-- 로그인api이미지 적용 -->
			<button type="button" id="snsloginBtn"><img src="#"/>카카오ID로그인</button><br>
			 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  			<div id="naver_id_login"></div>
 			 <!-- //네이버아이디로로그인 버튼 노출 영역 -->
 			<script type="text/javascript">
  					var naver_id_login = new naver_id_login("3FogXXVNeg3aYw15VPrY", "http://localhost:8787/SemiProject/index.html");
  					var state = naver_id_login.getUniqState();
  					naver_id_login.setButton("green", 3,40);
  					naver_id_login.setDomain("http://localhost:8787/SemiProject/login.jsp");
  					naver_id_login.setState(state);
  					//naver_id_login.setPopup();
  					naver_id_login.init_naver_id_login();
 			 </script>
	</form>
	<hr>
	<button onclick="#" type="button" class="button">회원가입</button>
	</div>
</body>
</html>