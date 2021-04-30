<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
<style type="text/css">

	.box{
		padding: 100px;
		margin: 50px;
    	width: 48%;
    	text-align: center;
    	border: 6px solid black;
	}
	#join_container {
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    height: 600px;
	}
</style>
<script type="text/javascript"></script>
<script type="text/javascript">

<%
MemberDto dto = (MemberDto) request.getAttribute("dto");
%>
	function sns_general_signup(){
	
		var form = document.createElement('form');
		var objs_1;
		objs_1 = document.createElement('input');
		objs_1.setAttribute('type', 'hidden');
		objs_1.setAttribute('name', 'member_id');
		objs_1.setAttribute('value', "<%=dto.getMember_id() %>");
		form.appendChild(objs_1);
			var objs_4 = document.createElement('input');
			objs_4.setAttribute('type', 'hidden');
			objs_4.setAttribute('name', 'command');
			objs_4.setAttribute('value', 'sns_general_signup');
			form.appendChild(objs_4);
		form.setAttribute('method', 'post');
		form.setAttribute('action', "semi.do");
		document.body.appendChild(form);
		form.submit();
	}
	function sns_doctor_signup(){
		
		var form = document.createElement('form');
		var objs_1;
		objs_1 = document.createElement('input');
		objs_1.setAttribute('type', 'hidden');
		objs_1.setAttribute('name', 'member_id');
		objs_1.setAttribute('value', "<%=dto.getMember_id() %>");
		form.appendChild(objs_1);
			var objs_4 = document.createElement('input');
			objs_4.setAttribute('type', 'hidden');
			objs_4.setAttribute('name', 'command');
			objs_4.setAttribute('value', 'sns_doctor_signup');
			form.appendChild(objs_4);
		form.setAttribute('method', 'post');
		form.setAttribute('action', "semi.do");
		document.body.appendChild(form);
		form.submit();
	}
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<div>
		<h1>SNS Join Us</h1>
		<div id="join_container">
		<div class="box">
			<input type="button" value="일반회원" onclick="sns_general_signup();">
		</div>
		<div class="box">
			<input type="button" value="전문의 회원" onclick="sns_doctor_signup();">
		</div>
		</div>
	</div>
<jsp:include page="bottom.jsp" />	
</body>
</html>