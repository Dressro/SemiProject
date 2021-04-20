<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
}

ul {
	list-style: none;
}

a:hover, a:visited, a:link {
	color: black;
}

a {
	text-decoration: none;
}

img {
	max-width: 100%;
}

.dot {
	position: relative;
	right: 37%;
	top: 40%;
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-size: 50px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	background-color: rgba(0, 0, 0, 0.8);
}

.slideshow-container {
	max-height: 300px;
	position: relative;
}

.slideshow-container .mySlides img {
	height: 300px;
}

.mySlides {
	display: none;
}

.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 0.5s;
	animation-name: fade;
	animation-duration: 0.5s;
}

#section_1 {
	height: 300px;
	width: 100%;
	padding-bottom: 50px;
}

#semipage{
	min-width:1200px;
	min-height: 100%;
	position:relative;
	overflow:hidden;
}

@-webkit-keyframes fade {
  		from {opacity: .2}
  		to {opacity: 1}
	}

	@keyframes fade {
  		from {opacity: .2}
 		to {opacity: 1}
	}

ul {
	list-style-type: none;
	margin: 0;
	overflow: hidden;
	background-color: #ffffff;
}

li {
	float: left;
}

li a {
	display: block;
	color: black;
	text-align: center;
	padding: 15px 20px;
	text-decoration: none;
}

.menu {
	margin-top: 20px;
}

.footer {
	padding: 10px;
	text-align: center;
	background-color: #f0f0f0;
	text-align: center;
}

.footer a {
	text-decoration: none;
	color: black;
	padding: 0px 14px;
	border-right: #888 solid 1px;
}
</style>
<script type="text/javascript">
	var slideIndex = 0;

	window.onload = function() {
		showSlides(slideIndex);

		var sec = 3000;
		setInterval(function() {
			slideIndex++;
			showSlides(slideIndex);

		}, sec);
	}

	function moveSlides(n) {
		slideIndex = slideIndex + n
		showSlides(slideIndex);
	}

	function currentSlide(n) {
		slideIndex = n;
		showSlides(slideIndex);
	}

	function showSlides(n) {

		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		var size = slides.length;

		if ((n + 1) > size) {
			slideIndex = 0;
			n = 0;
		} else if (n < 0) {
			slideIndex = (size - 1);
			n = (size - 1);
		}

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}

		slides[n].style.display = "block";
		dots[n].className += " active";
	}
</script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>
	<div id="semipage">
		<header>

			<nav>
				<ul>
					<li><a href="#">
							<img src="https://www.onium.in/wp-content/uploads/2019/03/sample-logo-png-6-1.png" width="160" height="60" alt="메인화면" />
						</a></li>

					<li class="menu"><a href="semi.do?command=board_notice">공지사항</a>
					<li class="menu"><a href="semi.do?command=board_free">자유게시판</a>
					<li class="menu"><a href="#">동물병원검색</a>
					<li class="menu"><a href="semi.do?command=board_dec">실종신고</a>
					<li class="menu"><a href="semi.do?command=mypage">마이페이지</a>
					<li class="menu"><a href="semi.do?command=shopping">쇼핑</a>
					<li class="menu"><a href="semi.do?command=board_qna">상품문의</a>
					<%
						if(dto == null){
					%>
					<li style="float: right " id="login"><a href="semi.do?command=login">로그인</a></li>
					<%
						} else {
					%>
					<li style="float: right "><a href="semi.do?command=logout">로그아웃</a>
					<%
						}
					%>
					<li style="float: right"><a href="semi.do?command=signup">회원가입</a></li>

				</ul>
			</nav>

		</header>
		<div id="body">
			<div id="section_1">
				<div class="slideshow-container">
					<div class="mySlides fade">
						<img src="resources/images/section1.jpg">
						<div class="text">
							<span class="dot" onclick="currentSlide(0)"></span> <span class="dot" onclick="currentSlide(1)"></span> <span class="dot" onclick="currentSlide(2)"></span>
						</div>

					</div>

					<div class="mySlides fade">
						<img src="resources/images/section1.jpg">
						<div class="text">
							<span class="dot" onclick="currentSlide(0)"></span> <span class="dot" onclick="currentSlide(1)"></span> <span class="dot" onclick="currentSlide(2)"></span>
						</div>
					</div>

					<div class="mySlides fade">
						<img src="resources/images/section1.jpg">
						<div class="text">
							<span class="dot" onclick="currentSlide(0)"></span> <span class="dot" onclick="currentSlide(1)"></span> <span class="dot" onclick="currentSlide(2)"></span>
						</div>
					</div>

					<a class="prev" onclick="moveSlides(-1)">&#10094;</a>
					<a class="next" onclick="moveSlides(1)">&#10095;</a>
				</div>
			</div>
			<div id="section_2"></div>
			<div id="section_3"></div>
			<div id="section_4"></div>
			<div id="section_5"></div>
		</div>
		<div id="footer"></div>



		<h1>body</h1>
		<div id="footer">
		<footer>


			<ul class="footer_link">
				<li style="float: right"><a href="#" target="_blank" class="facebook" title="페이스북">페이스북</a></li>
				<li style="float: right"><a href="#" target="_blank" class="instagram" title="인스타그램">인스타그램</a></li>
			</ul>
			<div class="footer">
				<h1>Family Pet</h1>
				<a href="#">이용약관</a>
				<a href="#">개인정보처리방침</a>
				<a href="#">제휴문의</a>
				<address>
					<br> Famliy Pet | 대표이사 : 이민형 | 서울특별시 강남구 삼성로 648<br> 사업자 등록번호 : 000-00-000000 | 통신판매업신고 : 2021-서울강남-0000
				</address>
			</div>

		</footer>
		</div>
	</div>
</body>
</html>