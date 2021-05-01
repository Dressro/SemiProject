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
<body>

	<jsp:include page="header.jsp" />
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
							<li data-filter=".bouquet">사료/간식</li>
							<li data-filter=".flower-box">케어</li>
							<li data-filter=".flower-shelf">리빙</li>
							<li data-filter=".basket">장난감</li>
							<li data-filter=".gift">패션</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row product__filter">
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/280.jfif">
							<div class="label">New</div>
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
						<div id="map" style="width:100%;height:350px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
						</script>
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
	<jsp:include page="bottom.jsp" />

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