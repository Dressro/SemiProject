<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Family|Pet</title>
</head>
<body>

		<h3>일정 등록하기</h3>
		
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" class="cal_title" name="title"></td>
			</tr>
			
			<tr>
				<th>일정</th>
				<td>
					<input type="date" class="cal_date" name="private_date">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" class="cal_content" name="content"></textarea></td>
			</tr>
		
		</table>
		
		<input type="button" class="calInsert" name="${member_id }" value="완료">
		<input type="button" value="취소" onClick="window.close()">

	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".calInsert").click(function(){
				var member_id = $(this).attr("name");
				var cal_title = $(".cal_title").val();
				var cal_date = $(".cal_date").val();
				var cal_content = $(".cal_content").val();
				
				$.ajax({
					type:"post",
					url: "semi.do?command=private_insertres",
					data: {
						member_id : member_id,
						cal_title : cal_title,
						cal_date : cal_date,
						cal_content : cal_content
					},
					success: function(){
						alert("일정 등록 성공");
						opener.location.reload();
						window.close();
					}
				});
			});
		});
		
	</script>

</body>
</html>