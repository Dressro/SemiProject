<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function goback() {
		window.history.back();
	}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
#map {
	width: 1000px;
	height: 400px;
	margin-bottom: 15px;
	margin-top: 25px;
	margin-left: 150px;
}
</style>

</head>
<body>


<jsp:include page="header.jsp" />
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	if (dto == null) {
		pageContext.forward("index.html");
	}
	%>
<h3>실종신고_insertform</h3>

<form action="semi.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="<%=dto.getMember_id()%>" />
	<input type="hidden" name="command" value="board_insertres" />
	<input type="hidden" name="board_category" value="D">

	
	<div class="container">
			<div class="content" style="margin-right: 250px;">
				<div style="margin-left: 150px;">
				<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03" name="board_category">
								<c:choose>
									<c:when test="${category eq 'N' }">
										<option value="N" selected="selected">공지사항</option>
									</c:when>
									<c:when test="${category eq 'F' }">
										<option value="F" selected="selected">자유게시판</option>
									</c:when>
									<c:when test="${category eq 'Q' }">
										<option value="Q" selected="selected">상품문의</option>
									</c:when>
									<c:when test="${category eq 'D' }">
										<option value="D" selected="selected">실종신고</option>
									</c:when>
								</c:choose>
							</select>
						</div>
					</div>
				<div class="col-sm-9">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="board_title" size="100" placeholder="제목을 입력해주세요.">
					</div>
				</div>

			</div>


		
		<br/><br/>
		
		<p style="margin-left: 150px;">실종 위치를 찾아 아래 지도에 표시해주세요</p>
		<div id="map"></div>
		<div id="clickLatlng"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.39499668220212, 127.11097793665814), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
					
			// 지도를 클릭한 위치에 표출할 마커입니다
			var marker = new kakao.maps.Marker({ 
				// 지도 중심좌표에 마커를 생성합니다 
				position: map.getCenter() 
			}); 
			// 지도에 마커를 표시합니다
			marker.setMap(map);
			
			
			var lost_latitude;
			var lost_longitude;
			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {     
				 // 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng; 
				 // 마커 위치를 클릭한 위치로 옮깁니다
				 marker.setPosition(latlng);
				
				 lost_latitude = latlng.getLat();
				 lost_longitude = latlng.getLng();
				
				 var latLng = '<input type="hidden" name="lost_latitude" value="'+lost_latitude+'"> '
				            + '<input type="hidden" name="lost_longitude" value="'+lost_longitude+'">';
				            
				 var resultDiv = document.getElementById('clickLatlng'); 
				 resultDiv.innerHTML = latLng;

			});
		</script>

		
		<div style="margin-left: 150px;">
			<div class="col_c" style="margin-bottom: 30px">
				<div class="input-group">
					<textarea class="form-control" id="p_content" name="board_content">
						<p>반려 동물 이름 : </p>
						<br>
						<br>
						<br>
						<p>반려 동물 특징 :</p>
					</textarea>
					<script type="text/javascript">
						CKEDITOR.replace('p_content', {
							height : 500,
							width : 700
						});
					</script>
				</div>
			</div>
		</div>
		
		<div style="margin-left: 150px;">
			<div class="input-group mb-3">
				<div class="custom-file">
					&nbsp;
					<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
					<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="goback();">취 소</button>
					<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">등 록</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</form>




	<jsp:include page="bottom.jsp" />
</body>
</html>