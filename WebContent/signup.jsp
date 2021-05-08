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
		display: flex;
		padding: 50px;
		margin: 50px;
    	width: 300px;
    	border: 2px solid gray;
	}
	#join_container {
		margin-left: 270px;
		display: flex;
	    align-items: center;
	    height: 400px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp" />
	<div>
		<h3>Join Us</h3>
		<div id="join_container">
		<div class="box">
			<a href="semi.do?command=general_signup"><img src="resources/images/icon/user_signup.png"/> </a>
		</div>
		<div class="box">
			<a href="semi.do?command=doctor_signup"><img src="resources/images/icon/doctor_signup.png"/> </a>
		</div>
		</div>
	</div>
<jsp:include page="bottom.jsp" />	

</body>
</html>