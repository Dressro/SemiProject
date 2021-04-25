<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="keywords" content="Florist  unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Family|Pet</title>
<link rel="shortcut icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__widget">
			<ul>
			</ul>
			<div class="price">Family Pet</div>
		</div>
		<div class="offcanvas__logo">
			<a href="index.jsp">
				<img src="resources/images/logo/logo.png" width="160" height="60" alt="메인화면" />
			</a>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>


	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="index.jsp">
							<img src="resources/images/logo/logo.png" width="160" height="60" alt="메인화면" />
						</a>
					</div>
				</div>
				<div class="col-lg-14">
					<div class="header__options">
						<nav class="header__menu mobile-menu">
							<ul>
								<li class="active"><a href="index.jsp">Home</a></li>
								<li><a href="semi.do?command=board_notice">공지사항</a>
								<li><a href="semi.do?command=board_free">자유게시판</a>
								<li><a href="semi.do?command=animal_hospital">동물병원검색</a>
								<li><a href="semi.do?command=board_dec">실종신고</a>
								<li><a href="semi.do?command=mypage">마이페이지</a>
								<li><a href="semi.do?command=shopping">쇼핑</a>
								<li><a href="semi.do?command=board_qna">상품문의</a> <%
 if (dto == null) {
 %>
								<li class="menu"><a href="semi.do?command=chatlist">채팅</a> <%
 } else {
 %>
								<li class="menu"><a href="semi.do?command=chatlist&member_id=<%=dto.getMember_id()%>">채팅</a> <%
 }
 %>
								<li class="menu"><a href="semi.do?command=chatboard">채팅방 test</a> <%--
					<li class="menu"><a href="semi.do?command=test">test</a>
					 --%> <%
 if (dto == null) {
 %>
								<li class="li_right" id="login"><a class="li_rigit_a" href="semi.do?command=login">로그인</a></li>
								<%
								} else {
								%>
								<li class="li_right"><a class="li_rigit_a" href="semi.do?command=logout">로그아웃</a> <%
 }
 %>
								<li class="li_right"><a class="li_rigit_a" href="semi.do?command=signup">회원가입</a></li>
							</ul>
						</nav>
						<div class="header__option__right">
							<div class="header__option__right_seearch">
								<ul>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="canvas__open">
			<i class="fa fa-bars"></i>
		</div>
	</header>


	<section class="hero">
		<div class="hero__slider owl-carousel">
			<div class="hero__items set-bg" data-setbg="resources/images/section/section_1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<div class="hero__text">
								<a href="#" class="primary-btn">더보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hero__items set-bg" data-setbg="resources/images/section/section_2.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<div class="hero__text">
								<a href="#" class="primary-btn">더보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hero__items set-bg" data-setbg="resources/images/section/section_3.jpg">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<div class="hero__text">
								<a href="#" class="primary-btn">더보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="arrival spad" style="padding-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<span>Family Pet</span>
						<h2>Recommend Product</h2>
					</div>
					<div class="filter__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".bouquet">Bouquet</li>
							<li data-filter=".flower-box">Flower box</li>
							<li data-filter=".flower-shelf">Flower shelf</li>
							<li data-filter=".basket">Basket of flower</li>
							<li data-filter=".gift">Gift combos</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row product__filter">
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<div class="label">New</div>
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-box">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-shelf">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<div class="label">Sale</div>
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix basket">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix gift">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-box">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<div class="label">Out Of Stock</div>
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-shelf">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<div class="label">New</div>
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix basket">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
				<div class="d-col mix gift">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/product-1.jpg">
							<div class="label">New</div>
							<ul class="product__item__hover">
								<li><a href="#">
										<span class="icon_search"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_bag_alt"></span>
									</a></li>
								<li><a href="#">
										<span class="icon_heart_alt"></span>
									</a></li>
							</ul>
						</div>
						<div class="product__item__text">
							<h5>
								<a href="#">Fly Me To The Moon</a>
							</h5>
							<div class="price">$27.50</div>
							<a href="#" class="cart-btn">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="about spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="section-title">
						<span>동물 병원 약국 찾기</span>
						<h2>큰 설명</h2>
					</div>
				</div>
				<div class="col-lg-7 offset-lg-1">
					<div class="about__top__text">
						<p>디테일 한 설명</p>
					</div>
				</div>
			</div>
			<div class="row" style="padding-top: 70px;">
				<div class="col-lg-6">
					<div class="about__text">
						<span>지도 넣기</span>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="about__text">
						<span>동물병원 약국 찾기</span>
						<h2>큰설명</h2>
						<p>디테일 설명</p>
						<a href="#" class="primary-btn">찾기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="latest spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-6">
					<div class="section-title">
						<span>실종 PET</span>
						<h2>LIST</h2>
					</div>
				</div>
				<div class="col-lg-5 col-md-6">
					<div class="latest__btn">
						<a href="#" class="primary-btn border-btn">더보기</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="resources/images/pet/pet_2.JPG" alt="" style="height: 293px;">
						</div>
						<div class="blog__item__text">
							<div class="label">
								<span>서울시 강남구</span>
							</div>
							<h4>
								<a href="#">이름 : 멍뭉이 </a>
							</h4>
							<p>디테일 한 정보</p>
							<span>MAY 22, 2020</span>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="resources/images/pet/pet_2.JPG" alt="" style="height: 293px;">
						</div>
						<div class="blog__item__text">
							<div class="label">
								<span>서울시 강남구</span>
							</div>
							<h4>
								<a href="#">이름 : 멍뭉이 </a>
							</h4>
							<p>디테일 한 정보</p>
							<span>MAY 22, 2020</span>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<img src="resources/images/pet/pet_2.JPG" alt="" style="height: 293px;">
						</div>
						<div class="blog__item__text">
							<div class="label">
								<span>서울시 강남구</span>
							</div>
							<h4>
								<a href="#">이름 : 멍뭉이 </a>
							</h4>
							<p>디테일 한 정보</p>
							<span>MAY 22, 2020</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="footer-top-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-widget mb-5 mb-md-0">
						<h4 class="fw-title">공지사항</h4>
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget mb-5 mb-md-0">
						<h4 class="fw-title">자유게시판</h4>
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
							<div class="lb-item">
								<div class="lb-content">
									<h5>제목</h5>
									<p>내용</p>
									<div class="lb-date">June 21, 2018</div>
									<a href="#" class="lb-author">작성자 : </a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer-widget">
						<h4 class="fw-title">갤러리</h4>
						<div class="top-comment">
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="resources/images/pet/pet_2.JPG"></div>
								<div class="tc-content">
									<p>
										<a href="#">작성자</a>
									</p>
									<div class="tc-date">June 21, 2018</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="resources/images/pet/pet_2.JPG"></div>
								<div class="tc-content">
									<p>
										<a href="#">작성자</a>
									</p>
									<div class="tc-date">June 21, 2018</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg" data-setbg="resources/images/pet/pet_2.JPG"></div>
								<div class="tc-content">
									<p>
										<a href="#">작성자</a>
									</p>
									<div class="tc-date">June 21, 2018</div>
								</div>
							</div>
							<div class="tc-item">
								<div class="tc-thumb set-bg" style="background-size: cover;" data-setbg="resources/images/pet/pet_2.JPG"></div>
								<div class="tc-content">
									<p>
										<a href="#">작성자</a>
									</p>
									<div class="tc-date">June 21, 2018</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer">
		<div class="container">
			<div class="footer__options">
				<div class="row">
					<div class="col-lg-2 col-md-3">
						<div class="footer__widget">
							<h4>Company</h4>
							<ul>
								<li><a href="#">About us</a></li>
								<li><a href="#">Servcies</a></li>
								<li><a href="#">Contact us</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-3">
						<div class="footer__widget">
							<h4>Account</h4>
							<ul>
								<li><a href="#">My cart</a></li>
								<li><a href="#">Wisslist</a></li>
								<li><a href="#">Login/Register</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="footer__newslatter">
							<h4>Newletter</h4>
							<p>Subcribe to our newsletter to get more free tips. No Spam, Promise.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="footer__widget footer__widget--address">
							<h4>Get in touch</h4>
							<ul>
								<li>69 North Cleveland Street, Memphis,USA.</li>
								<li>(123) 8111 9210 - (012) 1111 6868</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="footer__copyright">
				<div class="row">
					<div class="col-lg-12 text-center">

<p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This is made with by <a href="index.jsp" target="_blank">Family Pet</a>
</p>


					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/mixitup.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.nicescroll.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>

</body>
</html>