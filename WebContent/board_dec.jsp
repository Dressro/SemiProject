<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/board_1.css">
<link rel="stylesheet" href="resources/css/board_2.css">
<link rel="stylesheet" href="resources/css/board_3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400" />
<link rel="stylesheet" href="resources/css/search.css" />
<style type="text/css">
#map {
	width: 100%;
	height: 400px;
	margin-bottom: 15px;
	margin-top: 25px;
}
.s-btn {
	border: none;
	display: inline-block;
	padding: 5px 5px 5px 8px;
	background: #f45d96;
	font-size: 14px;
	color: #ffffff;
	font-weight: 600;
	letter-spacing: 4px;
	text-transform: uppercase;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="content">
	
		<div class="container">
			<h2 class="mb-5">실종신고 게시판</h2>

		<div id="map"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cb234998221d5b514c1db1f8c50cf56"></script>
		<script>
			// 지도 부분 아직 수정중!!
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.39499668220212, 127.11097793665814), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
		
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition,
			    clickable: true
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">실종신고<br><a href="semi.do?command=dec_detail&board_no="+${} style="color:blue" target="_blank">게시글보러가기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
			    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다; 

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
			    
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
		</script>
		
		</div>
		
		<div style="float: right;">
			<select data-trigger="" name="choices-single-defaul" class="search_category" style="padding: 3.5px;">
				<option selected value="T_C">제목+내용</option>
				<option value="W">작성자</option>
				<option value="T">제목만</option>
			</select>
			<input id="search" type="text" class="search_text" value="" />
			<button class="s-btn" type="button" onclick="search();">검색</button>
		</div>
		
		<div class="table-responsive">
				<form action="semi.do" method="post" id="muldelform">
					<input type="hidden" name="command" value="board_All_delete">
					<input type="hidden" name="userNicname" value="${dto.member_nicname }">
					<input type="hidden" name="userGrade" value="${dto.member_grade }">
					<input type="hidden" name="where" value="board_free">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" name="all" onclick="allCheck(this.checked);" /></th>
								<th scope="col">번호</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<th colspan="6">----------작성된 글이 존재하지 않습니다----------</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list }" var="dto">
										<tr>
											<td>
												<input type="checkbox" name="board_no" value="${dto.board_no }">
											</td>
											<td>${dto.board_free_no }</td>
											<td>${dto.member_id }</td>
											<td class="text-ellipsis">
												<c:forEach begin="1" end="${dto.board_titletab }">
										&nbsp;
									</c:forEach>
												<a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a>
											</td>
											<td>${dto.board_readcount }</td>
											<td>
												<fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd" />
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${dto ne null }">
								<tr>
									<td colspan="6" style="text-align: right;">
										<input type="button" class="s-btn" value="글작성" onclick="location.href='semi.do?command=dec_insert'" />
										<input type="submit" class="s-btn" value="삭제" onclick="chkcheck();" />
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</form>
		
		</div>
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>