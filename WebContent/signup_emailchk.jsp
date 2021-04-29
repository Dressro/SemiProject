<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
<link rel="icon" href="resources/images/logo/favicon.ico" type="image/x-icon">
</head>
<body>
	<%
		String key = (String) request.getAttribute("content");
	%>
	인증번호입력!
	<br/>
	<form action="semi.do" method="post">
		<input type="hidden" name="command" value="mailcheck" />
		<input type="hidden" name="AuthenticationKey" value="<%=key%>"/>
		<input type="text" name="AuthenticationUser" />
		<br/>
		<input type="submit" value="확인" />
	</form>	
</body>
</html>