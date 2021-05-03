<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
</head>
<body>

	<form action="semi.do" method="post">
		<input type="hidden" name="command"	value="checkup_insertres">
		<input type="hidden" name="member_id" value="${member_id }">
		
		<h3>정기검진</h3>
		
		<p>정기검진 받은 날짜를 입력해주세요</p>
		<input type="date" name="checkup_date">
		<p>다음 정기검진은 위에 입력한 날짜로부터 <input type="text" name="checkup_cycle" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">일 뒤에 일정을 등록합니다.</p>
		
		<input type="submit" value="완료">
		<input type="button" value="취소" onClick="window.close()">
	</form>

</body>
</html>