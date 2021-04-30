<%@page import="com.project.fp.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var op = document.getElementId("inputGroupSelect03");
	}
	function goback() {
		window.history.back();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
	if (dto == null) {
		pageContext.forward("index.html");
	}
	String category = (String) request.getAttribute("category");
	%>
	<h3>BOARD_INSERTFORM</h3>
	<form action="semi.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_id" value="<%=dto.getMember_id()%>" />
		<input type="hidden" name="command" value="board_insertres" />
		<div class="container">
			<div class="content" style="width: 70%">
				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<input type="text" class="form-control" name="board_title" size="100" placeholder="제목을 입력해주세요.">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03" name="board_category">
								<c:choose>
									<c:when test="${category eq 'N' }">
										<option value="N" selected="selected">공지사항</option>
									</c:when>
									<c:when test="${category eq 'F' }">
										<option value="F" selected="selected">자유게시판</option>
									</c:when>
									<c:when test="${category eq 'Q' }">
										<option value="Q" selected="selected">상품문의</option>
									</c:when>
									<c:when test="${category eq 'D' }">
										<option value="D" selected="selected">실종신고</option>
									</c:when>
								</c:choose>
							</select>
						</div>
					</div>

				</div>

				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content" name="board_content"></textarea>
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
							<button type="submit" class="btn btn-outline-secondary" style="float: right; width: 10%; font-weight: bold; margin-right: 10px;">등 록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="bottom.jsp" />
</body>
</html>