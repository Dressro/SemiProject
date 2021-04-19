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
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

$(function(){
	Kakao.init('5c95aa7ad857e55475bed627ba9faf99');
	Kakao.isInitialized();
	
	console.log("Kakao.isInitialized()", Kakao.isInitialized());
	
	Kakao.Auth.createLoginButton({
		  container: '#kakao_id_login',
		  success: function(authObj) {
			  Kakao.API.request({
				  url: '/v2/user/me',
				  success: function(response){
					  var userID = response.id;
					  var useEmail = response.kakao_account.email;
					  var userNickName = response.properties.nickname;
					  
					  console.log("userID",userID);
					  console.log("useEmail",useEmail);
					  console.log("useNickName",userNickName);
					  var form = document.createElement('form');
					  var objs_1;
					  objs_1 = document.createElement('input');
					  objs_1.setAttribute('type', 'hidden');
					  objs_1.setAttribute('name', 'member_id');
					  objs_1.setAttribute('value', userID);
					  form.appendChild(objs_1);
					  objs_2 = document.createElement('input');
					  objs_2.setAttribute('type', 'hidden');
					  objs_2.setAttribute('name', 'member_email');
					  objs_2.setAttribute('value', useEmail);
					  form.appendChild(objs_2);
					  objs_3 = document.createElement('input');
					  objs_3.setAttribute('type', 'hidden');
					  objs_3.setAttribute('name', 'member_nicname');
					  objs_3.setAttribute('value', userNickName);
					  form.appendChild(objs_3);
					  form.setAttribute('method', 'post');
					  form.setAttribute('action', "/semi.do");
					  document.body.appendChild(form);
					  form.submit();
				  },
				  fail: function(error){
					  console.log("request fail", error);
				  }
			});
			  
		  },
		  fail: function(err) {
			 alert(JSON.stringify(err));
		  },
		});
	 
});

</script>
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
			
			<div id="kakao_id_login"></div>
  			<div id="naver_id_login"></div>
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