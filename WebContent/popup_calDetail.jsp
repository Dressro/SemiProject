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
<style type="text/css">
	#title{
		background: #F9F7F6; border-left: 0.5em solid #8E0370; padding: 0.5em;
	}
	
	.calUpdate, .calDelete, .calCancel{
		width:60px;
		height:25px;
		background-color: #F4A3E2;
    	border: none;
    	color:#fff;
    	padding: 10px 0;
    	text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 13px;
    	margin: 1px;
    	cursor: pointer;
    	border-radius:10px;
    	line-height: 5px;
	}
	
	.calUpdate:hover{
		background-color: #e83e8c;
	}
	
	.calDelete:hover{
		background-color: #e83e8c;
	}
	
	.calCancel:hover{
		background-color: #e83e8c;
	}
	
	.tab {
		 border-collapse: collapse; line-height: 1.5; margin : 20px 10px;
	}
	
	.tab th {
		width: 90px; padding: 10px; font-weight: bold; vertical-align: top; border: 1px solid #ccc; text-align: center;
	}
	
	.tab td{
		 width: 500px; padding: 10px; vertical-align: top; border: 1px solid #ccc; text-align: left; word-break:break-all;
	}
</style>
</head>
<body>
	<h3 id="title">일정 확인</h3>
	<form action="semi.do">
		<input type="hidden" name="command" value="calUpdate">
		<input type="hidden" name="member_id" value="${m_c_dto.member_id }">
		<input type="hidden" name="cal_no" value="${m_c_dto.cal_no }">
		<table class="tab">
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
		<br>
		<input type="submit" class="calUpdate" value="수정">
		<input type="button" class="calDelete" name="${m_c_dto.cal_no }" value="삭제">
		<input type="button" class="calCancel" value="취소" onClick="window.close()">
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
						opener.location.reload();
						window.close();
					}
				});
			});
		});
	</script>

</body>
</html>