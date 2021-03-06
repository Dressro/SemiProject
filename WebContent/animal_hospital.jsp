<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.HospitalDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#map {
	width: 100%;
	height: 400px;
	margin-bottom: 15px;
	margin-top: 25px;
}

#animal_mid_con {
	width: 1200px;
	margin: 0 auto;
	min-height: 1000px;
}

#animal_hospital_search_div {
	position: relative;
	height: 50px;
}

.animal_hospital_search {
	display: inline-block;
	background: #fff;
	height: 20px;
	width: 50%;
	border: solid 1px #dadada;
	padding: 13px;
	margin-left: 300px;
}

.animal_hospital_search_text {
	display: inline-block;
	height: 25px;
	width: 85%;
	border: none;
	font-size: 15px;
	padding-right: 30px;
	padding-left: 10px;
}

.animal_hospital_name {
	padding: 10px;
}

.animal_hospital_name_ul {
	
}

.animal_hospital_list {
	height: 100px;
	width: 100%;
	border-top: 1px solid #dadada;
}

.animal_hospital_list:hover {
	background: #e2e2e2;
}

.animal_hospital_list:last-child {
	border-bottom: 1px solid #dadada;
}

.animal_hospital_list_div {
	float: left;
	line-height: 35px;
	text-align: center;
	width: 100px;
	height: 100%;
}

.animal_hospital_list_info {
	padding: 5px;
	font-size: 14px;
	font-weight: bolder;
}

#paging {
	text-align: center;
	font-size: 20pt;
}

#paging a {
	font-size: 20pt;
}

a {
	color: #f45d96;
}
.hospital_img{
	width: 100px;
	height: 100px;
}
</style>


</head>
<body>

	<jsp:include page="header.jsp" />

	<div id="animal_mid_con">

		<div class="col-lg-12">
			<div class="cart__coupon">
				<form action="semi.do" method="post">
					<input type="hidden" name="command" value="animal_hospital_search" />
					<input type="text" name="hospitial_name" placeholder="???????????? ??????" value="">
					<button type="submit">??????</button>
				</form>
			</div>
		</div>
		<div id="map"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56"></script>



		<script>
			
		<%--
			var latitude = 0;
			var longitude = 0;
			if (navigator.geolocation) { // GPS??? ????????????
				navigator.geolocation.getCurrentPosition(function(position) {
					alert(position.coords.latitude + ' '
							+ position.coords.longitude);
					latitude = position.coords.latitude;
					longitude = position.coords.longitude;
					alert(latitude + ' ' + longitude);
				}, function(error) {
					console.error(error);
				}, {
					enableHighAccuracy : false,
					maximumAge : 0,
					timeout : Infinity
				});
			} else {
				alert('GPS??? ???????????? ????????????');
			}
			alert(latitude + ' ' + longitude);
			--%>
			var mapContainer = document.getElementById('map'), // ????????? ????????? div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
				level : 3
			// ????????? ?????? ??????
			};

			// ????????? ???????????????    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			// ??????-?????? ?????? ????????? ???????????????
			var geocoder = new kakao.maps.services.Geocoder();
			<c:forEach items="${list }" var="h_dto">
			// ????????? ????????? ???????????????
			geocoder
					.addressSearch(
							'${h_dto.hospital_addr}',
							function(result, status) {
								// ??????????????? ????????? ??????????????? 
								if (status === kakao.maps.services.Status.OK) {
									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// ??????????????? ?????? ????????? ????????? ???????????????
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
									// ?????????????????? ????????? ?????? ????????? ???????????????
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">${h_dto.hospital_name}</div>'
											});
									infowindow.open(map, marker);
									map.setCenter(coords);
								}
							});
			</c:forEach>
			geocoder
					.addressSearch(
							'????????? ???????????? 14??? 6',
							function(result, status) {
								// ??????????????? ????????? ??????????????? 
								if (status === kakao.maps.services.Status.OK) {
									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// ??????????????? ?????? ????????? ????????? ???????????????
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
									// ?????????????????? ????????? ?????? ????????? ???????????????
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">??? ??????</div>'
											});
									infowindow.open(map, marker);
									map.setCenter(coords);
								}
							});
		</script>

		<div>
			<div>
				<div class="animal_hospital_name">
					<h3>????????????</h3>
				</div>
				<div class="animal_hospital_name">
					<ul class="animal_hospital_name_ul">
						<c:forEach items="${list }" var="h_dto">
							<li class="animal_hospital_list" onclick="animal_hospital_loc('${h_dto.hospital_addr}');">
								<div class="animal_hospital_list_div">
									<img class="hospital_img" alt="img" src="resources/images/Hospital/${h_dto.hospital_num }.png">
								</div>
								<div class="animal_hospital_list_info">
									<span>${h_dto.hospital_addr}</span>
								</div>
								<div class="animal_hospital_list_info">
									<span>${h_dto.hospital_name}</span>
								</div>
								<div class="animal_hospital_list_info">
									<span>${h_dto.hospital_phone}</span>
								</div>
							</li>

						</c:forEach>
					</ul>
				</div>
			</div>
			<jsp:include page="/animal_hospital_paging.jsp">
				<jsp:param value="${Animal_hospital_Command }" name="command" />
				<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
				<jsp:param value="${Pdto.blockBegin }" name="blockBegin" />
				<jsp:param value="${Pdto.blockEnd }" name="blockEnd" />
				<jsp:param value="${Pdto.nowPage}" name="nowPage" />
				<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
				<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
				<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
			</jsp:include>
		</div>
		<script type="text/javascript">
			function animal_hospital_loc(loc) {
				var location = loc
				var geocoder = new kakao.maps.services.Geocoder();

				// ????????? ????????? ???????????????
				geocoder.addressSearch(location, function(result, status) {

					// ??????????????? ????????? ??????????????? 
					if (status === kakao.maps.services.Status.OK) {

						var coords = new kakao.maps.LatLng(result[0].y,
								result[0].x);

						// ????????? ????????? ??????????????? ?????? ????????? ??????????????????
						map.setCenter(coords);
					}
				});
			}
		</script>
	</div>

	<jsp:include page="bottom.jsp" />
</body>
</html>