<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.HospitalDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56&libraries=services,clusterer,drawing"></script>
<link href="resources/css/head.css" rel=stylesheet type="text/css" />

</head>
<body>
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	%>
	<div id="semipage">
		<header>

			<nav>
				<ul>
					<li><a href="#">
							<img src="https://www.onium.in/wp-content/uploads/2019/03/sample-logo-png-6-1.png" width="160" height="60" alt="메인화면" />
						</a></li>

					<li class="menu"><a href="semi.do?command=board_notice">공지사항</a>
					<li class="menu"><a href="semi.do?command=board_free">자유게시판</a>
					<li class="menu"><a href="semi.do?command=animal_hospital">동물병원검색</a>
					<li class="menu"><a href="semi.do?command=board_dec">실종신고</a>
					<li class="menu"><a href="semi.do?command=mypage">마이페이지</a>
					<li class="menu"><a href="semi.do?command=shopping">쇼핑</a>
					<li class="menu"><a href="semi.do?command=board_qna">상품문의</a> 
					<%
 					if (dto == null) {
 					%>
					<li class="li_right" id="login"><a class="li_rigit_a" href="semi.do?command=login">로그인</a></li>
					<%
					} else {
					%>
					<li class="li_right"><a class="li_rigit_a" href="semi.do?command=logout">로그아웃</a> 
					<%
 					}
 					%>
					<li class="li_right"><a class="li_rigit_a" href="semi.do?command=signup">회원가입</a></li>

				</ul>
			</nav>

		</header>
		<h1>동물병원 지도</h1>

		<div id="map" style="width: 500px; height: 400px;"></div>
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

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			<c:forEach items="${list }" var="h_dto">
			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'${h_dto.hospital_addr}',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">${h_dto.hospital_name}</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
			</c:forEach>
		</script>
	</div>
</body>
</html>