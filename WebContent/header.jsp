<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
<style type="text/css">
	a{
		color:#111111;
	}
</style>
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
<li><a href="semi.do?command=shopping">쇼핑</a>
<li><a href="semi.do?command=board_qna">상품문의</a>

<%
if (dto == null) {
%>
					<li id="login"><a class="li_rigit_a" href="semi.do?command=login">로그인</a></li>
					<li><a href="semi.do?command=signup">회원가입</a></li>
<%
} else {
		if(dto.getMember_grade().equals("관리자")){%>
					<li><a href="semi.do?command=chatlist&member_id=<%=dto.getMember_id()%>&member_grade=<%=dto.getMember_grade()%>">채팅</a>
					<li><a href="semi.do?command=adminpage">관리자페이지</a>
					<li><a href="semi.do?command=logout">로그아웃</a> 
					
<%

		}else{
%>
					<li><a href="semi.do?command=chatlist&member_id=<%=dto.getMember_id()%>&member_grade=<%=dto.getMember_grade()%>">채팅</a>
					<li><a href="semi.do?command=mypage&member_id=<%=dto.getMember_id()%>">마이페이지</a>
					<li><a href="semi.do?command=basket&member_id=<%=dto.getMember_id()%>">장바구니</a>
					<li><a href="semi.do?command=logout">로그아웃</a> 
<%		} 
	}%>
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
<div class="canvas__open"><i class="fa fa-bars"></i></div>
</header>

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