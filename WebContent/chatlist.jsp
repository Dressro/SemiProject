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
<style type="text/css">
#chat_mid{
	width: 1200px;
	margin: 0 auto;
	min-height: 1000px;
}
.Doctor_ul {
	border: 1px solid black;
}

.Doctor_list {
	height: 100px;
	width: 100%;
	border-top: 1px solid black;
}

.Doctor_list_div {
	float: left;
	line-height: 35px;
	text-align: center;
	width: 100px;
	height: 100%;
}

.Doctor_list_info {
	padding: 5px;
	font-size: 14px;
	font-weight: bolder;
}
</style>
</head>
<%
MemberDto dto = (MemberDto) session.getAttribute("dto");
String member_grade = (String) request.getAttribute("member_grade");
%>
<body>
	<jsp:include page="header.jsp" />
	<div id="semipage">
	
		<!-- 전문의 회원이 아닌 아이디 -->
		<input type="hidden" id="member_id" value="<%=dto.getMember_id()%>"/>
		<div id ="chat_mid">
			<section>
				<nav>
					<ul class="mymenus">
						<li><a class="mymenu" href="#">전문의</a></li>
						<li><a class="mymenu" href="#">채팅방</a></li>
					</ul>
				</nav>

			</section>
			<div>
				<section class="mypage">
						<c:choose>
							<c:when test="${empty m_list }">
								<span>현재 회원중에 전문의가 없습니다.</span>
							</c:when>
							<c:otherwise>
								<ul class = "Doctor_ul">
								<c:forEach items="${m_list }" var="m_dto">
									<li class="Doctor_list">
										<div class = "Doctor_list_div">
											img
										</div>
										<div class="Doctor_list_info">
											<span>${m_dto.member_name }</span>	
										</div>
										<div class="Doctor_list_info">
											<span>${m_dto.member_dr_info}</span>	
										</div>
										<div class="Doctor_list_info">
											<!-- 전문의 아이디 제공 -->
											<button type="button" name="chat_create" onclick="chat_create('${m_dto.member_id}');">채팅방 생성</button>
										</div>
									</li>
								</c:forEach>
								</ul>
							</c:otherwise>
						</c:choose>
				</section>
			</div>
			<script type="text/javascript">
			function chat_create(id) {
				var doctor_id = id;
				var member_id = $('#member_id').val();
				$.ajax({
					url:"semi.do",
					method:"post",
					data:{command:"chat_board_insert",member_id:member_id,doctor_id:doctor_id},
					dataType:"text",
					success: function(data){
						alert(data);
					},
					error(){
						alert("통신 실패");
					}
				});
			}
			</script>
			<div>
				<section class="mypage">
					<table border="1">
						<col width="500px">
						<col width="300px">

						<tr>
							<%
								if(member_grade.equals("개인")){
							%>
							<th>의사 ID</th>
							<%
								} else {
							%>
							<th>유저 ID</th>
							<%
								}
							%>
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
										<%
											if(member_grade.equals("개인")){
										%>
										<td>
											<a href="semi.do?command=chatboard&ch_num=${dto.ch_num }">${dto.doctor_id }</a>
										</td>
										<%
											} else {
										%>
										<td>
											<a href="semi.do?command=chatboard&ch_num=${dto.ch_num }">${dto.member_id }</a>
										</td>
										<%
											}
										%>
										<td>${dto.ch_date }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</section>
			</div>
		</div>

		<jsp:include page="bottom.jsp" />
	</div>
</body>
</html>