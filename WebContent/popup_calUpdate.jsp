<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Family|Pet</title>
<style type="text/css">
	#title{
		background: #F9F7F6; border-left: 0.5em solid #8E0370; padding: 0.5em;
	}
	.calUpdate, .btn_cancel{
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
	
	.btn_cancel:hover{
		background-color: #e83e8c;
	}
</style>
</head>
<body>

	<h3 id="title">일정 수정하기</h3>
	
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" class="cal_title" name="title"></td>
			</tr>
			
			<tr>
				<th>일정</th>
				<td>
					<input type="datetime-local" class="cal_date" name="private_date">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" class="cal_content" name="content"></textarea></td>
			</tr>
		
		</table>
		<br>
		<input type="button" class="calUpdate" name="${cal_no }" value="완료">
		<input type="button" class="btn_cancel" value="취소" onClick="window.close()">

	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".calUpdate").click(function(){
				var cal_no = $(this).attr("name");
				var cal_title = $(".cal_title").val();
				var cal_date = $(".cal_date").val();
				var cal_content = $(".cal_content").val();
				
				$.ajax({
					type:"post",
					url: "semi.do?command=calUpdateRes",
					data: {
						cal_no : cal_no,
						cal_title : cal_title,
						cal_date : cal_date,
						cal_content : cal_content
					},
					success: function(){
						alert("일정 수정 성공");
						opener.location.reload();
						window.close();
					}
				});
			});
		});
		
	</script>
	


</body>
</html>