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
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDto dto = (MemberDto)request.getAttribute("dto");
		String member_id = request.getParameter("member_id");
	%>
	<input type="text" value="<%=member_id %>" readonly="readonly"/>
	<br/>
	<%
		if(dto != null){
	%>
	<input type="text" value="아이디가 존재합니다" readonly="readonly"/>
	<%
		} else {
	%>
	<input type="text" value="해당 아이디를 사용 가능합니다." readonly="readonly"/>
	<%
		}
	%>
	<input type="button" value="확인" onclick=""/>
</body>
</html>