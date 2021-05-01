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
<script type="text/javascript">

	function closewindow() {
		self.opener = self;
		window.close();
	}

</script>
</head>
<body>

	인증번호가 발송되었습니다.
	<input type="button" value="확인" onclick="closewindow();">
	
</body>
</html>