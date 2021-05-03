<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Family|Pet</title>
</head>
<body>

	<form action="semi.do" method="post">
		<input type="hidden" name="command" value="private_insertres">
		
		<h3>일정 등록하기</h3>
		
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			
			<tr>
				<th>일정</th>
				<td>
					<input type="datetime-local" name="">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content"></textarea></td>
			</tr>
		
		</table>
		
		<input type="submit" name="" value="완료">
		<input type="button" value="취소" onClick="window.close()">
	</form>

</body>
</html>