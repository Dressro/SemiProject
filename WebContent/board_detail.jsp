<%@page import="com.project.fp.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		var text_html = $("textarea").html();
		var find_html_1 = "&lt;img";
		var find_html_2 = "&gt;"
		if(text_html.indexOf(find_html_1)!=-1){
			var i = text_html.split(find_html_1);
			var j = i[1].split(find_html_2);
			var res =  "<img"+j[0] + ">";
			alert(res);
			$("text").append(res);
		}
	});
</script>
</head>
<body>
<% BoardDto dto = (BoardDto)request.getAttribute("dto"); %>	
	<h1>Detail</h1>
	
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="<%=dto.getMember_id()%>" />
		<input type="hidden" name="command" value="board_insertres" />
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						닉&nbsp;네&nbsp;임&nbsp; : <input type="text" name="member_id" value="<%=dto.getMember_id() %>" readonly="readonly">
						<div class="input-group mb-3">
							
							제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : <input type="text" class="form-control" name="board_title" size="100" value="<%=dto.getBoard_title()%>" readonly="readonly">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							카테고리 :
							<%if(dto.getBoard_category().equals("F")){ %> 
							<input type="text" name="board_category" value="자유게시판" readonly="readonly">
							<%} else if(dto.getBoard_category().equals("N")){ %>
							<input type="text" name="board_category" value="공지사항" readonly="readonly">
							<%} else if(dto.getBoard_category().equals("Q")){ %>
							<input type="text" name="board_category" value="상품문의" readonly="readonly">
							<%} else if(dto.getBoard_category().equals("D")){ %>
							<input type="text" name="board_category" value="실종신고" readonly="readonly">
							<%} %>
						</div>
						<div align="right">
							<a href="#">다운로드</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<div contentEditable="true" id="text" style="border: 1">
 					 		<%=dto.getBoard_content() %>
							</div>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="goback();">수  정</button>
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">삭  제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>