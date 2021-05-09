<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("3FogXXVNeg3aYw15VPrY","http://qclass.iptime.org:8585/semi/naver_callback.jsp");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {

			var member_id = naver_id_login.getProfileData('id');
			
			
			var form = document.createElement('form');
			var objs_1;
			objs_1 = document.createElement('input');
			objs_1.setAttribute('type', 'hidden');
			objs_1.setAttribute('name', 'member_id');
			objs_1.setAttribute('value', member_id);
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
		}
	</script>
</body>
</html>