<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
</head>
<style>
.footer_chat {
	width: 80px;
	position: fixed;
	z-index: 30;
	margin-left: 90%;
}
</style>

<script type="text/javascript">
	$(function() {
		stickyFooter();
		$(window).scroll(stickyFooter).resize(stickyFooter);
	});

	function stickyFooter() {
		document_height = $(document).height(); // 문서 전체 높이
		document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
		window_height = $(window).height(); // 창 높이
		footer_height = $("footer").height();

		gap = document_height - footer_height - window_height;
		bottom = document_scrollTop - gap;

		if (document_scrollTop > gap) {
			$(".footer_chat").css("bottom", bottom + "px");
		} else {
			$(".footer_chat").css("bottom", "0");
		}
	}
</script>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>
	<div class="footer_chat">
		<a href="semi.do?command=chatlist&member_id=<%=dto.getMember_id()%>&member_grade=<%=dto.getMember_grade()%>">
			<img src="resources/images/icon/chatimg.png" onmouseover="this.src='resources/images/icon/chatimg2.png';" onmouseout="this.src='resources/images/icon/chatimg.png';" />
		</a>
	</div>
</body>
<footer class="footer">
	<div class="container">
		<div class="footer__options">
			<div class="row">
				<div class="col-lg-2 col-md-3">
					<div class="footer__widget">
						<h4>Company</h4>
						<ul>
							<li>About us</li>
							<li>Servcies</li>
							<li>Contact us</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-3">
					<div class="footer__widget">
						<h4>Account</h4>
						<ul>
							<li>My cart</li>
							<li>Wisslist</li>
							<li>Login/Register</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer__newslatter">
						<h4>New</h4>
						<p>Subcribe to our newsletter to get more free tips. No Spam, Promise.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="footer__widget footer__widget--address">
						<h4>Get in touch</h4>
						<ul>
							<li>69 North Cleveland Street, Memphis,USA.</li>
							<li>(123) 1234 1234 - (012) 1111 2222</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="footer__copyright">
			<div class="row">
				<div class="col-lg-12 text-center">

					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This is made with by
						<a href="">Family Pet</a>
					</p>

				</div>
			</div>
		</div>
	</div>
</footer>

</html>