<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="semi.do">
		<input type="hidden" name="member_id" value="admin"/>
		<input type="hidden" name="member_password" value="admin"/>
		<input type="hidden" name="member_name" value="관리자"/>
		<input type="hidden" name="member_nicname" value="운영자"/>
		<input type="hidden" name="member_email" value="admin@naver.com"/>
		<input type="hidden" name="member_phone" value="010-1234-1234"/>
		<input type="hidden" name="member_addr" value="서울특별시 강남구 테헤란로14길 6, 4층"/>
		<input type="hidden" name="member_grade" value="관리자"/>
		<input type="hidden" name="member_animal" value="N"/>
		<input type="hidden" name="member_dr_info" value="앖음"/>
		<input type="hidden" name="member_notify" value="N"/>
		<input type="hidden" name="command" value="signupres"/>
		<input type="submit" value="관리자 계정 만들기"/>
		
		
	</form>
</body>
</html>