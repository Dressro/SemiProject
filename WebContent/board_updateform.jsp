<%@page import="com.project.fp.dto.BoardDto"%>
<%@page import="com.project.fp.dto.File_TableDto"%>
<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
<% BoardDto b_dto = (BoardDto)request.getAttribute("b_dto");
   File_TableDto f_dto = (File_TableDto)request.getAttribute("f_dto");
%>		

	function goback() {
		window.history.back();
	}
	$(function(){
		$("option").attr("selected","false");
		$("#inputGroupSelect03").val('<%=b_dto.getBoard_category()%>').attr("selected","selected");
	})
</script>
</head>
<body>
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	if (dto == null) {
		pageContext.forward("index.html");
	}
	%>
	<h1>BOARD_UPDATEFORM</h1>
	<%=f_dto.getFile_ori_name() %>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="<%=b_dto.getMember_id()%>" />
		<input type="hidden" name="board_no" value="<%=b_dto.getBoard_no() %>"/>
		<input type="hidden" name="command" value="board_updateres" />
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="board_title" size="100" placeholder="제목을 입력해주세요." value="<%=b_dto.getBoard_title()%>">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03" name="board_category">
								<option selected>게시판을 선택해 주세요.</option>
								<option value="N">공지사항</option>
								<option value="F">자유게시판</option>
								<option value="Q">상품문의</option>
								<option value="D">실종신고</option>
							</select>
						</div>
					</div>

				</div>

				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content" name="board_content"><%=b_dto.getBoard_content() %></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="custom-file">
							&nbsp;
							<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
							<button type="button" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold" onclick="goback();">취 소</button>
							<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">수 정</button>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

</html>