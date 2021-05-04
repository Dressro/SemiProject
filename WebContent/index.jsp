<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");

%>
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
							<h5>엔젤스독 전연령5kg 강아지사료</h5>
							<div class="price">12600원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=23" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-box">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/286.jfif">
						</div>
						<div class="product__item__text">
							<h5>강아지 바르는치약 구강 청결제</h5>
							<div class="price">11700원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=29" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-shelf">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/289.jfif">
							<div class="label">Sale</div>
						</div>
						<div class="product__item__text">
							<h5>리터박스 고양이 대형화장실 집</h5>
							<div class="price">30500원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=32" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/283.jfif">
							<div class="label">New</div>
						</div>
						<div class="product__item__text">
							<h5>로얄캐닌인도어4kg 고양이사료</h5>
							<div class="price">46910원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=26" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix basket">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/284.jfif">
						</div>
						<div class="product__item__text">
							<h5>셀프치카봉 강아지 고양이 셀프</h5>
							<div class="price">8720원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=27" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix gift">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/290.jfif">
						</div>
						<div class="product__item__text">
							<h5>강아지 고양이 옷 귀여운 토끼</h5>
							<div class="price">6900원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=33" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/282.jfif">
						</div>
						<div class="product__item__text">
							<h5>요세라 그레인프리 캣 2kg</h5>
							<div class="price">36220원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=25" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-box">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/287.jfif">
							<div class="label">Out Of Stock</div>
						</div>
						<div class="product__item__text">
							<h5>켄코케어 강아지 손가락칫솔</h5>
							<div class="price">7200원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=30" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix flower-shelf">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/288.jfif">
							<div class="label">New</div>
						</div>
						<div class="product__item__text">
							<h5>고양이 벤토나이트 모래9kg</h5>
							<div class="price">34870원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=31" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix bouquet">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/281.jfif">
							<div class="label">New</div>
						</div>
						<div class="product__item__text">
							<h5>트루라인 도그 피쉬 2kg사료	</h5>
							<div class="price">37000원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=24" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix basket">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/285.jfif">
						</div>
						<div class="product__item__text">
							<h5>고양이 훈련용 분리불안해소</h5>
							<div class="price">9900원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=28" class="cart-btn">Add to cart</a>
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-col mix gift">
					<div class="product__item">
						<div class="product__item__pic set-bg" data-setbg="resources/images/product/291.jfif">
							<div class="label">New</div>
						</div>
						<div class="product__item__text">
							<h5>펫스츄리 강아지 앞섬방지 고리</h5>
							<div class="price">14800원</div>
							<%if(dto!=null){ %>
							<a href="semi.do?command=shopping_detail&prod_num=34" class="cart-btn">Add to cart</a>
							<%} %>
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
						<span>동물 병원 찾기</span>
						<h4>검색을 통해<br> 동물 병원을 찾아보세요!</h4>
					</div>
				</div>
				<div class="col-lg-7 offset-lg-1">
					<div class="about__top__text">
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
						<span>동물 병원 찾기</span>
						<h2>검색을 통하여</h2>
						<p>서울 모든 펫서비스를 빠르게 확인하고 이용해 보세요</p>
						<a href="semi.do?command=animal_hospital" class="primary-btn">찾기</a>
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
						<a href="semi.do?command=board_dec" style="font-size: 40pt;">+</a>
					</div>
				</div>
			</div>
			<div class="row">
			<c:set var="count" value="1" />
				<c:forEach items="${l_list }" var="dto">
				<div class="col-lg-4 col-md-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="semi.do?command=dec_detail&board_no=${dto.board_no }"><img src="resources/images/pet/${count }.jpg" alt="" style="height: 293px;"></a>
						</div>
						<div class="blog__item__text">
							<div class="label">
								<span>${dto.member_id }</span>
							</div>
							<div style="height: 200px;">${dto.board_content }</div>
							<span><fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd" /></span>
						</div>
					</div>
				</div>
				<c:set var="count" value="${count + 1}" />
				</c:forEach>
			</div>
		</div>
	</section>


	<section class="footer-top-section">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-6 col-md-12">
					<div class="footer-widget mb-5 mb-md-0"><a href="semi.do?command=board_notice" style="float: right; font-size: 15pt;">+</a>
						<h4 class="fw-title">공지사항</h4>
						<hr>
						<c:forEach items="${n_list }" var="dto">
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-content" style="height: 150px;">
									<h5 style="height: 50px; overflow: hidden;"><a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a></h5>
									<div style="height: 46px; overflow: hidden;">${dto.board_content }</div>
									작성자 : ${dto.member_id }<div class="lb-date" style="float: right;"><fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd" /></div>
								</div>
							</div>
						</div>
						<hr>
						</c:forEach>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12">
					<div class="footer-widget mb-5 mb-md-0"> <a href="semi.do?command=board_free" style="float: right; font-size: 15pt;">+</a>
						<h4 class="fw-title">자유게시판</h4> 
						<hr>
						<c:forEach items="${f_list }" var="dto">
						<div class="latest-blog">
							<div class="lb-item">
								<div class="lb-content" style="height: 150px;">
									<h5 style="height: 50px; overflow: hidden;"><a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a></h5>
									<div style="height: 46px; overflow: hidden;">${dto.board_content }</div>
									작성자 : ${dto.member_id }<div class="lb-date" style="float: right;"><fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd" /></div>
								</div>
							</div>
						</div>
						<hr>
						</c:forEach>
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