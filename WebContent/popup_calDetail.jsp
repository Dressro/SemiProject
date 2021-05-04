<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Family|Pet</title>
</head>
<body>
<h1>detail</h1>
	<form action="semi.do">
		<input type="hidden" name="command" value="calUpdate">
		<input type="hidden" name="member_id" value="${m_c_dto.member_id }">
		<input type="hidden" name="cal_no" value="${m_c_dto.cal_no }">
		<table>
			<tr>
				<th>제목</th>
				<td>${m_c_dto.cal_title }</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>${m_c_dto.cal_mdate }</td>
			</tr>
			<tr>
				<th>작성날짜</th>
				<td><fmt:formatDate value="${m_c_dto.cal_regdate  }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${m_c_dto.cal_content }</td>
			</tr>
		</table>

		<input type="submit" value="수정">
		<input type="button" class="calDelete" name="${m_c_dto.cal_no }" value="삭제">
		<input type="button" value="취소" onClick="window.close()">
	</form>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".calDelete").click(function(){
				var cal_no = $(this).attr("name");
				
				$.ajax({
					type:"post",
					url: "semi.do?command=calDelete",
					data: {
						cal_no : cal_no
					},
					success: function(){
						alert("일정 삭제 성공");
						window.close();
					}
				});
			});
		});
	</script>

</body>
</html>