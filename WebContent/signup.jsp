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
<jsp:include page="header.jsp" />
	<div>
		<h3>Join Us</h3>
		<div id="join_container">
		<div class="box">
			<input type="button" value="일반회원" onclick="location.href='semi.do?command=general_signup'">
		</div>
		<div class="box">
			<input type="button" value="전문의 회원" onclick="location.href='semi.do?command=doctor_signup'">
		</div>
		</div>
	</div>
<jsp:include page="bottom.jsp" />	
</body>
</html>