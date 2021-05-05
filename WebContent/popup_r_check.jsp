<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Family|Pet</title>


<style type="text/css">
	.calInsert, .btn_cancel{
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
	
	.calInsert:hover{
		background-color: #e83e8c;
	}
	
	.btn_cancel:hover{
		background-color: #e83e8c;
	}
	
	#title{
		background: #F9F7F6; border-left: 0.5em solid #8E0370; padding: 0.5em;
	}
	
	.cal_date{
		margin-left: 40px;
	}
</style>



</head>
<body>

		<h3 id="title">정기검진 등록</h3>
		
		<p>⊙ 정기검진 받은 날짜를 입력해주세요</p>
		<input type="date" name="checkup_date" class="cal_date">
		<br>
		<p>⊙ 다음 정기검진은 위에 입력한 날짜로부터 <input type="text" class="r_cycle" name="checkup_cycle" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">일 뒤에 일정을 등록합니다.</p>
		<br>
		<input type="button" class="calInsert" name="${member_id }" value="완료">
		<input type="button" class="btn_cancel" value="취소" onClick="window.close()">

	
		<script type="text/javascript">
			$(document).ready(function(){
				$(".calInsert").click(function(){
					var member_id = $(this).attr("name");
					var cal_date = $(".cal_date").val();
					var r_cycle = $(".r_cycle").val();
					
					$.ajax({
						type:"post",
						url: "semi.do?command=checkup_insertres",
						data: {
							member_id : member_id,
							cal_date : cal_date,
							r_cycle : r_cycle
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