<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("3FogXXVNeg3aYw15VPrY",
				"http://localhost:8787/SemiProject/naver_callback.jsp");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {

			var member_id = naver_id_login.getProfileData('id');
			var member_nicname = naver_id_login.getProfileData("nickname");
			var member_name = naver_id_login.getProfileData('name');
			
			var form = document.createElement('form');
			var objs_1;
			objs_1 = document.createElement('input');
			objs_1.setAttribute('type', 'hidden');
			objs_1.setAttribute('name', 'member_id');
			objs_1.setAttribute('value', member_id);
			form.appendChild(objs_1);
			var objs_2 = document.createElement('input');
			objs_2.setAttribute('type', 'hidden');
			objs_2.setAttribute('name', 'member_nicname');
			objs_2.setAttribute('value', member_nicname);
			form.appendChild(objs_2);
			var objs_3 = document.createElement('input');
			objs_3.setAttribute('type', 'hidden');
			objs_3.setAttribute('name', 'member_name');
			objs_3.setAttribute('value', member_name);
			form.appendChild(objs_3);
			var objs_4 = document.createElement('input');
			objs_4.setAttribute('type', 'hidden');
			objs_4.setAttribute('name', 'command');
			objs_4.setAttribute('value', 'naver');
			form.appendChild(objs_4);
			form.setAttribute('method', 'post');
			form.setAttribute('action', "semi.do");
			document.body.appendChild(form);
			form.submit();

		}
	</script>
</body>
</html>