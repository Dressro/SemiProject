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
</head>
<body>
	<h1>Login</h1>
	<div>
	<form action="semi.do" method="post">
	
			<input type="text" name="member_id" placeholder="아이디 입력"
					required="required"><br>
					
			<input type="password" name="member_password"
					placeholder="비밀번호 입력" required="required"><br>
			
				<a href="#">아이디 비밀번호찾기</a><br>
				<input type="submit" value="로그인"><br>
			
			<!-- 로그인api이미지 적용 -->
			<button type="button" id="snsloginBtn"><img src="#"/>카카오ID로그인</button><br>
			<button type="button" id="snsloginBtn"><img src="#"/>네이버ID로그인</button><br>
	</form>
	<hr>
	<button onclick="#'" type="button" class="button">회원가입</button>
	</div>
</body>
</html>