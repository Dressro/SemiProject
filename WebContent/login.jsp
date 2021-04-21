<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border-radius: 5px;
	padding: 5px;
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
#kakao_id_login {
	padding: 0;
	width: 185px;
	height: 40px;
}
#kakao-login-btn {
	width: 185px;
	height: 40px;
}
#kakao_padding {
	padding-top: 10px;
}
</style>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.google.com/recaptcha/api.js" defer></script>
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
					  
		
					  var form = document.createElement('form');
					  var objs_1;
					  objs_1 = document.createElement('input');
					  objs_1.setAttribute('type', 'hidden');
					  objs_1.setAttribute('name', 'member_id');
					  objs_1.setAttribute('value', userID);
					  form.appendChild(objs_1);
						var objs_4 = document.createElement('input');
						objs_4.setAttribute('type', 'hidden');
						objs_4.setAttribute('name', 'command');
						objs_4.setAttribute('value', 'sns_signup');
						form.appendChild(objs_4);
					  form.setAttribute('method', 'post');
					  form.setAttribute('action', "semi.do");
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
		<form action="semi.do" method="post" onsubmit="return submitUserForm();">

			<input type="hidden" name="command" value="loginres" />
			<input type="text" name="member_id" placeholder="아이디 입력" required="required">
			<br>
			<input type="password" name="member_password" placeholder="비밀번호 입력" required="required">
			<br>

			<a href="findidpw.jsp">아이디 비밀번호찾기</a>
			<br>
			<div id="g-recaptcha-error"></div>
			<input type="submit" value="login">
			<br>

			<!-- 로그인api이미지 적용 -->
			<div id="kakao_padding">
				<div id="kakao_id_login"></div>
			</div>
			<br>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naver_id_login"></div>
			<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			<script type="text/javascript">
  					var naver_id_login = new naver_id_login("3FogXXVNeg3aYw15VPrY", "http://localhost:8787/SemiProject/naver_callback.jsp");
  					var state = naver_id_login.getUniqState();
  					naver_id_login.setButton("green", 3,40);
  					naver_id_login.setDomain("http://localhost:8787/SemiProject/login.jsp");
  					naver_id_login.setState(state);
  					//naver_id_login.setPopup();
  					naver_id_login.init_naver_id_login();
 			 </script>
		</form>

		<!-- google reCaptcha -->
		<div class="g-recaptcha" data-sitekey="6LfGNrAaAAAAACnlQAb1RFvF-DQJApSARniYjGki" data-callback="verifyCaptcha"></div>


		<script type="text/javascript">
			function submitUserForm() {
			    var response = grecaptcha.getResponse();
			    if(response.length == 0) {
			        document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">reCaptcha 인증실패</span>';
			        return false;
			    }
			    return true;
			}
			 
			function verifyCaptcha() {
			    document.getElementById('g-recaptcha-error').innerHTML = '';
			}
			</script>

	</div>
</body>
</html>