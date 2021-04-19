<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("3FogXXVNeg3aYw15VPrY", "http://localhost:8787/SemiProject/naver_callback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	
    var id = naver_id_login.getProfileData('id');
    var nicname = naver_id_login.getProfileData("nickname");
    var name = naver_id_login.getProfileData('name');
    var email = naver_id_login.getProfileData('email');
    var mobile = naver_id_login.getProfileData('mobile');
    
    location.href = "semi.do?command=naver&id="+id+"&nicname="+nicname+"&name="+name+"&email="+email+"&mobile="+mobile;
    
  }
 
</script>
</body>
</html>