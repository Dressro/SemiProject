<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="resources/css/board_1.css">
<link rel="stylesheet" href="resources/css/board_2.css">
<link rel="stylesheet" href="resources/css/board_3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400" />
<link rel="stylesheet" href="resources/css/search.css" />
<style type="text/css">
.s-btn {
	border: none;
	display: inline-block;
	padding: 5px 5px 5px 8px;
	background: #f45d96;
	font-size: 14px;
	color: #ffffff;
	font-weight: 600;
	letter-spacing: 4px;
	text-transform: uppercase;
}

#paging {
	text-align: center;
	font-size: 20pt;
}

#paging a {
	font-size: 20pt;
}

a {
	color: #f45d96;
}
</style>
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
	function search() {
		var s_c = $(".search_category option:selected").val();
		var s_t = $(".search_text").val();
		location.href = "semi.do?command=board_free&s_c=" + s_c + "&s_t=" + s_t +"&category=F";
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="content">

		<div class="container">
			<h2 class="mb-5">자유게시판</h2>
			<div style="float: right;">
				<select data-trigger="" name="choices-single-defaul" class="search_category" style="padding: 3.5px;">
					<option selected value="T_C">제목+내용</option>
					<option value="W">작성자</option>
					<option value="T">제목만</option>
				</select>
				<input id="search" type="text" class="search_text" value="" />
				<button class="s-btn" type="button" onclick="search();">검색</button>
			</div>

			<div class="table-responsive">
				<form action="semi.do" method="post" id="muldelform">
					<input type="hidden" name="command" value="board_All_delete">
					<input type="hidden" name="userNicname" value="${dto.member_nicname }">
					<input type="hidden" name="userGrade" value="${dto.member_grade }">
					<input type="hidden" name="where" value="board_free">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" name="all" onclick="allCheck(this.checked);" /></th>
								<th scope="col">번호</th>
								<th scope="col">작성자</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<th colspan="6">----------작성된 글이 존재하지 않습니다----------</th>
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
											<td class="text-ellipsis">
												<c:forEach begin="1" end="${dto.board_titletab }">
										&nbsp;
									</c:forEach>
												<a href="semi.do?command=board_detail&board_no=${dto.board_no }">${dto.board_title }</a>
											</td>
											<td>${dto.board_readcount }</td>
											<td>
												<fmt:formatDate value="${dto.board_regdate }" pattern="yyyy-MM-dd" />
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<c:if test="${dto ne null }">
								<tr>
									<td colspan="6" style="text-align: right;">
										<input type="button" class="s-btn" value="글작성" onclick="location.href='semi.do?command=board_insertform&category=F'" />
										<input type="submit" class="s-btn" value="삭제" onclick="chkcheck();" />
									</td>
								</tr>
							</c:if>
						</tbody>
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
			</div>
		</div>
	</div>
</head>
<jsp:include page="bottom.jsp" />

</body>
</html>
