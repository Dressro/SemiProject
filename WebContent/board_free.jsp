<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		// .submit : submit 이벤트가 발생될 때, 실행
		$("#muldelform").submit(function() {
			if ($("#muldelform input:checked").length == 0) {
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});
	});

	//이름이 all인 checkbox의 값을 가지고, 모든 chk의 checkbox 값들을 변경! (true / false)
	function allCheck(bool) {
		var chks = document.getElementsByName("board_no");
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = bool;
		}
	}
	// 체크박스 개별 선택
</script>
</head>
<body>

	<h1>자유게시판</h1>
	<form action="semi.do" method="post" id="muldelform">
		<input type="hidden" name="command" value="board_delete">
		<table border="1">
			<col width="30px" />
			<col width="50px">
			<col width="100px">
			<col width="500px">
			<col width="300px">

			<tr>
				<th><input type="checkbox" name="all" onclick="allCheck(this.checked);" /></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="5">----------작성된 글이 존재하지 않습니다----------</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>
								<input type="checkbox" name="board_no" value="${dto.board_no }">
							</td>
							<td>${dto.board_free_no }</td>
							<td>${dto.member_id }</td>
							<td>
								<c:forEach begin="1" end="${dto.board_titletab }">
								&nbsp;
							</c:forEach>
								<a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a>
							</td>
							<td>${dto.board_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="글작성" onclick="location.href='semi.do?command=board_insertform'" />
					<input type="submit" value="삭제" onclick="chkcheck();" />
				</td>
			</tr>
		</table>


		<jsp:include page="/board_paging.jsp">
			<jsp:param value="${BoardCommand }" name="command" />
			<jsp:param value="${Pdto.nowBlock}" name="nowBlock" />
			<jsp:param value="${Pdto.blockBegin }" name="blockBegin" />
			<jsp:param value="${Pdto.blockEnd }" name="blockEnd" />
			<jsp:param value="${Pdto.nowPage}" name="nowPage" />
			<jsp:param value="${Pdto.blockBegin}" name="blockBegin" />
			<jsp:param value="${Pdto.blockEnd}" name="blockEnd" />
			<jsp:param value="${Pdto.totalBlock}" name="totalBlock" />
		</jsp:include>


	</form>

</body>
</html>