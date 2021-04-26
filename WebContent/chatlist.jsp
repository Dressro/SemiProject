<%@page import="com.project.fp.dto.ChatDto"%>
<%@page import="java.util.List"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/head.css" rel=stylesheet type="text/css" />
<link href="resources/css/footer.css" rel=stylesheet type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.mymenus li').click(function() {
			$('.mymenus li').find('a').removeClass('active');
			$(this).find('a').addClass('active');
			$('.mypage').hide();
			var i = $(this).index();
			$('.mypage').eq(i).show();
		});
		$('.mymenus li').eq(0).trigger('click');
	});
</script>
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
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
					<%
 					if (dto == null) {
 					%>
					<li class="menu"><a href="semi.do?command=chatlist">채팅</a> 
					<%
					 } else {
 					%>
					<li class="menu"><a href="semi.do?command=chatlist&member_id=<%=dto.getMember_id()%>">채팅</a> 
					<%
 					}
 					%> <%--
					<li class="menu"><a href="semi.do?command=test">test</a>
					 --%>
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

		<div>
			<section>
				<nav>
					<ul class="mymenus">
						<li><a class="mymenu" href="#">전문의</a></li>
						<li><a class="mymenu" href="#">채팅방</a></li>
					</ul>
				</nav>

			</section>
			<div>
				<section class="mypage">전문의 리스트</section>
			</div>
			<div>
				<section class="mypage">
					<table border="1">
						<col width="100px">
						<col width="500px">
						<col width="300px">

						<tr>
							<th>이름</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
						<c:choose>
							<c:when test="${empty c_list }">
								<tr>
									<th colspan="3">----------채팅방이 존재 하지 않습니다.----------</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${c_list }" var="dto">
									<tr>
										<td>${dto.member_id }</td>
										<td>
											<a href="semi.do?command=chatboard">${dto.ch_name }</a>
										</td>
										<td>${dto.ch_date }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</section>
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