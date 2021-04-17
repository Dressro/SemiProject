<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>

	<div>
		<h1>Join Us</h1>
		<div id="join_container">
		<div class="box">
			<input type="button" value="일반회원" onclick="location.href='general_signup.jsp'">
		</div>
		<div class="box">
			<input type="button" value="전문의 회원" onclick="location.href='doctor_signup.jsp'">
		</div>
		</div>
	</div>
	
</body>
</html>