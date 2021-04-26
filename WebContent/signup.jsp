<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/head.css" rel=stylesheet type="text/css" />
<link href="resources/css/footer.css" rel=stylesheet type="text/css" />
<style type="text/css">
.box {
	padding: 100px;
	margin: 50px;
	width: 48%;
	text-align: center;
	border: 6px solid black;
}

#join_container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 600px;
}

#singup_mid{
	width: 1200px;
	margin: 0 auto;
	min-height: 1000px;
}
</style>
</head>
<body>

	<div id="semipage">
		<header>

			<nav>
				<ul>
					<li><a href="index.jsp">
							<img src="https://www.onium.in/wp-content/uploads/2019/03/sample-logo-png-6-1.png" width="160" height="60" alt="메인화면" />
						</a></li>

					<li class="menu"><a href="semi.do?command=board_notice">공지사항</a>
					<li class="menu"><a href="semi.do?command=board_free">자유게시판</a>
					<li class="menu"><a href="semi.do?command=animal_hospital">동물병원검색</a>
					<li class="menu"><a href="semi.do?command=board_dec">실종신고</a>
					<li class="menu"><a href="semi.do?command=mypage">마이페이지</a>
					<li class="menu"><a href="semi.do?command=shopping">쇼핑</a>
					<li class="menu"><a href="semi.do?command=board_qna">상품문의</a>
					<li class="li_right" id="login"><a class="li_rigit_a" href="semi.do?command=login">로그인</a></li>
					<li class="li_right"><a class="li_rigit_a" href="semi.do?command=signup">회원가입</a></li>

				</ul>
			</nav>

		</header>
		<div id="singup_mid">
			<h1>회원가입</h1>
			<div id="join_container">
				<div class="box">
					<input type="button" value="일반회원" onclick="location.href='semi.do?command=general_signup'">
				</div>
				<div class="box">
					<input type="button" value="전문의 회원" onclick="location.href='semi.do?command=doctor_signup'">
				</div>
			</div>
		</div>

		<div id="semi_footer">
			<div class="footer">
				<h2>Family Pet</h2>
				<ul class="footer_ul">
					<li class="footer_content"><a href="#" class="footer_ul_a">이용약관</a></li>
					<li class="footer_content"><a href="#" class="footer_ul_a">개인정보처리방침</a></li>
					<li class="footer_content"><a href="#" class="footer_ul_a">제휴문의</a></li>
				</ul>
				<div class="footer_div">
					Famliy Pet | 대표이사 : 이민형 | 서울특별시 강남구 삼성로 648<br> 사업자 등록번호 : 000-00-000000 | 통신판매업신고 : 2021-서울강남-0000
				</div>
				<ul class="footer_sns">
					<li class="li_right"><a href="https://www.facebook.com" class="footer_sns_a">
							<img src="https://opgg-static.akamaized.net/images/site/sns/facebook_icon_white.png" />
						</a></li>
					<li class="li_right"><a href="https://www.instagram.com" class="footer_sns_a">
							<img src="https://opgg-static.akamaized.net/images/site/sns/instagram_icon_white.png" />
						</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>