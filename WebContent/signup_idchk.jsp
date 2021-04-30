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
<script type="text/javascript">
	function confirmid(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("member_id")[0].title = "y";
			opener.document.getElementsByName("member_password")[0].focus();
		} else {
			opener.document.getElementsByName("member_id")[0].focus();
		}
		self.close();
	}
</script>
</head>
<body>
	<%
	MemberDto dto = (MemberDto)request.getAttribute("dto");
	boolean idchk = false;
	if(dto==null){
		idchk = true;
	}
	String member_id = request.getParameter("member_id");
	%>
	<table border="1">
		<tr>
			<td>
				<input type="text" value="<%=member_id%>" readonly="readonly" />
			</td>
		</tr>

		<%
		if (!idchk) {
		%>
		<tr>
			<td>
				<input type="text" value="아이디가 존재합니다" readonly="readonly" />
			</td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td>
				<input type="text" value="해당 아이디를 사용 가능합니다." readonly="readonly" />
			</td>
		</tr>
		<%
		}
		%>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirmid('<%=idchk%>')" />
			</td>
		</tr>
	</table>
</body>
</html>